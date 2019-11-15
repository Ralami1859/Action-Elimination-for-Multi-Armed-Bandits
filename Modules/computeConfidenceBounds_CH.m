% Chernoff-Hoeffding
function [L, U, confLevel] = computeConfidenceBounds_CH(mu_hat, NbrPlayArms, expParam, b, delta)
    confLevel = ConfLevel(expParam, b, NbrPlayArms, delta);
    U = mu_hat + confLevel;
    L = mu_hat - confLevel;