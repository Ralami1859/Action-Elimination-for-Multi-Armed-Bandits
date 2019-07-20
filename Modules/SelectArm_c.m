function [I_t, J, B] = SelectArm_c(mu_hat, NbrPlayArms, expParam, b, m_arms, delta)
    [B, L, U, confLevel_b] = computeIndices_c(mu_hat, NbrPlayArms, expParam, b, m_arms, delta);
    [~, J] = min_set(B, 1, m_arms);
    armTP_t = indentify_u_l(U, L, J);
    [~, I_t] = max(confLevel_b(armTP_t));
    I_t = armTP_t(I_t);