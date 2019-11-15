
%% Extracting the set of n lowest values in vect

function [value, indices] = min_set(vect, n)
    [value, indices] = sort(vect);
    value = value(1:n);
    indices = indices(1:n);