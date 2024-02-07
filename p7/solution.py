from ctypes import util
from math import floor, sqrt
from util.sieve import sieve, extend_sieve

def solution(n):
    sieve_max = n
    p, s = sieve(sieve_max)
    while len(p) < n:
        sieve_max += n
        p, s = extend_sieve(sieve_max, s)
    return p[n-1]

print(solution(10001))