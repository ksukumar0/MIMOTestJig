NRB = 6;
CellRefP = 2;
NCellID = 10;
CenterFrequency = 2600e6;
MasterClockRate = 30.72e6/4;
lteSamplingFreq = 30.72e6/4;
SamplesPerFrame = lteSamplingFreq/100;

% Set up the frame for displaying the transmit signals
totalSubFrames = 2;
totalSC = NRB*12;
totalSymbols = totalSubFrames*14;

save variables.mat