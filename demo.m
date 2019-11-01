%% Demo of action elimination algorithm 

addpath('Algorithms/');

%% Define the environment

arms = [0.9 0.7 0.6 0.5 ]; % Bernoulli arms
m_arms = 2; % m best arms to indentify
epsilon = 0.05; % accuracy level
delta = 0.05; % probability of failure 
expParam = 0.5; % exploration parameter

%% Launching KL_LUCB
[SetOfEstimatedBestArms_KL_LUCB, SampleComplexity_KL_LUCB] = KL_LUCB(arms, m_arms, epsilon, delta, expParam);

%% Launching LUCB 
[SetOfEstimatedBestArms_LUCB, SampleComplexity_LUCB] = LUCB(arms, m_arms, epsilon, delta, expParam);

%% Launching Median Elimination
[EstimatedBestArm_Median, ~, SampleComplexity_Median] = MedianElimination(arms, epsilon, delta);

%% Launching Naive Elimination
[EstimatedBestArm_Naive, ~, SampleComplexity_Naive] = NaiveElimination(arms, epsilon, delta);

%% Launching Successive Elimination
[EstimatedBestArm_succ, SampleComplexity_succ] = SuccessiveElimination(arms, delta);

%% Launching UGapEc
[SetOfEstimatedBestArms_UGapEc, SampleComplexity_UGapEc] = UGapEc(arms, m_arms, epsilon, delta, expParam);