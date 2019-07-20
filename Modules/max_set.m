function [value, indices] = max_set(vect,m,n)
    [value, indices] = sort(vect,'descend');
    value = value(m:n); 
    indices = indices(m:n);