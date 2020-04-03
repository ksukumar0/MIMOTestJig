function [output, Fs] = GenSineTone2Tx()

% close all;
% clear all;
Fs = 30.72e6;
NoOfSamples = 30.72e6*0.01*0.1;
Amplitude = 0.5;
Fs = cast(Fs,'double');
NoOfSamples = cast(NoOfSamples,'uint32');
Amplitude = double(Amplitude);

F0 = 1e6;
F1 = 2e6;
% F0 = 1.2e6;
% F1 = 800e3;

% t = linspace(0,NoOfSamples/Fs,NoOfSamples);
t = linspace(0,double(NoOfSamples-1)/Fs,NoOfSamples);

% x = cos((2*pi)*F0*t) + cos((2*pi)*F1*t);
% y = sin((2*pi)*F0*t) + sin((2*pi)*F1*t);

outputA = cos((2*pi)*F0*t) + 1i*sin((2*pi)*F0*t);
outputB = cos((2*pi)*F1*t) + 1i*sin((2*pi)*F1*t);

outputA = Amplitude*outputA;
outputB = Amplitude*outputB;

% plot(t,real(outputA),t, real(outputB));

outputA = transpose(double(outputA));
outputB = transpose(double(outputB));

output = [outputA outputB];
end