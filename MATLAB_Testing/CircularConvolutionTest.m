close all;
clear;
N = 20;
xn = N;
hn = N + 5;
x = randi([0 1],1,xn);
h = rand(1,hn);

y = conv(h,x);

yn = xn + hn - 1;

newx = zeros(1,yn);
newx(1,1:xn) = x;

hfliped = flip(h);

newh = convmtx(hfliped,xn);
newy = newh*newx';

sp1 = subplot(2,2,1);
plot(x);
ylabel(sp1, 'x[n]');
sp2 = subplot(2,2,2);
plot(h);
ylabel(sp2, 'h[n]');

sp3 = subplot(2,2,3);
plot(flip(h));
ylabel(sp3, 'h[-n]');

sp4 = subplot(2,2,4);
plot(1:size(y,2),y,1:size(newy,1),newy);
ylabel(sp4, 'y[n]');

