def solution(n):
    n_steps = {}
    i = 1
    number = 1
    chain = [1]
    result = (i, len(chain))
    while i < n:
        if number == 1:
            chain_length = len(chain)
            for j in range(chain_length-1):
                n_steps[chain[j]] = chain_length - j
            if chain_length > result[1]:
                result = (i, chain_length)
            i += 1
            number = i
            chain = [i]
        if number in n_steps:
            chain_length = len(chain) + n_steps[number] - 1
            for j in range(len(chain)-1):
                n_steps[chain[j]] = chain_length - j
            if chain_length > result[1]:
                result = (i, chain_length)
            i += 1
            number = i
            chain = [i]
        elif number % 2 == 0:
            number //= 2
            chain.append(number)
        else:
            number = 3*number +1
            chain.append(number)
    return result

print(solution(1000000))