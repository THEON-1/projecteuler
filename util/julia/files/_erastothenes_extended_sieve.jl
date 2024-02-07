include("_erastothenes_sieve.jl")
include("_math.jl")

mutable struct extended_sieve
    sieve::sieve
    factors::Vector{Vector{Int}}
end

function get_extended_sieve()
    return extended_sieve(sieve(falses(1), 1, 1, 1000), [[]])
end

function _elongate!(es::extended_sieve)
    s = es.sieve
    length = s._length
    target = s._target
    diff = target - length
    run!(s, target)

    factors = append!(es.factors, fill([], nneg(diff)))
    done = [trues(length); falses(diff)]
    if diff > 0
        for i ∈ get_primes(s)
            if i > length
                factors[i] = [i]
            end
            for j ∈ cld(length+1, i):fld(target, i)
                prod = i*j
                if ~done[prod]
                    if done[j]
                        index = searchsortedfirst(factors[j], i)
                        factors[prod] = insert!(copy(factors[j]), index, i)
                        done[prod] = true
                    else
                        push!(factors[prod], i)
                    end
                end
            end
        end
    end
    return Nothing
end

function run!(es::extended_sieve, n::Int)
    es.sieve._target = n;
    _elongate!(es)
    return Nothing
end

function get(es::extended_sieve, n::Int, prerun=true::Bool)
    if n > es.sieve._length
        run(s, prerun ? n + es.sieve._prerun_size : n)
    end
    return (es.sieve[n], es.factors[n])
end

function get_primes(es::extended_sieve)
    return get_primes(es.sieve)
end
