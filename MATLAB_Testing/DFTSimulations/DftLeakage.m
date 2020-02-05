close all;

Fs = 1000;
F0 = 3;
tmax = 100;

t = linspace(0,tmax,tmax*Fs);
fc = cos((2*pi)*F0*t);

t02 = t(t<=0.2);
t5 = t(t<=5);

f02 = fc(1,1:size(t02,2));
f5 = fc(1,1:size(t5,2));

figure;
subplot(2,1,1);
plot(t02,f02);
subplot(2,1,2);
plot(linspace(-Fs/2,Fs/2,size(f02,2)), abs(fftshift(fft(f02))));
% subplot(2,2,3);
% plot(t5,f5);
% subplot(2,2,4);
% plot(linspace(-Fs/2,Fs/2,size(f5,2)), abs(fftshift(fft(f5))));

rep = 50;
fnew = repmat(f02,[1 ,rep]);
tnew = t(1:rep*size(f02,2) );

figure;
plot(linspace(-Fs/2,Fs/2,size(fnew,2)), abs(fftshift(fft(fnew))));
a = zeros(1,40);