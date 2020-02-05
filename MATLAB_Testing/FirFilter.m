f = [0 0.6 0.6 1];      % Frequency breakpoints
m = [1 1 0 0];          % Magnitude breakpoints
b = fir2(30,f,m);       % Frequency sampling-based FIR filter design
b1 = fir2(60,f,m,rectwin(61));       % Frequency sampling-based FIR filter design
b2 = fir2(60,f,m, hann(61));

[h,w] = freqz(b,1,256); % Frequency response of filter
[h1,w1] = freqz(b1,1,256); % Frequency response of filter
[h2,w2] = freqz(b2,1,256); % Frequency response of filter

plot(f,m,w/pi,abs(h),w1/pi,abs(h1), w2/pi, abs(h2))
legend('Ideal','fir2 with 30 taps','fir2 with 60 taps')
title('Comparison of Frequency Response Magnitudes')