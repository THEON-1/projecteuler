
function solution()
    fn = fp = n = BigInt(1)
    while true
        fn, fp, n = fn+fp, fn, n+1
        if is_pandigital(fn) return n+1 end
    end
end

function is_pandigital(n)
    if log10(n) + 1 < 9 return false end
    d = digits(n)
    S = Set(1:9)
    return Set(d[1:9]) == S && Set(d[end-8:end]) == S
end
