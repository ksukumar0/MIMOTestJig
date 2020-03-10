function SineSamples = GenSineTone(Fs,NoOfSamples)

% close all;
% clear all;

F0 = 1e6;
F1 = 300e3;

t = 0:1/Fs:NoOfSamples/Fs;
SineSamples = cos((2*pi)*F0*t);
% SineSamples = SineSamples + cos((2*pi)*F1*t);
plot(SineSamples);

end