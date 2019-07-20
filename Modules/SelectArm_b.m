function [I_t, J] = SelectArm_b(mu_hat, NbrPlayArms, expParam, b, m_arms)
    [B, L, U, confLevel] = computeIndices_b(mu_hat, NbrPlayArms, expParam, b, m_arms);
    [~, J] = min_set(B, 1, m_arms);
    armTP_t = indentify_u_l(U, L, J);
    [~, I_t] = max(confLevel(armTP_t));
    I_t = armTP_t(I_t);
    