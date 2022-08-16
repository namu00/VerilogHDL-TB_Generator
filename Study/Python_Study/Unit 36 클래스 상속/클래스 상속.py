#클래스 상속
#기반 클래스를 파생하여 새로운 클래스를 만든 행위를 "클래스 상속"이라고 한다.

#기반클래스는 부모클래스(parent)/슈퍼클래스(super)
#파생클래스는 자식클래스(child)/서브클래스(sub)

#클래스 상속 예시

class car: #클래스 생성, 부모클래스
    def __init__(self, name):
        self.name = 'NONE'
        
class car_info(car): #클래스 상속, 자식클래스
    def __init__(self,brand,horsepower):
        self.brand = brand
        self.horsepower = horsepower
    
    def change_modelname(self, name): #부모클래스 attribute를 수정
        self.name = name 
        #분명, car_info에서는 name변수를 생성하지 않았다. ==> 클래스 상속 증거
        #자식클래스가 부모에게 상속받은 변수를 쓰는 모습

x = car_info("Mercedes","580HP")
x.change_modelname('S-Class 63 AMG')

print("Brand : %s" % x.brand)
print("Model : %s" % x.name)
print("Power : %s" % x.horsepower)