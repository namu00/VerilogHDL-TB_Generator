#fizzbuzz.py 코드를 가능한 단축하여, 동일한 기능을 수행하는 명령줄을 완성하세요.

#fizzbuzz.py 소스코드
# for i in range(1,101):
#     if i % 3 == 0 and i % 5 == 0:
#         print("Fizz Buzz")
#         continue
#     elif i % 3 == 0 :
#         print('Fizz')
#         continue
#     elif i % 5 == 0 :
#         print('Buzz')
#         continue
#     else:
#         print(i)

for i in range(1,101):
    print('Fizz'*(i%3 == 0) + 'Buzz' * (i % 5 ==0) or i)