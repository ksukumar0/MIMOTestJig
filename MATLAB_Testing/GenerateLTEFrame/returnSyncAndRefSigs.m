function [output] = returnSyncAndRefSigs(rmc,rxGrid)
%FINDSYNCANDREFSIGS Summary of this function goes here

NRB = rmc.NDLRB;
SymbolsPerFrame = 140;
rxGrid = rxGrid(:,1:SymbolsPerFrame);
% output = struct('SSSignalsSC',[],'SSSignalsSymbols',[]);

% SSS Signals
output.SSSlots = [0 10];
output.SSSignalsSymbols = (output.SSSlots * 7) + 6;
output.SSSignalsSC = (1:62) + NRB*6 - 31;
output.SSS = rxGrid(output.SSSignalsSC,output.SSSignalsSymbols);

% PSS Signals
output.PSS = rxGrid(output.SSSignalsSC,output.SSSignalsSymbols+1);
v = [0 3];
output.CSIRSSC = mod(v+rmc.NCellID,6) + (1:6:NRB*12)';
output.CSIRSSlots = [1 5] + (0:7:SymbolsPerFrame-7)';
output.CSIRS1 = rxGrid(output.CSIRSSC(:,1),output.CSIRSSlots(:,1));
output.CSIRS2 = rxGrid(output.CSIRSSC(:,2),output.CSIRSSlots(:,2));
end

