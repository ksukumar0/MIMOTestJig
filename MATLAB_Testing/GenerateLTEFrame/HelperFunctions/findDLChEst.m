function [estChannel, noiseEst] = findDLChEst(rxWaveform, enb)

%% Just for the case of testing
if (isa(enb,'double'))
    enb = lteRMCDL('R.9');     % Base enb configuration
    enb.CellRefP = 1;           % 2 transmit antennas
    enb.NDLRB = 100;            % No. of Resource Blocks
    enb.PDSCH.NLayers = 1;      % 2 layers 
    enb.NCellID = 64;           % Cell identity
    enb.NFrame = 100;           % Initial frame number
    enb.TotSubframes = 2*10;    % Generate 8 frames. 10 subframes per frame
    enb.OCNGPDSCHEnable = 'On'; % Add noise to unallocated PDSCH resource elements
    enb.PDSCH.RNTI = 61;
    enb.SIB.Enable = 'On';
    enb.SIB.DCIFormat = 'Format1A';
    enb.SIB.AllocationType = 0;
    enb.SIB.VRBStart = 0;
    enb.SIB.VRBLength = 6;
    enb.SIB.Gap = 0;
    enb.SIB.Data = randi([0 1],144,1); % Use random bits in SIB data field. This is not a valid SIB message
end
%% The next steps of the program

cec.PilotAverage = 'UserDefined'; % Pilot averaging method
cec.FreqWindow = 9;               % Frequency averaging window in REs
cec.TimeWindow = 9;               % Time averaging window in REs
cec.InterpType = 'Cubic';         % Cubic interpolation
cec.InterpWinSize = 3;            % Interpolate up to 3 subframes
                                  % simultaneously
cec.InterpWindow = 'Centred';     % Interpolation windowing method

offset = lteDLFrameOffset(enb,rxWaveform);
begin = 1+offset;
rxWaveform = rxWaveform(begin:begin+307200-1,:);

rxGrid = lteOFDMDemodulate(enb,rxWaveform);
enb.NSubframe = 0;
[estChannel, noiseEst] = lteDLChannelEstimate(enb,cec,rxGrid);