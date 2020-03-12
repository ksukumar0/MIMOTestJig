x1 = linspace(-5,5,1000);
y1 = sinc(x1);
y2 = sinc(x1-1);

y1 = [y1 zeros(1,100) zeros(1,100)];
y2 = [zeros(1,100) zeros(1,100) y2];
yt = y1+y2;

% plot(x1,y1,x1,y2);
plot(yt);
grid