include("../util/sieve.jl")
import .erastothenes_sieve: get_sieve, is_prime, get_primes, run

function solution()
    s = get_sieve()
    run(s, 1000)
    amax = 0
    bmax = 0
    nmax = 0
    for a = -999:2:999
        println("value for a: ", a)
        for b = get_primes(s, 1000)
            if a+b > 1
                n = 0
                number = n*n+a*n+b
                while is_prime(s, number)
                    n += 1
                    number = n*n+a*n+b
                end
                if n > nmax
                    amax = a
                    bmax = b
                    nmax = n
                    println("found new maximum for:")
                    println("a= ", a)
                    println("b= ", b)
                    println("n= ", n)
                end
            end
        end
    end
    println('\n')
    println("a: ", amax, " b: ", bmax, " n: ", nmax)
    println(amax*bmax)
end

solution()
