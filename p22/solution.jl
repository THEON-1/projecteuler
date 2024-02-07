function solution()
    file_str = ""
    open(f -> file_str = read(f, String), "p22_/p022_names.txt")
    file_str_cleaned = replace(file_str, "\"" => "")
    names = sort!(split(file_str_cleaned, ","))
    n = length(names)
    f = char -> (Int(char) - 1)%32 + 1
    score = 0
    for i = 1:n
        score += sum(f.(collect(names[i])))*i
    end
    return score
end

println(solution())
