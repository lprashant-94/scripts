def calc_for3(l, num):
    cnt =0 
    i = 0
    j = -1
    while(l[i][0] < l[j][0]):
        t_sum = l[i][0] + l[j][0]
        if t_sum < num:
            diff = num - t_sum
            k = 0
            while(l[k][0] <= diff):
                if l[k][0] == diff:
                    print "Got ans 3 tuple %d %d %d " % (l[k][0], l[i][0], l [j][0])
                    cnt = cnt + 1
                k = k + 1
            i = i+1
        elif t_sum > num:
            j = j - 1
        else:
            print "Current ans is %d %d" % (l[i][0], l [j][0])
            cnt = cnt +1
            i = i + 1
    return cnt * 8

def calc_for1(l,num):
    cnt = 0
    n = num /3 
    if num % 3 == 1:
        return
    for v in l:
        if n == v[0]:
            print "Single ans is %d" % v[0]
            cnt = cnt + 1
    return cnt



def all_applied_num(num):
    l = [(0,0,0)]
    m = {}
    i = 1
    while l[-1][0] + i <= num:
        temp = l[-1][0] + i
        l.append((temp, temp/3, temp % 1))
        i = i + 1
    print(len(l))
    return l



num = 1000
# num = 9
# num = 17526000000000
l = all_applied_num(num)

# print l

print(calc_for1(l,num))
print(calc_for3(l, num))
