

sum =0 
def fib(l):
    return (l[1], l[0]+l[1])
l = [1,1]
for i in range(31):
    l = fib(l)
    if l[1] > 4000000:
        print 'stop here %d ' % i
    if l[1] % 2 == 0:
        sum+=l[1]
    print(l[1])
print sum