#클래스와 클래스 객체 선언 및 사용
class car: #클래스 선언
    brand = ''
    name = ''
    def __init__(self,name,brand): #클래스 내부 초기자
        self.name = name #클래스 속성 설정
        self.brand = brand #클래스 속성 설정

mercedes = car('S-Class','Mercedes') #클래스 객체 선언
bmw = car('F90 M5','BMW')
audi = car('e-tron GT', 'AUDI')    

print(mercedes.name, "/", mercedes.brand)
print(bmw.name, "/", bmw.brand)
print(audi.name, "/", audi.brand)