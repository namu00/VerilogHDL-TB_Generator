#continue사용법

for i in range(10):
    if i % 3 != 0: continue # i가 3의 배수가 아니면, 다음 루프로 건너뜀
    print("Hello, World! %d" % i)

#출력 결과
#Hello, World! 0
#Hello, World! 3
#Hello, World! 6
#Hello, World! 9

#break 사용법
i = 0
while True:
    print(i)
    if i == 5: break#i 가 5일 경우, while문 종료
    i += 1

#출력 결과
#0
#1
#2
#3
#4
#5