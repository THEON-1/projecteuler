
function solution(n_digits)
    n = 1
    f_n = BigInt(1)
    f_n_1 = 0
    while log10(f_n)+1 < n_digits
        f_n_1, f_n = f_n, f_n + f_n_1
        n += 1
    end
    return n
end
