#fizzbuzz.py를 수정하여, 논리연산자 없이 3과 5의 공배수를 처리해 츨력해라.

for i in range(1,101):
    if i % 15 == 0:
        print("Fizz Buzz")
        continue
    elif i % 3 == 0 :
        print('Fizz')
        continue
    elif i % 5 == 0 :
        print('Buzz')
        continue
    else:
        print(i)