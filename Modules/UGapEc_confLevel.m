function confLevel = UGapEc_confLevel(c, b, NbrPlayArms, delta)
    K = length(NbrPlayArms);
    t = sum(NbrPlayArms);
    confLevel = b.*sqrt(c.*log(4*K.*t.^3./delta)./NbrPlayArms);
end