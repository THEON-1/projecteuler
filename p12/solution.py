from util.sieve import extended_sieve as sieve
from util.prod import prod

def solution(n):
    i = 1
    max_factors = 1
    s = sieve()
    while True:
        i += 1
        p_dec_0 = s.get(i)[1]
        p_dec_1 = s.get(i+1)[1]
        n_factors_0 = prod([p_dec_0[key]+1 if key != 2 else p_dec_0[key] for key in p_dec_0])
        n_factors_1 = prod([p_dec_1[key]+1 if key != 2 else p_dec_1[key] for key in p_dec_1])
        n_factors_product = n_factors_0 * n_factors_1
        if n_factors_product > max_factors:
            max_factors = n_factors_product
            print(max_factors)
            if n_factors_product > n:
                return i*(i+1)/2, n_factors_product

print(solution(500))
