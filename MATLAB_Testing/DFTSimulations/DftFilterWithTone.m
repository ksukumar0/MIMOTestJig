close all;
clear all;

Fs = 1000;
F0 = 3;
F1 = 100;
tmax = 100;

t = linspace(0,tmax,tmax*Fs);
fc = cos((2*pi)*F0*t) + cos((2*pi)*F1*t);

h = zeros(100,1);
h(1) = 1;
% h(2) = 1;
h(3) = 0.7;
% h(4) = 0.6;
H = fftshift(fft(h));

y = conv(fc,h);
Yout = fftshift(fft(y)); %/size(y,2);
Yout = Yout(1:size(fc,2));
Xout = fftshift(fft(fc)); %/size(fc,2);

subplot(2,2,1);
plot(linspace(-Fs/2,Fs/2,size(H,1)),abs(H));
title('Fourier(H)');

subplot(2,2,2);
plot(linspace(-Fs/2,Fs/2,size(fc,2)),abs(Yout));
title('Output Spectrum');

subplot(2,2,3)
plot(linspace(-Fs/2,Fs/2,size(fc,2)),abs(Xout));
title('Input Spectrum');

subplot(2,2,4);
tplot = t(1:1000);
plot(tplot,fc(1:size(tplot,2)),'r',tplot,y(1:size(tplot,2)),'b');
title('Output vs Input Waveform');
