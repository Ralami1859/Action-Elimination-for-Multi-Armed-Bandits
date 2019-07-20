function confLevel = UGapEb_confLevel(expParam, b, NbrPlayArms)
    confLevel = b.*sqrt(expParam./NbrPlayArms);
end