function [EstimatedBestArm, NbrSteps] = MedianElimination(epsilon, delta, arms)
   addpath('Modules/');   
    S = arms; epsilon = epsilon/4; delta = delta/2; NbrSteps = 1;
    while length(S) > 1;
        K = length(S);
        NbrSamples = ceil(1./(epsilon/2).^2.*log(3./delta));
        rewards = rand(NbrSamples, K) < repmat(S, NbrSamples, 1);
        ExpectedMeans = mean(rewards, 1);
        Med = median(ExpectedMeans);
        ArmToRemove = ExpectedMeans < Med;
        S(ArmToRemove) = [];
        epsilon = 3/4*epsilon; delta= delta/2; NbrSteps = NbrSteps+1;
    end
    
    if length(S) == 1;
        I = find(arms == S);
        EstimatedBestArm  = I(1+floor(length(I)*rand));
    end