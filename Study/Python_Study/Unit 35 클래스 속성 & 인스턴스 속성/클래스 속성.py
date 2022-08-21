#클래스 속성 이용하기
class Car:
    car_info = []
    def insert_data(self,data):
        self.car_info.append(data) #클래스 속성 편집

s63amg = Car()
s63amg.insert_data("580hp, 78kg * m, 0-100km/h 4.5sec")
#인스턴스 속성 편집
print(s63amg.car_info)

#클래스 내부의 정보를 변경 = 클래스 속성 편집
#클래스 객체 내부의 정보를 변경 = 클래스 객체 속성 편집