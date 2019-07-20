function [value, indices] = min_set(vect,m,n)
    [value, indices] = sort(vect);
    value = value(m:n);
    indices = indices(m:n);