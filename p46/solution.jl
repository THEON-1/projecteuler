include("../util/sieve.jl")
import .erastothenes_sieve: get_sieve, run, get, get_primes, get_composites

function solution(n::Int)
    sieve = get_sieve()
    run(sieve, n)
    primes = get_primes(sieve)
    composites = vcat([0], get_composites(sieve));
    n_max = primes[end]
    composite_doable = falses(n_max)
    for i = 0:floor(sqrt(n))
        for p = primes
            number = p + 2*i*i
            if number <= n_max
                composite_doable[Int(number)] = true
            end
        end
    end
    for i = 1:length(composite_doable)
        if !composite_doable[i] && !iseven(i)
            println(i)
        end
    end
end

solution(10000)