#딕셔너리: 키와 값을 pair로 저장하는 자료형
#생성 방법: 딕셔너리 = {key1 : value1, key2 : value2, ...}
#value는 중복이 가능하지만, key는 중복값이 없어야한다.

#딕셔너리 생성 방법
lux = {'health': 490, 'mana' : 334, 'armor': 18.72}
lux = dict(health = 490, mana = 334, armor = 18.72) #dict(key1=value1, key2 = value2, ...)

#비어있는 딕셔너리 생성 방법
darius = dict()
garen = {}

#딕셔너리 요소 접근 방법
#dictionary[key]
lux['health']

#딕셔너리 키에 값 할당하기
lux['mana'] = 860