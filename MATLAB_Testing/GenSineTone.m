function [SineSamplesx,SineSamplesy] = GenSineTone(Fs,NoOfSamples, Amplitude)

% close all;
% clear all;

Fs = cast(Fs,'double');
NoOfSamples = cast(NoOfSamples,'uint32');
Amplitude = double(Amplitude);

F0 = 1.2e6;
F1 = 800e3;

% t = linspace(0,NoOfSamples/Fs,NoOfSamples);
t = linspace(0,double(NoOfSamples-1)/Fs,NoOfSamples);

x = cos((2*pi)*F0*t) + cos((2*pi)*F1*t);
y = sin((2*pi)*F0*t) + sin((2*pi)*F1*t);

SineSamplesx = Amplitude*x;
SineSamplesy = Amplitude*y;

% SineSamples = SineSamples + Amplitude*cos((2*pi)*F1*t);
% plot(SineSamples);

SineSamplesx = double(SineSamplesx);
SineSamplesy = double(SineSamplesy);

end