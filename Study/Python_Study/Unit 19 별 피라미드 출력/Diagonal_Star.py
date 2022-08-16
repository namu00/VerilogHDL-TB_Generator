#대각선으로 별 출력
for i in range(5):
    for j in range(5):
        if j == i : print('*',end = '')
        else : print(' ', end = '')
    print('')