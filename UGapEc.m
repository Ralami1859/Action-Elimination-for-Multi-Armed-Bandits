% Inputs: epsilon = accuracy
%         arms
%         budget
%         expParam : exploration parameter

function SetOfEstimatedBestArms = UGapEc(arms, m_arms, epsilon, delta, expParam)
addpath('Modules/');    
    % Inilizalization
    K = length(arms);
    mu_hat = zeros(1,K); 
    for i = 1:K;
        mu_hat(i) = rand() < arms(i);
    end
    NbrPlayArms = ones(1,K);
    b = 1;
    
    [B] = computeIndices_c(mu_hat, NbrPlayArms, expParam, b, m_arms, delta);
    [~, J] = min_set(B, 1, m_arms);
    
    while (prod(B(J) >= epsilon) ~=0)
        [I_t, J, B] = SelectArm_c(mu_hat, NbrPlayArms, expParam, b, m_arms, delta);
        mu_hat(I_t) = (mu_hat(I_t)*NbrPlayArms(I_t)+ (rand() < arms(I_t)))./NbrPlayArms(I_t);
        NbrPlayArms(I_t) = NbrPlayArms(I_t) + 1;
    end
    SetOfEstimatedBestArms = J;