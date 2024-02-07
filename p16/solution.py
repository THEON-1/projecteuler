def solution(n):
    return sum([int(d) for d in str(2**n)])

print(solution(1000))