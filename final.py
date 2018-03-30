def calc_for3(l, num):
    cnt = 0 
    i = 0
    j = -1
    while(l[j] != l[0] and l[i] != l[-1] ):

        t_sum = l[i] + l[j]
        if t_sum <= num:
            diff = num - t_sum
            if diff == 0:
                print "2num ans %d %d " %(l[i],l[j])
                cnt = cnt + 1
            elif diff == l[i] or diff == l[j]:
                print "Got ans 2 with repeat tuple %d %d %d " % (diff, l[i], l [j])
                cnt = cnt + 0.5
            elif diff < l[i]:
                k = 0
                while(l[k] <= diff):
                    # print "For %d %d checkin K value %d" % (l[i],l[j], l[k])
                    if l[k] == diff:
                        print "Got ans 3 tuple %d %d %d " % (l[k], l[i], l [j])
                        cnt = cnt + 1
                    k = k + 1
            i = i+1
        elif t_sum > num:
            j = j - 1
        # else:
            # if (l[i]*2 + l[j] == num) or (l[i] + l[j]*2 ==num):
            # print "Current ans is %d %d" % (l[i], l [j])
            # cnt = cnt +1
            # i = i + 1
    return cnt * 8

def calc_for1(l,num):
    cnt = 0
    n = num/3 
    if num % 3 == 1:
        return cnt
    for v in l:
        if n == v:
            print "Single ans is %d" % v
            cnt = cnt + 1
    return cnt
            


def all_applied_num(num):
    l = [0]
    i = 1
    while l[-1] + i <= num:
        temp = l[-1] + i
        l.append(temp)
        i = i + 1
    print(len(l))
    return l



num = 1000000
# num = 10
# num = 17526000000000
l = all_applied_num(num)

print l

total = calc_for1(l,num)
total = total + calc_for3(l, num)
print total

