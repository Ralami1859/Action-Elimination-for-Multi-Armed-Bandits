function [mu_hat, NbrPlayArms] = LUCB_updateConfBounds(l_u, reward, mu_hat, NbrPlayArms)

mu_hat(l_u) = (mu_hat(l_u).*NbrPlayArms(l_u)+ reward)./NbrPlayArms(l_u);
NbrPlayArms(l_u) = NbrPlayArms(l_u) + 1;

