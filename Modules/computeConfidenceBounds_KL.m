function [U, L] = computeConfidenceBounds_KL(mu_hat, NbrPlayArms, expParam, b, delta)
    confLevel = ConfLevel(expParam, b, NbrPlayArms, delta);
    U = klUp(mu_hat, confLevel.^2);
    L = klDown(mu_hat,confLevel.^2);
end