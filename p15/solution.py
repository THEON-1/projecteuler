from math import factorial

def solution(a, b):
    return factorial(a+b) / (factorial(a) * factorial(b))

print(solution(20, 20))