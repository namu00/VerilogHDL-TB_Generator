#반복문의 반복 횟수가 정해지지 않았을 경우

#난수생성을 이용해, 주사위게임을 만들어보려고 한다.

import random

i = 0
while i != 3:
    i = random.randint(1,6) # 1 ~ 6 사이의 난수를 생성
    print(i)
#i가 3이 아닐 때만 while문이 동작한다.
#while문은 내부에서 Condition Operator를 변경할 수 있기 때문에,
#조건이 정해지지 않은 반복문장에서 유용하게 사용할 수 있다.