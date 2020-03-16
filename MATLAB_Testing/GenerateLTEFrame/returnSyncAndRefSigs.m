function [output] = returnSyncAndRefSigs(rmc,rxGrid)
%FINDSYNCANDREFSIGS Summary of this function goes here

NRB = rmc.NDLRB;
rxGrid = rxGrid(:,1:140);
output = struct('SSSignalsSC',[],'SSSignalsSymbols',[]);
output.SSSlots = [0 10];
output.SSSignalsSymbols = (output.SSSlots * 7) + 6;
output.SSSignalsSC = (1:62) + NRB*6 - 31
output.SSS = rxGrid(output.SSSignalsSC,output.SSSignalsSymbols);
output.PSS = rxGrid(output.SSSignalsSC,output.SSSignalsSymbols+1);

output.CSIRSIndex = [];
output.CSIRS = [];
end

