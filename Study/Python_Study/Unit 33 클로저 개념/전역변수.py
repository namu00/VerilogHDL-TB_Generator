#전역변수 사용예시
x = 20
def foo():
    x = x + 10
    print(x)
foo()
print(x) #x를 어디서 수정하더라도, 값이 변경됨.


#지역변수 사용예제
def local_variable():
    x = 10
    print(x)

print(x)
#함수 내부와 외부의 x값이 다름

#함수 내에서 전역변수 선언
def local_func():
    global y
    y = 10
    print(y)

print(y) #함수 외부에서도 변수 y에 접근할 수 있다