addpath HelperFunctions;

% Check for presence of LTE Toolbox
if isempty(ver('lte'))
    error(message('sdru:examples:NeedLST'));
end

% Generate LTE signal
rmc = lteRMCDL('R.9');     % Base RMC configuration
rmc.CellRefP = 1;           % 2 transmit antennas
rmc.NDLRB = 100;            % No. of Resource Blocks
rmc.PDSCH.NLayers = 1;      % 2 layers 
rmc.NCellID = 64;           % Cell identity
rmc.NFrame = 100;           % Initial frame number
rmc.TotSubframes = 2*10;    % Generate 8 frames. 10 subframes per frame
rmc.OCNGPDSCHEnable = 'On'; % Add noise to unallocated PDSCH resource elements
rmc.PDSCH.RNTI = 61;
rmc.SIB.Enable = 'On';
rmc.SIB.DCIFormat = 'Format1A';
rmc.SIB.AllocationType = 0;
rmc.SIB.VRBStart = 0;
rmc.SIB.VRBLength = 6;
rmc.SIB.Gap = 0;
rmc.SIB.Data = randi([0 1],144,1); % Use random bits in SIB data field. This is not a valid SIB message
trData = [1;0;0;1];
[eNodeBOutput,txGrid,rmc] = lteRMCDLTool(rmc,trData);

%% Adding Noise to the generated LTE Signal

[eNodeBOutput] = AddNoiseToInput(eNodeBOutput, rmc);

%% Calculate the DL Channel Est

[estChannel, noiseEst] = findDLChEst(eNodeBOutput, rmc);
% surf(abs(estChannel));