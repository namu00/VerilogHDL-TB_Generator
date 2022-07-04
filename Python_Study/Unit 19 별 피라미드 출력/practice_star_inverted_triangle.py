#다음 소스코드를 완성하여 역삼각형 모향으로 별이 출력되게 만드세요.

# for i in range(5):
#     for j in range(5):
                                     
#         ...
                                     
#     print()

#실행 결과
# *****
#  ****
#   ***
#    **
#     *

######################################################

for i in range(5):
    for j in range(5):
        if j < i:
            print(' ',end='')
        else :
            print('*',end ='')
    print()