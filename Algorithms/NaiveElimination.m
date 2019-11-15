%% Implementation of the NaiveElimination algorithm for multi-armed bandits
% paper: http://jmlr.csail.mit.edu/papers/volume7/evendar06a/evendar06a.pdf
%Inputs: epsilon
%        delta
%        arms: vector of Bernoulli distributions

%Outputs: ArmToPlay
%         ExpectedMeans for each arm

function [EstimatedBestArm, ExpectedMeans, SampleComplexity] = NaiveElimination(arms, epsilon, delta)
    addpath(genpath('../Modules/'))
    if (epsilon >= 1) + (epsilon <=0) ~= 0;
        error('epsilon must be in (0,1)')
    end
    if (delta >= 1) + (delta <=0) ~= 0;
        error('delta must be in (0,1)')
    end
    K = length(arms); SampleComplexity = 0;
    NbrSamples = floor(4./(epsilon.^2).*log(2.*K./delta));
    SampleComplexity = SampleComplexity + K*NbrSamples;
    rewards = (rand(NbrSamples, K) < repmat(arms, NbrSamples, 1))*1; % Sampling
    ExpectedMeans = mean(rewards, 1);
    [~, EstimatedBestArm] = max(ExpectedMeans);