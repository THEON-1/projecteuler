
function solution(a, b)
    S = Set{BigInt}()
    for i ∈ 2:a
        for j ∈ 2:b
            push!(S, BigInt(i)^j)
        end
    end
    return length(S)
end
