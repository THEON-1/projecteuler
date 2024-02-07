import numpy as np

def calc_quads(a, b):
    for i in range(a):
        for j in range(b):
            pos_1 = (i, j)
            for ii in range(a):
                for jj in range(b):
                    if (ii, jj) == pos_1:
                        continue
                    pos_2 = (ii, jj)
                    angle_12 = np.


                    blocked = [pos_1, pos_2]
                    delta_i = ii-i
                    delta_j = jj-j
                    gcd = np.gcd(abs(delta_i), abs(delta_j))
                    for k in range(gcd-1):
                        blocked.append(pos_1+(delta_i, delta_j)*(k+1))
                    for iii in range(a, b):
                        for jjj in range(a, b):
                            if (iii, jjj) in blocked:
                                continue
                            pos_3 = (iii, jjj)

                            for iiii in range(a):
                                for jjjj in range(b):
                                    if (iiii, jjjj) in blocked or (iiii, jjjj) == pos_3:
                                        continue
