function [params] = getLTEWaveformParameters()
%GETPARAMS Generates the required LTE Waveform

%   Detailed explanation goes here
%  The following example shows how to create a 20MHz, QPSK, 3/4 rate
%  waveform corresponding to transmission mode 8 ('Port7-8' transmission
%  scheme) with full allocation and 2 transmit antennas
dataStream = [1 0 0 1];     % Define the input user data stream
params = struct();          % Initialize the parameter structure
params.NDLRB = 100;         % 20 MHz bandwidth
params.CellRefP = 4;        % Cell reference signals on the first two ports
params.PDSCH.PRBSet = (0:params.NDLRB-1)'; % Full allocation
params.PDSCH.TargetCodeRate = 3/4; % The target code rate
params.PDSCH.TxScheme = 'Port7-14'; % Transmission mode 8
params.PDSCH.NLayers = 4;          % 2 layer transmission
params.PDSCH.Modulation = '64QAM';  % Modulation scheme
params.PDSCH.NSCID = 0;            % Scrambling identity
params.PDSCH.NTxAnts = 4;          % 2 transmit antennas
params.PDSCH.W = lteCSICodebook(params.PDSCH.NLayers,...
                        params.PDSCH.NTxAnts,0).'; % Precoding matrix
                    
% Additional Data
params.NCellID = 64;           % Cell identity
params.NFrame = 100;           % Initial frame number
params.TotSubframes = 2*10;      % Generate 2 frames. 10 subframes per frame
params.OCNGPDSCHEnable = 'On'; % Add noise to unallocated PDSCH resource elements
params.PDSCH.RNTI = 61;
params.SIB.Enable = 'On';
params.SIB.DCIFormat = 'Format1A';
params.SIB.AllocationType = 0;
params.SIB.VRBStart = 0;
params.SIB.VRBLength = 6;
params.SIB.Gap = 0;
params.SIB.Data = randi([0 1],144,1); % Use random bits in SIB data field. This is not a valid SIB message

end

