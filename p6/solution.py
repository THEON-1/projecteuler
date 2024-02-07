from re import S


def solution(n):
    s = n*(n+1)/2
    qos = s*s

    soq = 0
    for i in range(n):
        soq += (i+1)*(i+1)
    
    return abs(soq - qos)

print(solution(100))