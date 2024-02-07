
function solution(n)
    if n % 2 == 0
        return -1
    end
    if n == 1
        return 1
    else
        sum_n = 4*n^2 - 6*(n-1)
        return solution(n-2) + sum_n
    end
end
