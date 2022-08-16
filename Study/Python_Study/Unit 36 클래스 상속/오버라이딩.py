#오버라이딩: 덮어쓴다 = 기반클래스를 무시한다.
#부모 메서드를 무시하고, 새로운 매서드를 만든다.

#예시

class Person:
    def greeting(self): #부모클래스 함수
        print('안녕하세요')

class Student(Person):
    def greeting(self): #부모클래스에 명시된 함수와 동일한 함수
        print("안녕하세요, 저는 학생입니다.")

chris = Student()
chris.greeting()
#출력 결과를 예상하면
#안녕하세요
#안녕하세요, 저는 학생입니다.

#겠지만, 실제로 출력되는 결과는

#안녕하세요, 저는 학생입니다
#만 출력된다. => 부모클래스 greeting함수가 무시되었다. 

#######################################################################

#슈퍼클래스로 오버라이딩
class Person:
    def greeting(self): #부모클래스 함수
        print('안녕하세요')

class Student(Person):
    def greeting(self): #부모클래스에 명시된 함수와 동일한 함수
        super().greeting() #부모클래스의 함수를 오버라이딩
        print("저는 학생입니다.")
        
#출력결과
#안녕하세요
#저는 학생입니다.
