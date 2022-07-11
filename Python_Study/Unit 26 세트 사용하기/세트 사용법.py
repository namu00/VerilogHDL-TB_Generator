#세트 = {값1, 값2, 값3}
#세트 = set('값1','값2','값3')
fruit = {'Strawberry','Grap','Oragne','Apple'}
car = {'Mercedes','KIA','BMW','AUDI','HYUNDAI'}
#세트 값은 순서가 정해져있지 않다.

#세트 요소 찾기
#값 in 세트
'Apple' in fruit
'Peach' in fruit
#값 not in 세트
'Peach' not in fruit
'Apple' not in fruit

##################################
#세트 요소 추가
#add(argument)
a={1,2,3,4}
a.add(5)

#세트 요소 삭제
#remove(argument)
a.remove(3)

#discard(argument)
a.discard(2) #요소 2를 버림 
a.discard(7) #a에 7이 없으니, a형태를 그대로 유지

#특정 요소 삭제
#set.pop(argument)
a = {1,2,3,4}
a.pop(1)

#요소 전체 삭제
#set.clear()
a = {1,1,1,1}
a.clear()

#요소 길이 구하기
#len(set)
a = {1,2,3,4,5,5,6,6,7,8,9}
len(a)