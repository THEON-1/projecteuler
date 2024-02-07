include("../util/sieve.jl")
import .erastothenes_sieve: get_extended_sieve, run, get

function solution(n)
    s = get_extended_sieve()
    run(s, n)
    sum = 0
    for i = 1:n
        spds = compute_divisors(i, s)
        if spds > i
            spds_2 = compute_divisors(spds, s)
            if spds_2 == i
                sum += spds + spds_2
                println("found pair ", spds, ", ", spds_2)
            end
        end
    end
    return sum
end

function compute_divisors(value, s)
    if value == 1
        return 1
    end
    pvc = get(s, value, false)
    n = sum(collect(values(pvc[2])))
    pds = zeros(n)
    j = 1
    for key in keys(pvc[2])
        for i = 1:pvc[2][key]
            pds[j] = key
            j += 1
        end
    end
    divisors = Set([])
    for i = 1:2^n-1
        prod = 1
        for j = 0:length(pds)-1
            if i & (1 << j) > 0
                prod *= pds[j+1]
            end
        end
        push!(divisors, prod)
    end
    return round(Int, sum(collect(divisors)) + 1 - value)
end

println(solution(10000))
