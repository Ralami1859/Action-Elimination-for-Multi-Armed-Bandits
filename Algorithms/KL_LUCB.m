%% Implementation of KL LUCB in the paper: http://proceedings.mlr.press/v30/Kaufmann13.pdf

function [SetOfEstimatedBestArms, SampleComplexity] = KL_LUCB(arms, m_arms, epsilon, delta, expParam)
    addpath(genpath('../Modules/'))
     %% Initialization 
    b = 1;
    K = length(arms);
    mu_hat = (rand(1,K) < arms)*1; % Play each arm once
    NbrPlayArms = ones(1,K);
    [U, L] = computeConfidenceBounds_KL(mu_hat, NbrPlayArms, expParam, b, delta); % computing confidence bounds based on KL divergence
    [~, J] = max_set(mu_hat, m_arms); % Set of m_arms with highest empirical means
    [l, u] = identify_l_u(L, U, J); % implementing equation(2) 
    B = inf;
    %% Learning 
    while B >= epsilon;
        reward = [rand(1,2) < arms([l,u])]*1; % Sampling the environment
        [mu_hat, NbrPlayArms] = updateStatistics([l, u], reward, mu_hat, NbrPlayArms);
        [U, L] = computeConfidenceBounds_KL(mu_hat, NbrPlayArms, expParam, b, delta);
        [~, J] = max_set(mu_hat,  m_arms);
        [l, u] = identify_l_u(L, U, J);
        B = U(u) - L(l);
    end
    SetOfEstimatedBestArms = J;
    SampleComplexity  = sum(NbrPlayArms);