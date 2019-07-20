%% Implementation of the NaiveElimination algorithm for multi-armed bandits
% paper: http://jmlr.csail.mit.edu/papers/volume7/evendar06a/evendar06a.pdf
%Inputs: epsilon
%        delta
%        arms: vector of Bernoulli distributions

%Outputs: ArmToPlay
%         ExpectedMeans for each arm

function [EstimatedBestArm, ExpectedMeans] = NaiveElimination(epsilon, delta, arms)
   addpath('Modules/');    
    if (epsilon >= 1) + (epsilon <=0) ~= 0;
        error('epsilon must be in (0,1)')
    end
    if (delta >= 1) + (delta <=0) ~= 0;
        error('delta must be in (0,1)')
    end
    K = length(arms);
    NbrSamples = floor(4./(epsilon.^2).*log(2.*K./delta));
    rewards = rand(NbrSamples, K) < repmat(arms, NbrSamples, 1);
    ExpectedMeans = mean(rewards, 1);
    [~, EstimatedBestArm] = max(ExpectedMeans);