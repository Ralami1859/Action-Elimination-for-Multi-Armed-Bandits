function [B, L, U, confLevel] = computeIndices_b(mu_hat, NbrPlayArms, expParam, b, m_arms)
    confLevel = UGapEb_confLevel(expParam, b, NbrPlayArms); 
    U = mu_hat + confLevel;
    L = mu_hat - confLevel;
    K = length(NbrPlayArms);
    B = zeros(1,K);
    for k = 1:K;
        B(k) = max_set([U(1:k-1) U(k+1:end)], m_arms, m_arms) - L(k);
    end