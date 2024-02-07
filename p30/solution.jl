
function solution(p)
    V = Vector{Int}(undef, 0)
    for i ∈ 2:999999
        if i == sum(digits(i).^p)
            println(i)
            push!(V, i)
        end
    end
    return V
end
