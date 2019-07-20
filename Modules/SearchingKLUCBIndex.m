function [U,L] = SearchingKLUCBIndex(mu_hat, NbrPlayArms, expParam, b, delta)

    confLevel = ConfLevel(expParam, b, NbrPlayArms, delta);

    p = mu_hat;
    d = confLevel.^2;
    U = klUp(p, d);
    L = klDown(p,d);
end