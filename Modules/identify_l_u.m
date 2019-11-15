

%% Implementing equation (2) in :http://proceedings.mlr.press/v30/Kaufmann13.pdf
% u_t  = argmax_{a \notin J} U(a)
% l_t  = argmin_{a \in J} L(a)

function [l_t, u_t] = identify_l_u(L, U, J)
    [~, l_t] = min(L(J));
    l_t = J(l_t);
    J_bar = setdiff([1:length(U)], J);
    [~, u_t] = max(U(J_bar));
    u_t = J_bar(u_t);

    