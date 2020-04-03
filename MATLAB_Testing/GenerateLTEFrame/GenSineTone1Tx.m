function [SineSamplesx,SineSamplesy] = GenSineTone1Tx(Fs,NoOfSamples, Amplitude)

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

%% This is to test the spec an function
SineSamplesx = Amplitude*(cos((2*pi)*F0*t) + 1i*sin((2*pi)*F0*t));
SineSamplesy = Amplitude*(cos((2*pi)*F1*t) + 1i*sin((2*pi)*F1*t));
F2 = F0;%1.6e6;
F3 = F0;%2.0e6;
z = cos((2*pi)*F2*t) + 1i*sin((2*pi)*F2*t);
c = cos((2*pi)*F3*t) + 1i*sin((2*pi)*F3*t);

% plot(SineSamples);

SineSamplesx = double(SineSamplesx);
SineSamplesy = double(SineSamplesy);

output = [SineSamplesx;SineSamplesy;z;c];
output = transpose(output);

spectrumAnalyzer = dsp.SpectrumAnalyzer;
spectrumAnalyzer.SampleRate = Fs;
spectrumAnalyzer.Title = 'Power Spectrum of Two-Channel Sine Tone';
spectrumAnalyzer.ShowLegend = true;
spectrumAnalyzer.ChannelNames = {'Tone 1', 'Tone 2', 'Tone 3', 'Tone 4'};
step(spectrumAnalyzer, output);
release(spectrumAnalyzer);

end