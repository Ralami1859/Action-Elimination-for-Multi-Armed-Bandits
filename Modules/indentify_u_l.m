function res = indentify_u_l(U, L, J)
    [~, l_t] = min(L(J));
    l_t = J(l_t);
    J_bar = setdiff([1:length(U)], J);
    [~, u_t] = max(L(J_bar));
    u_t = J_bar(u_t);
    res = [l_t, u_t];

    