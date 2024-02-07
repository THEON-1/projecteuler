from math import sqrt, floor

class sieve:
    
    def __init__(self):
        self.sieve = [False]
        self._length = 1
        self._target = 1

    def run(self, n):
        self._target = n
        self._elongate()
    
    def get(self, n):
        if n > self._length:
            self.run(n)
        return self.sieve[n-1]
    
    def _elongate(self):
        length = self._length
        target = self._target
        diff = target - length
        if diff > 0:
            self.sieve += [True for _ in range(diff)]
            for i in range(floor(sqrt(target))):
                if self.sieve[i]:
                    _floor = length//(i+1)
                    _ceil = target//(i+1)
                    for j in range(_floor, _ceil):
                        actual = (i+1)*(j+1)-1
                        if actual > i+1:
                            self.sieve[actual] = False
            self._length = target

class extended_sieve:

    def __init__(self):
        self.sieve = [[False, 1, []]]
        self._length = 1
        self._target = 1
        self.prerun_step = 1000

    def run(self, n):
        self._target = n
        self._elongate()
    
    def get(self, n):
        if n > self._length:
            self.run(n+self.prerun_step)
        prime_decomp = {}
        for e in self.sieve[n-1][2]:
            if e in list(prime_decomp.keys()):
                prime_decomp[e] += 1
            else:
                prime_decomp[e] = 1
        return [self.sieve[n-1][0], prime_decomp]
    
    def _elongate(self):
        length = self._length
        target = self._target
        diff = target - length
        if diff > 0:
            self.sieve += [[True, length+i+1, []] for i in range(diff)]
            for i in range(target):
                if self.sieve[i][0]:
                    if i+1 > length:
                        self.sieve[i][2] += [i+1]
                    _floor = length//(i+1)
                    _ceil = target//(i+1)
                    for j in range(_floor, _ceil):
                        actual = (i+1)*(j+1)-1
                        if actual > i+1:
                            old_entry = self.sieve[actual]
                            self.sieve[actual] = [False, old_entry[1]//(i+1), old_entry[2]+[i+1]]
                elif self.sieve[i][1] != 1:
                        old_entry = self.sieve[i]
                        self.sieve[i] = [False, 1, old_entry[2]+self.sieve[old_entry[1]-1][2]]
            self._length = target
