function [output, Fs] = GenSineTone4Tx()

% close all;
% clear all;
Fs = 30.72e6;
FrameSize = Fs*0.01;
NoOfFrames = 2;
NoOfSamples = FrameSize*NoOfFrames;
Amplitude = [1.0 0.75 0.5 0.25];
Fs = cast(Fs,'double');
NoOfSamples = cast(NoOfSamples,'uint32');
Amplitude = double(Amplitude);

F0 = 1e5;
F1 = 2e5;
F2 = 3e5;
F3 = 4e5;

Fchosen = F1;

F0 = Fchosen;
F1 = Fchosen;
F2 = Fchosen;
F3 = Fchosen;

F = [F0 F1 F2 F3];
% phaseOffset = [0 pi/3 2*pi/3 pi];
phaseOffset = [0 0 0 0];

t = linspace(0,double(NoOfSamples-1)/Fs,NoOfSamples);
output = zeros(size(F,2),NoOfSamples);

count = 1;
for freqi = F
     output(count,:) = cos((2*pi)*freqi*t  + phaseOffset(count)) + 1i*sin((2*pi)*freqi*t + phaseOffset(count));
     count = count + 1;
end

output = diag(Amplitude)*output;
output = transpose(output);
end