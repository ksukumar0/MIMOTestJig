Fs = 10e6;
FrameSize = Fs*0.001;
NoOfFrames = 1;
NoOfSamples = FrameSize*NoOfFrames;
Amplitude = [1.0 1 1 1];
Fs = cast(Fs,'double');
NoOfSamples = cast(NoOfSamples,'uint32');
Amplitude = double(Amplitude);

F0 = 100e3;

Fchosen = F0;

F0 = Fchosen;
F1 = Fchosen;
F2 = Fchosen;
F3 = Fchosen;

F0 = [F0 F1 F2 F3];
inputPhaseOffset = [0 0 0 0];
outputPhaseOffset = [pi/4 pi/3 2*pi/3 pi];

t = linspace(0,double(NoOfSamples-1)/Fs,NoOfSamples);
input = zeros(size(F0,2),NoOfSamples);
output = zeros(size(F0,2),NoOfSamples);

count = 1;
for freqi = F0
     input(count,:) = cos((2*pi)*freqi*t  + inputPhaseOffset(count)) + 1i*sin((2*pi)*freqi*t + inputPhaseOffset(count));
     output(count,:) = cos((2*pi)*freqi*t  + outputPhaseOffset(count)) + 1i*sin((2*pi)*freqi*t + outputPhaseOffset(count));
     count = count + 1;
end

samplesCutoff = 200;

input = diag(Amplitude)*input;
input = transpose(input);

output = diag(Amplitude)*output;
output = transpose(output);

input = input(1:samplesCutoff,:);
output = output(1:samplesCutoff,:);

USRPNos = [1 1 2 2];
RFChNos = [1 2 1 2];

for i=1:size(F0,2)
    subplot(4,2,2*(i-1)+1);
    plot(1:samplesCutoff,real(input(:,i)),'r',1:samplesCutoff,imag(input(:,i)),'b');
    xlabel('Samples')
    ylabel('Amplitude')
    title(sprintf('Input Tone USRP %d RF %d/TX1',USRPNos(i), RFChNos(i)));
    legend('I Signal', 'Q Signal', 'location', 'Northeast')

    subplot(4,2,2*i);
    plot(1:samplesCutoff,real(output(:,i)),'m',1:samplesCutoff,imag(output(:,i)),'g');
    xlabel('Samples')
    ylabel('Amplitude')
    title(sprintf('Output Tone USRP %d RF %d/RX2',USRPNos(i),RFChNos(i)));
    legend('I Signal', 'Q Signal', 'location', 'Northeast')
    
end


% plot(real(input(:,1)),