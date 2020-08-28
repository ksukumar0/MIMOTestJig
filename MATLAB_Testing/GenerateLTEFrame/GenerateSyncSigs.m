function [subframe,pssIndices,sssIndices] = GenerateSyncSigs(enb, inputSym)

% Generate the PSS symbols. Use the function ltePSS with the eNodeB configuration, enb.
pss = ltePSS(enb);
% When a PSS signal is not located in enb.NSubframe, the function does not generate PSS symbols and returns an empty vector.

antenna = 0;
pssIndices = ltePSSIndices(enb, antenna);

% Generate the SSS symbols. Use the function lteSSS with the eNodeB configuration, enb.
sss = lteSSS(enb);

% Generate the SSS Indices
antenna = 0;
sssIndices = lteSSSIndices(enb, antenna);

% Generate the subframe resource grid. Use the function lteDLResourceGrid. You create an empty resource grid for one subframe.
subframe = lteDLResourceGrid(enb);

% This is the LTE RE grid for 1 subframe
% Map input symbols to grid
subframe(:) = inputSym;
subframe(pssIndices) = pss;
subframe(sssIndices) = sss;

end
