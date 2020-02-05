close all;
h = zeros(11,1);
h(2) = 1;
h(3) = 0.7;
% h(5) = 0.6;
H = fftshift(fft(h));

subplot(2,2,1);
stem(h);
subplot(2,2,3);
plot(abs(H));
subplot(2,2,4);
plot(angle(H));
