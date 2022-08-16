#다음 소스코드를 완성하여 함수 c를 호출할 때마다 호출 횟수가 출력되게 만드세요.
#여기서는 함수를 클로저로 만들어야 합니다.

#소스코드#
# def counter():
#     i = 0
#     def count():
                       
#         ...
                       
 
# c = counter()
# for i in range(10):
#     print(c(), end=' ')

#실행결과
#1 2 3 4 5 6 8 9 10

#######################################
def counter():
    i = 0
    def count():
        i += 1
        return i
    return count
                       
 
c = counter()
for i in range(10):
    print(c(), end=' ')