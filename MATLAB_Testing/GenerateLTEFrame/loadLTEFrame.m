function [outputWaveform, Fs, NoOfSamples] = loadLTEFrame()
    load txWaveform.mat;
    outputWaveform = eNodeBOutput;
    Fs = rmc.SamplingRate;
    NoOfSamples = size(eNodeBOutput,1);