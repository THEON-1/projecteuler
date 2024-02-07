
function solution(n_max)
    longest_cycle = 0
    cycle_length = 0

    for i ∈ 2:n_max
        if check_if_finite(i)
            continue
        end

        println(i)

        n = 1
        p = i
        while ~(Set(digits(p)) == Set(9))
            p *= i
            @info n += 1
        end
        if n > cycle_length
            longest_cycle = i
            cycle_length = n
        end
    end
    return longest_cycle, cycle_length
end

function check_if_finite(n)
    print("checking ")
    println(n)
    k = n
    while k%2 == 0
        k = div(k, 2)
    end
    while k%5 == 0
        k = div(k, 5)
    end
    return k == 1
end
