
function [] = CyclicPrefixTest(waveform, rmc, varargin)

    if (nargin==3)
      cpFraction = varargin{1};
    else
      cpFraction = 0.55;
    end
    
enb = rmc;

info=lteOFDMInfo(enb);
samplesPerSubframe=info.SamplingRate*0.001;

nFFT=double(info.Nfft);

% Get the cyclic prefix lengths for one slot for the cyclic prefix
% type specified in ENB.
cpLengths=double(info.CyclicPrefixLengths);
cpLengths=cpLengths(1:length(cpLengths)/2);

% Calculate the number of symbols in a slot from the cyclic prefix
% lengths, and the number of whole subframes in WAVEFORM.
nSymbols=length(cpLengths);
nSubframes=fix(size(waveform,1)/samplesPerSubframe);

% Calculate position of the first active subcarrier in the FFT output,
% and the total number of active subcarriers, according to the FFT
% size and number of resource blocks.
firstActiveSC=(nFFT/2)-(enb.NDLRB*6)+1;
totalActiveSC=enb.NDLRB*12;

% Create an empty output GRID of the correct size.
dims=lteDLResourceGridSize(enb,size(waveform,2));
dims(2)=dims(2)*nSubframes;
reGrid=zeros(dims);
idx=0:nFFT-1;


frame = waveform(1:10*samplesPerSubframe,:);
subframe1 = waveform(1:samplesPerSubframe,:);
offset = 0;
for slot=0:1
    for symbol=1:nSymbols
        cpLength=cpLengths(symbol);
%         s = slot*nSymbols + symbol;
        
        cp = waveform(1+offset:offset+cpLength);
        data = waveform(1 + offset + cpLength:offset + cpLength + nFFT);
        offset = offset + nFFT + cpLength;
        
        comp = zeros(cpLength,2);
        comp(:,1) = waveform(offset+1-cpLength:offset);
        comp(:,2) = cp;
        plot(1:cpLength,abs(comp(:,1)),'r',1:cpLength,abs(comp(:,2)), 'k');
        mse = (comp(:,1) - comp(:,2))'*(comp(:,1) - comp(:,2));
%         subplot(2,1,1);
%         plot(abs(cp));
%         subplot(2,1,2);
%         plot(abs(waveform(offset+1-cpLength:offset)));
    end
end

% For each subframe in WAVEFORM, each slot in a subframe and each
% symbol in a slot:
i=1;
offset=0;
for subframe=0:nSubframes-1
    for slot=0:1
        for symbol=1:nSymbols
            
            % Get cyclic prefix length in samples for the current symbol.
            cpLength=cpLengths(symbol);
            
            % Position the FFT part of the way through the cyclic
            % prefix; the value of cpFraction should ensure that the
            % reception is unaffected by the windowing applied in the
            % lteOFDMModulate function. Default is 55%.
            fftStart=fix(cpLength*cpFraction);
            
            % Create vector of phase corrections, one per FFT sample,
            % to compensate for FFT performed away from zero phase
            % point on the original subcarriers.
            phaseCorrection=repmat(exp(-1i*2*pi*(cpLength-fftStart)/nFFT*idx)',1,size(waveform,2));
            
            % Extract the appropriate section of WAVEFORM, perform the
            % FFT and apply the phase correction.
            fftOutput=fftshift(fft(waveform(offset+fftStart+(1:nFFT),:)).*phaseCorrection,1);
            
            % Extract the active subcarriers for each antenna from the
            % FFT output, removing the DC subcarrier (which is unused).
            activeSCs=fftOutput(firstActiveSC:firstActiveSC+totalActiveSC,:);
            activeSCs(totalActiveSC/2+1,:)=[];
            
            % Assign the active subcarriers into the appropriate column
            % of the received GRID, for each antenna.
            reGrid(OFDMSymbolIndices(reGrid,i))=activeSCs;
            
            % update counter of overall symbol number and position in
            % the input WAVEFORM.
            i=i+1;
            offset=offset+nFFT+cpLength;
        end
    end
end
end

%   OFDMSymbolIndices Generates indices for a given OFDM symbol of a resource array.
%   IND = OFDMSymbolIndices(GRID,SYMBOL) gives the indices for OFDM symbol number
%   SYMBOL of the resource array GRID, in per-antenna linear indices form.
function ind = OFDMSymbolIndices(reGrid,symbol)
nSCs = size(reGrid,1);
nAnts = size(reGrid,3);
firstSCs = sub2ind(size(reGrid),ones(1,nAnts),repmat(symbol,1,nAnts),1:nAnts);
ind = repmat(firstSCs,nSCs,1)+repmat((0:nSCs-1).',1,nAnts);
end
