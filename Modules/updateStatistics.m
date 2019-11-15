function [mu_hat, NbrPlayArms] = updateStatistics(l_u, reward, mu_hat, NbrPlayArms)
mu_hat(l_u) = (mu_hat(l_u).*NbrPlayArms(l_u)+ reward)./(NbrPlayArms(l_u)+1);
NbrPlayArms(l_u) = NbrPlayArms(l_u) + 1;

