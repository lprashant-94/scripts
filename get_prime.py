import math
primes = [2]
for i in range(3, 1000000):
    sq = math.sqrt(i)
    is_prime = True
    for j in primes:
        if i % j == 0:
            is_prime = False
            break
        if j > int(sq):
            break
    if is_prime:
        primes.append(i)
print(len(primes))
# print primes
print primes[10000]

        
