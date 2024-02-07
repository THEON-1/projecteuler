function solution(n)
    fac = factorial(big(n))
    places = log10(fac)
    sum = 0
    for i = 0:places
        clip = fac÷(10^i)
        sum += clip%10
    end
    v = collect(string(fac))
    sum2 = 0
    for e ∈ v
        sum2 += parse(Int, e)
    end
    return sum, sum2
end

print(solution(100))
