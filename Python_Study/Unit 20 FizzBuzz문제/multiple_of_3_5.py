#1 부터 100까지의 숫자 중, 
#3의 배수는 Fizz를 출력,
#5의 배수는 Buzz를 출력,
#나머지 숫자는 숫자 그대로 출력해라

for i in range(1,101):
    if i % 3 == 0 :
        print('Fizz')
        continue
    elif i % 5 == 0 :
        print('Buzz')
        continue
    else:
        print(i)