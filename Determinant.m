% Calculates the determinant of a SQUARE matrix
% This may take a long time for larger matrices because of the large number of permutations
% It is possible to speed this up by instantly not considering any calculations with repeat indeces,
% just using permutations, but this would defeat the purpose of using Levi-Civita. 
function d = Determinant(A)
    d = 0;

    % Check if the matrix is square
    if (size(A)(1) != size(A)(2))
        error("THIS MATRIX MUST BE SQUARE!!!\n");
    end

    % if the matrix is one-by-one, not much is to be done
    if (size(A)(1) == 1)
        d = A(1,1);
    
    % begin finding the determinant
    else
        % get `n` the size
        n = size(A)(2);

        % create the indexing array
        arr = ones(1, n);

        % loop over all combinations of indeces
        while (true)

            % evaluate the Levi-Civita symbol
            l = LeviCivita(arr);

            % if l=0, the expression is zero so that case can be ignored
            % multiply the numbers together and add them to the sum
            if (l != 0) 
                prodd = 1;
                for i = 1:n
                    prodd *= A(i, arr(1,i));
                end
                d += l * prodd;
            end

            % if the indexing array is in the last position, end the loop
            if (arr == (n * ones(1,n)))
                break;
            end

            % go to the next index combination
            carry = 1;
            for j = 1:n
                if (arr(1,j) == n && carry == 1)
                    arr(1,j) = 1;
                    carry = 1;
                else 
                    arr(1,j) += carry;
                    carry = 0;
                end
            end
            
        end
    end
end