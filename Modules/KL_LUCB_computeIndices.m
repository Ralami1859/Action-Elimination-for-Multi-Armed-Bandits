function [B, L, U] = KL_LUCB_computeIndices(mu_hat, NbrPlayArms, expParam, b, m_arms, delta)
    [U,L] = SearchingKLUCBIndex(mu_hat, NbrPlayArms, expParam, b, delta);
    K = length(NbrPlayArms);
    B = zeros(1,K);
    for k = 1:K;
        B(k) = max_set([U(1:k-1) U(k+1:end)], m_arms, m_arms) - L(k);
    end