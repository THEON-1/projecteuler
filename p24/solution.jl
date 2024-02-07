
function solution(V, p)
    l = length(V)
    n = factorial(l)
    if p > n
        print("p too large")
        return
    end
    sort!(V)

    m = n
    r = p
    vals = zeros(Int, l-1)
    for i ∈ 0:(l-2)
        m = div(m, l-i)
        vals[i+1] = cld(r, m)
        r = mod(r-1, m)+1
    end
    sol = zeros(Int, l)
    V = copy(V)
    for i ∈ 1:(l-1)
        sol[i] = popat!(V, vals[i])
    end
    sol[l] = pop!(V)
    return sol
end

function printsols(V)
    for i ∈ 1:factorial(length(V))
        println(solution(V, i))
    end
end
