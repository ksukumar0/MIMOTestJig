close all;
h = ones(10,1);
% h(1) = 1;
% h(2) = 1;
% h(3) = 0.7;
% h(4) = 0.6;
H = fftshift(fft(h));

sp1 = subplot(2,2,1);
stem(h);
sp3 = subplot(2,2,3);
plot(abs(H),'Parent',sp3);
ylim(sp3,[0 3]);
sp4 = subplot(2,2,4);
plot(angle(H),'Parent',sp4);
ylim(sp4, [-pi pi]);
