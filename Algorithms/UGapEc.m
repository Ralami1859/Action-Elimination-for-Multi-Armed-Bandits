% Inputs: epsilon = accuracy
%         arms
%         budget
%         expParam : exploration parameter

function [SetOfEstimatedBestArms, SampleComplexity] = UGapEc(arms, m_arms, epsilon, delta, expParam)
    addpath(genpath('../Modules/'))
    %% Inilizalization
    K = length(arms); b = 1; 
    mu_hat = (rand(1,K) < arms)*1 ;
    NbrPlayArms = ones(1,K);
    [B] = computeIndices_c(mu_hat, NbrPlayArms, expParam, b, m_arms, delta);
    [~, J] = min_set(B, 1, m_arms);
    %% Learning 
    while (prod(B(J) >= epsilon) ~=0)
        [I_t, J, B] = SelectArm_c(mu_hat, NbrPlayArms, expParam, b, m_arms, delta);
        mu_hat(I_t) = (mu_hat(I_t)*NbrPlayArms(I_t)+ (rand() < arms(I_t)))./NbrPlayArms(I_t);
        NbrPlayArms(I_t) = NbrPlayArms(I_t) + 1;
    end
    SetOfEstimatedBestArms = J;
    SampleComplexity  = sum(NbrPlayArms);