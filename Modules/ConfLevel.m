function confLevel = ConfLevel(c, b, NbrPlayArms, delta)
    t = sum(NbrPlayArms);
    confLevel = b.*sqrt(c.*log(t.^2./delta)./NbrPlayArms);
end