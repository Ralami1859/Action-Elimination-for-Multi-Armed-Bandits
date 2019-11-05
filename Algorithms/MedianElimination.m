function [EstimatedBestArm, NbrSteps, SampleComplexity] = MedianElimination(arms, epsilon, delta)
    addpath(genpath('../Modules/'))
    %% Initialization
    S = arms; epsilon = epsilon/4; delta = delta/2; NbrSteps = 1; SampleComplexity = 0;
    %% Learning 
    while length(S) > 1;
        K = length(S);
        NbrSamples = ceil(1./(epsilon/2).^2.*log(3./delta));
        SampleComplexity = SampleComplexity + NbrSamples;
        rewards = (rand(NbrSamples, K) < repmat(S, NbrSamples, 1))*1; % Sampling
        ExpectedMeans = mean(rewards, 1);
        ArmToRemove = ExpectedMeans < median(ExpectedMeans);
        S(ArmToRemove) = [];
        epsilon = 3/4*epsilon; delta= delta/2; NbrSteps = NbrSteps+1;
    end
    
    if length(S) == 1;
        I = find(arms == S);
        EstimatedBestArm  = I(1+floor(length(I)*rand));
    end