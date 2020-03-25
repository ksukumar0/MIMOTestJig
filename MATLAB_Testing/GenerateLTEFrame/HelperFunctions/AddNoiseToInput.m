function [outputTimeDomain] = AddNoiseToInput(inputTimeDomain, rmc)

cfg.Seed = 1;                  % Channel seed
cfg.NRxAnts = 1;               % 1 receive antenna
cfg.DelayProfile = 'EVA';      % EVA delay spread
cfg.DopplerFreq = 120;         % 120Hz Doppler frequency
cfg.MIMOCorrelation = 'Low';   % Low (no) MIMO correlation
cfg.InitTime = 0;              % Initialize at time zero
cfg.NTerms = 16;               % Oscillators used in fading model
cfg.ModelType = 'GMEDS';       % Rayleigh fading model type
cfg.InitPhase = 'Random';      % Random initial phases
cfg.NormalizePathGains = 'On'; % Normalize delay profile power
cfg.NormalizeTxAnts = 'On';    % Normalize for transmit antennas
cfg.SamplingRate = rmc.SamplingRate;

% Pass data through the fading channel model
outputTimeDomain = lteFadingChannel(cfg,inputTimeDomain);

SNRdB = 22;             % Desired SNR in dB
SNR = 10^(SNRdB/20);    % Linear SNR

% Calculate noise gain
N0 = 1/(sqrt(2.0*rmc.CellRefP*double(rmc.Nfft))*SNR);

% Create additive white Gaussian noise
noise = N0*complex(randn(size(outputTimeDomain)),randn(size(outputTimeDomain)));

% Add noise to the received time domain waveform
outputTimeDomain = outputTimeDomain + noise;

