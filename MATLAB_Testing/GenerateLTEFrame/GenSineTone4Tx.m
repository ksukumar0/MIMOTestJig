function [output, Fs] = GenSineTone4Tx()

% close all;
% clear all;
Fs = 30.72e6;
FrameSize = Fs*0.01;
NoOfFrames = 2;
NoOfSamples = FrameSize*NoOfFrames;
Amplitude = 0.5;
Fs = cast(Fs,'double');
NoOfSamples = cast(NoOfSamples,'uint32');
Amplitude = double(Amplitude);

F0 = 1e6;
F1 = 2e6;
F2 = 3e6;
F3 = 4e6;

Fchosen = F1;

F0 = Fchosen;
F1 = Fchosen;
F2 = Fchosen;
F3 = Fchosen;

% F0 = 1.2e6;
% F1 = 800e3;

% t = linspace(0,NoOfSamples/Fs,NoOfSamples);
t = linspace(0,double(NoOfSamples-1)/Fs,NoOfSamples);

% x = cos((2*pi)*F0*t) + cos((2*pi)*F1*t);
% y = sin((2*pi)*F0*t) + sin((2*pi)*F1*t);

phaseOffset = 0;

outputA = cos((2*pi)*F0*t) + 1i*sin((2*pi)*F0*t);
outputB = cos((2*pi)*F1*t+phaseOffset ) + 1i*sin((2*pi)*F1*t+phaseOffset);

outputA = Amplitude*0.5*outputA;
outputB = Amplitude*outputB;

% plot(t,real(outputA),t, real(outputB),t, imag(outputA),t, imag(outputB));

outputA = transpose(double(outputA));
outputB = transpose(double(outputB));

output = [outputA outputB];
end