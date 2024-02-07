function solution()
    n_months = 12
    n_years = 100
    n = 0
    day = 1
    for i = 1:n_months*n_years
        if (day-1)%7+1 == 7
            n += 1
        end
        day += step(i)
    end
    return n
end

function step(next::Int)
    year = (next-1)÷12+1
    month = (next-1)%12+1
    if month ∈ [4, 6, 9, 11]
        return 30
    elseif month ∈ [1, 3, 5, 7, 8, 10, 12]
        return 31
    elseif year % 4 == 0
        return 29
    else return 28
    end
end

# solved by chatGPT
println(solution())
