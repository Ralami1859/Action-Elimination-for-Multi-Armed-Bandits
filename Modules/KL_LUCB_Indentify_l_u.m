function [armTP_t,J,U,L, B] = KL_LUCB_Indentify_l_u(mu_hat, NbrPlayArms, expParam, b, m_arms, delta)
  [B, L, U] = KL_LUCB_computeIndices(mu_hat, NbrPlayArms, expParam, b, m_arms, delta);
  [~, J] = min_set(B, 1, m_arms);
  armTP_t = indentify_u_l(U, L, J);