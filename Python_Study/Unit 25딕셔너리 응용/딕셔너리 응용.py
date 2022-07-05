#딕셔너리 키-값 쌍 추가하기
#setdefault 키 추가(Value는 None으로 지정됨)
#update 키 값 수정

x = {'a':10, 'b' : 20, 'c' : 30, 'd' : 40}
x.setdefault('e') #e : None
x.update(e = 50) # e : 50
x.update(f = 60) # 새로운 키-값 쌍 추가

#딕셔너리에 키-값 쌍 삭제하기
x.pop('a') # x의 a-pair 삭제

#딕셔너리에서 키-값 쌍을 모두 가져오기
#items 키-값 쌍을 모두 가져옴
#keys 키를 모두 가져옴
#values 값을 모두 가져옴

print(x.items()) #x의 key-value쌍을 가져옴
print(x.keys()) #x의 키를 모두 가져옴
print(x.values()) #x의 값을 모두 가져옴

######################################################
#딕셔너리 내용 출력
#Key-Value 쌍 출력
cars  = {'BMW' : 'M440i' , 'Mercedes' : 'E450_Coupe', 'Audi' : 'RS7' }
for key, value in cars.items():
    print(key, value)

#Key만 출력
for key in cars.keys():
    print(key)

#Value만 출력
for value in cars.values():
    print(value, end = ' ')