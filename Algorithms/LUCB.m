function [SetOfEstimatedBestArms, SampleComplexity] = LUCB(arms, m_arms, epsilon, delta, expParam)
    addpath(genpath('../Modules/'));
    %% Initialization 
    t = 1;  b = 1;
    K = length(arms);
    mu_hat = (rand(1,K) < arms)*1; % Play each arm once
    NbrPlayArms = ones(1,K);
    [l_u, J] = LUCB_Indentify_l_u(mu_hat, NbrPlayArms, expParam, b, m_arms, delta);
    B = inf;
    %% Learning 
    while B >= epsilon;
        t = t+1;
        reward = [rand(1,2) < arms(l_u)]*1; % Sampling
        [mu_hat, NbrPlayArms] = LUCB_updateConfBounds(l_u, reward, mu_hat, NbrPlayArms);
        [l_u, J, U, L] = LUCB_Indentify_l_u(mu_hat, NbrPlayArms, expParam, b, m_arms, delta);
        B = U(l_u(2)) - L(l_u(1));
    end
    SetOfEstimatedBestArms = J;
    SampleComplexity  = sum(NbrPlayArms);