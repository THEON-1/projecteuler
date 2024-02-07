
function mergeSorted(A::Vector{T}, B::Vector{T}) where T
    la = length(A)
    lb = length(B)
    C = Vector{T}(undef, la + lb)

    a = b = 1
    while (a <= la && b <= lb)
        if A[a] < B[b]
            C[a+b-1] = A[a]
            a += 1
        else
            C[a+b-1] = B[b]
            b += 1
        end
    end

    if a > la
        while b <= lb
            C[a+b-1] = B[b]
            b += 1
        end
    else
        while a <= la
            C[a+b-1] = A[a]
            a += 1
        end
    end

    return C
end
