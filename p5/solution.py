from math import gcd

def solution(n):
    solution = 1
    for i in range(n):
        solution = lcm(solution, i+1)
    return solution

def lcm(a, b):
    return a*b // gcd(a, b)


print(solution(20))