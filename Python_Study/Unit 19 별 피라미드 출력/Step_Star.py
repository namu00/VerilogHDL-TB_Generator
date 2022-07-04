#계단식 별 출력
#이중 for문 사용
for i in range(0,10):
    for j in range(0,i):
        print('*', end = '')
    print('')#개행
        
#이중 while문 사용
i = 0
while i < 10:
    j = 0
    while j < i:
        print('*',end='')
        j += 1
    
    print('')#개행
    i += 1