% Calculates the determinant of a SQUARE matrix
function d = Determinant(A)
    d = 0;
    if (size(A)(1) != size(A)(2))
        error("THIS MATRIX MUST BE SQUARE!!!\n")
    end
    if (size(A)(1) == 1)
        d = A(1,1);
    else
        n = size(A)(2)
        arr = ones(1, n);
        while (true)
            arr
            n
            l = LeviCivita(arr);
            if (l != 0) 
                prodd = 1;
                for i = 1:n
                    prodd *= A(i, arr(1,i));
                end
                d += l * prodd;
            end

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

            if (arr == (n * ones(1,n)))
                break;
            end
        end
    end
end