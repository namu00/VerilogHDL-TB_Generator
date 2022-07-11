#다음 소스코드를 완성하여 x를 y로 나누었을 때의 몫과 나머지를 출력되게 만드세요.

#소스코드
# x = 10
# y = 3
 
                                 
                                 
 
# quotient, remainder = get_quotient_remainder(x, y)
# print('몫: {0}, 나머지: {1}'.format(quotient, remainder))

#출력결과
#몫 : 3, 나머지 : 1

#####################################################
x = 10; y = 3
def get_quotient_remainder(a,b):
    return a//b, a%b


quotient, remainder = get_quotient_remainder(x, y)
print('몫: {0}, 나머지: {1}'.format(quotient, remainder))