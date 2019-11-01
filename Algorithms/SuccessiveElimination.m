function [EstimatedBestArm, SampleComplexity] = SuccessiveElimination(arms, delta)
    addpath(genpath('../Modules/'))
    
    %% Initialization
    S = arms; t = 1; SampleComplexity = 0;
    K = length(arms);
    p_hat = rand(1,K) < arms;
    SampleComplexity = SampleComplexity + K;
    %% Learning
    while (length(S) > 1)
        p_max = max(p_hat);
        alpha = sqrt(log(K*t^2/delta)/t);
        for arm = length(S):-1:1;
            if(p_max - p_hat(arm) > 2*alpha)
                S(arm) = [];
                p_hat(arm) = [];
            end
        end
        for arm = length(S):-1:1;
            p_hat(arm) = (t*p_hat(arm)+ (rand() < S(arm)))/(t+1);
            SampleComplexity = SampleComplexity +1;
        end
        t = t+1;
    end
    if length(S) == 1;
        I = find(arms == S);
        EstimatedBestArm  = I(1+floor(length(I)*rand));
    end
                
            