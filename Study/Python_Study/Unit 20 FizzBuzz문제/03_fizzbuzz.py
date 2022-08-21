#앞선 multiple_of_3_5.py에서, 3과 5의 공배수를 처리해 출력하라.

for i in range(1,101):
    if i % 3 == 0 and i % 5 == 0:
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