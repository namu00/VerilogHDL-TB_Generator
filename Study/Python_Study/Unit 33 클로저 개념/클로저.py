def calc():
    a = 3
    b = 5
    def mul_add(x):
        return a * x + b
    return mul_add

c = calc() #클로저
#프로그램의 결과를 변수에 저장
print(c(1),c(2),c(3),c(4),c(5))