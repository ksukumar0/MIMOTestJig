Nifft = 2048;       % No. Of iFFT
NBW = 1200;         % No. of Subcarriers
df = 15e3;          % Sub carrier spacing
B = 30.72e6;        % total BW
Ts = Nifft*1/B;     % Symbol length
slength = 0.5e-3*B; % slot length

h = zeros(1,Nifft); % Multipaths
h(1) = 1;       % Multipath examples
h(100) = 1;       % Multipath examples
h(1000) = 1;       % Multipath examples

q = 1:Nifft;        % Number of subcarriers instantiated

symb = randi([0 3],1,Nifft);    % Data to be modulated
symbs = qammod(symb,4,'UnitAveragePower',true); % Mod symbols
xbq = zeros(1,Nifft);

t = [0:1:Nifft-1]*1/B; % Time domain time samples

b = zeros(Nifft,size(t,2)); % b is the 
for qi=q
    b(qi,:) = exp(1i*2*pi*qi*t/Ts);
end

xb = bsxfun(@times,symbs',b);
x = sum(xb,1);

xt = conv(x(1,:),h);
xt = xt(1:Nifft);

hc = toeplitz([h(1) fliplr(h(2:end))], h);
dftx = x*hc;

% plot(real(xt));

for i = 1:Nifft
    xbq(i) = dot(xt, (b(i,:)))/Nifft;
end

% plot(t,real(xt),t,real(x));
% plot(t,real(b(1:5,:)));
% plot(abs(fft(xb)))
