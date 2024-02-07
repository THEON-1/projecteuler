mutable struct sieve
    sieve::BitVector
    _length::Int
    _target::Int
    _prerun_size::Int
end

function get_sieve()
    return sieve([false], 1, 1, 1000)
end

function _elongate!(s::sieve)
    length = s._length
    target = s._target
    diff = target - length
    if diff > 0
        s.sieve = [s.sieve; trues(diff)]
        for i = 1:floor(Int, sqrt(target))
            if s.sieve[i]
                _floor = length÷i + 1
                _ceil = target÷i
                for j = _floor:_ceil
                    actual = i*j
                    if actual > i
                        s.sieve[actual] = false
                    end
                end
            end
        end
        s._length = target
    end
    return nothing
end

# runs the sieve until index n
function run!(s::sieve, n::Int)
    s._target = n
    _elongate!(s)
    return nothing
end

# fetches data about a specific integer
function get(s::sieve, n::Int, prerun=true::Bool)
    if n > s._length
        run(s, prerun ? n + s._prerun_size : n)
    end
    return s.sieve[n]
end

# returns all primes in the sieve
function get_primes(s::sieve, n_max=(-1)::Int)
    if n_max == -1
        trimmed_sieve = s.sieve
    else
        trimmed_sieve = s.sieve[1:n_max]
    end
    n = length(trimmed_sieve)
    c = count(trimmed_sieve)
    primes = Vector(undef, c)
    j = 1
    for i = 1:n
        if s.sieve[i]
            primes[j] = i
            j += 1
        end
    end
    return primes
end

function get_composites(s::sieve)
    n = length(s.sieve)
    c = count(s.sieve)
    composites = Vector(undef, n-c)
    j = 1
    for i = 1:n
        if !s.sieve[i]
            composites[j] = i
            j += 1
        end
    end
    return composites
end

function is_prime(s::sieve, i::Int)
    if i < 0 return false end
    run(s, i)
    return s.sieve[i]
end
