from math import log10, floor

from numpy import number

def solution(digits):
    limit = 10**digits
    max_palindrome = 1
    numbers = (1, 1)
    for i in range(2, limit):
        for j in range(i, limit):
            product = i*j
            n_digits = floor(log10(product))+1
            digits = [(product//(10**n))%10 for n in range(n_digits)]
            palindrome = True
            for k in range(n_digits//2):
                if digits[k] != digits[-1-k]:
                    palindrome = False
                    break
            if palindrome & (product > max_palindrome):
                max_palindrome = product
                numbers = (i, j)
    return max_palindrome, numbers

print(solution(3))