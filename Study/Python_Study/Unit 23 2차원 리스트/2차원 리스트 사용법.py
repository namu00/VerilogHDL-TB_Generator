#2차원 리스트의 생성
a = [[1,2],[3,4],[5,6]]

#2차원 리스트 요소에 접근
a[1][2]

#for문을 이용해 2차원 리스트 출력
#방법 1.
for x,y in a:
    print(x,y)

#방법 2.
for i in a:
    for j in i:
        print(j, end = ' ')
    print()
    
#방법 3.
for i in range(len(a)):
    for j in range(len(a[i])):
        print(j, end = ' ')
    print()

#while문을 이용해 2차원 리스트 출력
#방법 1.
i = 0
while i < len(a):
    x,y = len(a[i])
    print(x,y)
    i += 1
    
#방법 2.
i = 0
while i<len(a):
    j = 0
    while j < len(a[j]):
        print(a[i][j],end = ' ')
        j += 1
    print()
    i += 1

#2차원 리스트의 할당과 복사

#리스트 할당
b = a

#리스트 복사
import copy
b = copy.deepcopy(a)