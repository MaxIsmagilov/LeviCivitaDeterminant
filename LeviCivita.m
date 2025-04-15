% LeviCivita calculates the value of the Levi-Civita symbol for a list of indeces
% As a reminder, the Levi-Civita symbol returns 0 if any indeces match, 
% 1 if the permutation is positive, and -1 if the permutation is negative
function l = LeviCivita(arr)
    newarr = arr;
    l = 0;
    swaps = 0;

    % sort the list, counting swaps (insertion sort)
    ind_i = 2;
    while (ind_i <= size(newarr)(2))
        ind_j = ind_i;
        while (ind_j > 1 && newarr(1, ind_j-1) > newarr(1, ind_j))
            k = newarr(1,ind_j-1);
            newarr(1,ind_j -1) = newarr(1,ind_j);
            newarr(1,ind_j) = k;
            ind_j = ind_j - 1;
            swaps++;
        end
        ind_i++;
    end

    % check if any numbers match
    matching_exist = false;
    for i = 2:size(newarr)(2)
        if (newarr(1, i) == newarr(1, i-1))
            matching_exist = true;
        end
    end

    % if matching exist, just return zero, otherwise return based on the number of swaps
    if (!matching_exist)
        if (mod(swaps, 2) == 0)
            l = 1;
        else
            l = -1;
        end
    end
end
