#for문을 이용해 별 직사각형 출력
for i in range(0,5):
    for i in range(5):
        print('*',end='')
    print('')

#while문을 이용해 별 직사각형 출력
i = 0
while i < 5:
    j = 0
    while j < 5:
        print('*',end='')
        j += 1
    print('')
    i += 1