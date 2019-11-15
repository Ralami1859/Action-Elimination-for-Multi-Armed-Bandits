%% Extracting the set of n highest values in vect

function [value, indices] = max_set(vect,n)
    [value, indices] = sort(vect,'descend');
    value = value(1:n); 
    indices = indices(1:n);