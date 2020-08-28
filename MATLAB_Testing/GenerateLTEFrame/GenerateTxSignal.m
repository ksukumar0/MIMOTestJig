function [txWaveform, txGrid, enb, info] = GenerateTxSignal()

clear;
close all;
load variables.mat

enb.NDLRB = NRB;                % Number of resource blocks
enb.CellRefP = CellRefP;        % One transmit antenna port
enb.NCellID = NCellID;               % Cell ID
enb.CyclicPrefix = 'Normal';    % Normal cyclic prefix
enb.DuplexMode = 'FDD';         % FDD

% 
gridsize = lteDLResourceGridSize(enb);
K = gridsize(1);    % Number of subcarriers
L = gridsize(2);    % Number of OFDM symbols in one subframe
P = gridsize(3);    % Number of transmit antenna ports

% 
txGrid = [];

colorkeySet = {'sss','pss','crs','crs2','unused'};
colorValueSet = [6 9 15 19 1];
M = containers.Map(colorkeySet,colorValueSet);
frameColours = ones(totalSC ,totalSymbols);

% Number of bits needed is size of resource grid (K*L*P) * number of bits
% per symbol (2 for QPSK)
numberOfBits = K*L*P*2;

% Create random bit stream
inputBits = randi([0 1], numberOfBits, 1);

% Modulate input bits
inputSym = lteSymbolModulate(inputBits,'QPSK');

% For all subframes within the frame
for sf = 0:totalSubFrames-1

    % Set subframe number
    enb.NSubframe = mod(sf,10);
    
    % Generate Sync Sigs
    [subframe,pssInd,sssInd] = GenerateSyncSigs(enb, inputSym);
    
    frameColours(pssInd) = cell2mat(values(M,{'pss'}));
    frameColours(sssInd) = cell2mat(values(M,{'sss'}));
        
    % Generate cell specific reference signal symbols and indices
    cellRsSym = lteCellRS(enb);
    cellRsInd = lteCellRSIndices(enb);

    frameColours(sf*NRB*12*14 + cellRsInd(1:8*NRB)) = cell2mat(values(M,{'crs'}));
    frameColours(sf*NRB*12*14 + cellRsInd(8*NRB+1:8*NRB*2)-NRB*12*14) = cell2mat(values(M,{'crs2'}));
    
    % Map cell specific reference signal to grid
    subframe(cellRsInd) = cellRsSym;

    % Append subframe to grid to be transmitted
    txGrid = [txGrid subframe]; %#ok

end

cmap = colormap(jet(max(colorValueSet)));
imagesc(frameColours);
ylabel('Subcarriers');
xlabel('OFDM Symbols');
[txWaveform,info] = lteOFDMModulate(enb,txGrid);

clevels = colorValueSet;
N = length(clevels);
L = line(ones(N),ones(N), 'LineWidth',8);                   % Generate lines

% Set the colors according to cmap
set(L,{'color'},mat2cell(cmap( min(1+clevels,length(cmap) ),:),ones(1,N),3));

leg=legend(upper(colorkeySet));
% leg.FontSize = 8;

save txWaveform.mat txWaveform txGrid enb info;

end