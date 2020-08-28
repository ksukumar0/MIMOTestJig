a = [0 -0.061235467 0 0.306177333 0.510116268 0.306177333 0 -0.061235467 0];
[H,w] = freqz(a);

% subplot(2,1,1);
figure;
plot(w/pi,abs(H));
xlabel('Normalized Frequency ( x \pi rad/sample)');
ylabel('Magnitude (dB)');

% plot(2,1,2);
figure;
plot(w/pi,360/(2*pi)*unwrap(angle(H)));
xlabel('Normalized Frequency ( x \pi rad/sample)');
ylabel('Phase (degrees)');
