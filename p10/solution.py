from util.sieve import sieve

def solution(n):
    p, s = sieve(n)
    return sum(p)

print(solution(2000000))