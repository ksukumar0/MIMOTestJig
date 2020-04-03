function [output] = GenSineTone2Tx()

% close all;
% clear all;
Fs = 10e6;
NoOfSamples = 10e4;
Amplitude = 1;
Fs = cast(Fs,'double');
NoOfSamples = cast(NoOfSamples,'uint32');
Amplitude = double(Amplitude);

F0 = 100e3;
% F0 = 1.2e6;
% F1 = 800e3;

% t = linspace(0,NoOfSamples/Fs,NoOfSamples);
t = linspace(0,double(NoOfSamples-1)/Fs,NoOfSamples);

% x = cos((2*pi)*F0*t) + cos((2*pi)*F1*t);
% y = sin((2*pi)*F0*t) + sin((2*pi)*F1*t);

outputA = cos((2*pi)*F0*t) + j*sin((2*pi)*F0*t);
outputB = cos((2*pi)*F0*t + pi/2) + j*sin((2*pi)*F0*t + pi/2);

outputA = Amplitude*outputA;
outputB = Amplitude*outputB;

% plot(t,real(outputA),t, real(outputB));

outputA = transpose(double(outputA));
outputB = transpose(double(outputB));

output = [outputA outputB];
end