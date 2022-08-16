#집합 연산 사용법

#합집합
#세트1 | 세트2
#set.union(세트1, 세트2)
from curses import A_ALTCHARSET


a = {1,2,3,4}
b = {3,4,5,6}
print(a | b)
print(set.union(a,b))

#교집합
#세트1 & 세트2
#set.intersection(세트1,세트2)
print(a&b)
print(set.intersection(a,b))

#차집합
#세트1 - 세트2
#set.difference(세트1,세트2)
print(a - b)
set.difference(a,b)

#대칭차집합(XOR)
#세트1 ^ 세트2
#set.symmetric_difference(세트1,세트2)
print(a^b)
print(set.symmetric_difference(a,b))

#################################################

#집합 요소 추가
#세트1 |= 세트2
#세트1.update(세트2)
a = {1,2,3,4}

a |={5}
print(a)
a.update(6,7,8,9)
print(a)

#교집합 세트 저장
#세트1 &= 세트2
#세트1.intersection_update(세트2)
a = {1,2,3,4}
a &= { 0,1,2,7,8,9}
print(a)

a.intersection_update({0,1,2,3,4,5})
print(a)

#차집합 세트 저장
#세트1 -= 세트2
#세트1.difference_update(세트2)
a = {1,2,3,4}
a -= {3}
print(a)

a.difference_update({3})
print(a)

#대칭차집합 세트 저장
#세트1 ^= 세트2
#세트1.symmetric_difference_update(세트2)
a = {1,2,3,4}
a ^= {3,4,5,6}
print(a)
print(a.symmetric_difference_update({3,4,5,6}))