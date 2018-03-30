from itertools import *
from fractions import Fraction
a = [1]

for i in range(1,100):
    print(i)
        a = a + [i*2,1,1]
a = a[:99]
print(a)


last = Fraction(0,1)
flag =True
a.reverse()
print(a)
for i in a:
    #	print(i)
        if not flag:
            last = Fraction(1,1) / last
        if flag:
            flag = False

        last = last + Fraction(i,1)
        print(last)
last = Fraction(1,1) / last
last = last + Fraction(2)

num = last.numerator
print(num)

print(sum([int(x) for x in str(num)]))
