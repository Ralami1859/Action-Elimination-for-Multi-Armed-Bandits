function qM = klDown(p, d)
    uM = p; lM =  zeros(size(p));
    for j = 1:32
        qM = (uM+lM)/2;
        down = DivKL(p,qM) > d;
        uM(~down) = qM(~down);
        lM(down) = qM(down);
    end
    qM = lM;
end