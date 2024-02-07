
function solution(file)
    triangles_raw = read(file, String)
    triangles = split(triangles_raw, "\n")
    c = 0
    for triangle_raw ∈ triangles
        triangle = split(strip(triangle_raw), ",")
        ∠A = atan(parse(Int, triangle[2]), parse(Int, triangle[1]))
        ∠B = atan(parse(Int, triangle[4]), parse(Int, triangle[3]))
        ∠C = atan(parse(Int, triangle[6]), parse(Int, triangle[5]))

        ∠AB = ∠(∠A, ∠B)
        ∠AC = ∠(∠A, ∠C)
        if (∠AB*∠AC) >= 0 continue end

        ∠BA = ∠(∠B, ∠A)
        ∠BC = ∠(∠B, ∠C)
        if (∠BA*∠BC) < 0 c += 1 end
    end
    return c
end

function ∠(∠A, ∠B)
    ∠AB = mod2pi(∠B - ∠A + π) - π
    return ∠AB
end
