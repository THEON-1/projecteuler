import numpy as np
import math

n = 250
R = np.add(list(range(np.ceil(n*1.41))), 1)

LL = np.subtract(np.square(R), n**2)
L = np.clip(LL, 0, LL)

A_tri = np.divide(np.add(L, n), 2)
A_seg = np.multiply(np.divide(np.arccos(np.divide(n, L)), ), np.multiply(np.square(R), math.pi))
