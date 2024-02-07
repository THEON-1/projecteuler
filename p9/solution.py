from math import gcd, sqrt, floor

def solution(s):
    m = floor(sqrt(s/2))
    while m > 0:
        diff = s - 2*m*m
        if gcd(diff, 2*m) == 2*m:
            n = diff//(2*m)
            if m > n & n > 0:
                return(m*m-n*n, 2*m*n, m*m+n*n, (m*m-n*n)*(2*m*n)*(m*m+n*n))
        m -= 1

print(solution(1000))