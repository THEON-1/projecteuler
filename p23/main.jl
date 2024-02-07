include("./../util/julia/erastothenes_extended_sieve.jl")
import .erastothenes_extended_sieve: extended_sieve, get_extended_sieve, run!
import Combinatorics: multiset_combinations

function answer(max)
    b = BitVector(undef, max)
    
    a = Vector{Int}(undef, 0)
    
    s = get_extended_sieve()
    run!(s, max)

    for i ∈ 1:max
        if ~s.sieve.sieve[i] && is_abundant(s.factors[i])
            push!(a, i)
        end
    end
    
    for i ∈ a
        for j ∈ a
            if i+j <= max
                b[i+j] = true
            end
        end
    end

    sum = 0
    for i ∈ 1:max
        if ~b[i]
            sum += i
        end
    end
    
    return sum
end

function is_abundant(V)
    n = length(V)
    sum = 1
    for i ∈ 1:n-1
        for j ∈ multiset_combinations(V, i)
            sum += prod(j)
        end
    end
    return sum > prod(V)
end
