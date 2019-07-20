% Inputs: epsilon = accuracy
%         arms
%         budget
%         expParam : exploration parameter
function SetOfEstimatedBestArms = UGapEb(arms, m_arms, budget, expParam)
    addpath('Modules/');    
    % Inilizalization
    K = length(arms);
    mu_hat = zeros(1,K); 
    for i = 1:K;
        mu_hat(i) = rand() < arms(i);
    end
    NbrPlayArms = ones(1,K);
    b = 1;
    for t = K+1:budget;
        [I_t, SetOfEstimatedBestArms] = SelectArm_b(mu_hat, NbrPlayArms, expParam, b, m_arms);
        mu_hat(I_t) = (mu_hat(I_t)*NbrPlayArms(I_t)+ (rand() < arms(I_t)))./NbrPlayArms(I_t);
        NbrPlayArms(I_t) = NbrPlayArms(I_t) + 1;
    end
    
    