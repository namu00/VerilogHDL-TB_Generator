#반복문은 반복되는 명령줄을 시행하는데 사용된다.
#사용법은 다음과 같다.

for i in range(0,10): #i를 변수로 사용하는데, i는  0 ~ 9까지 순차적으로 커진다.
    print("Hello, World!") #반복실행 명령

for i in range(0,100,2): 
    pass
#위 FOR문에서 range()를 사용했는데, range함수가 지원하는 모든 기능을 사용할 수 있다.

#for문은 다음과 같이 시퀀스 객체로도 반복문을 수행할 수 있다.
a = [1,2,3,4,5]
b = (10,20,30,40,50)

for i in a:
    print(i)
    
for i in b:
    print(i)
    
for i in 'String':
    print(i)