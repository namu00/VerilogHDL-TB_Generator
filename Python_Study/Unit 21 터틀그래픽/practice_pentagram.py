#터틀그래픽으로 오각별을 그려라.
#각 변의 길이는 100
#별의 꼭지점은 144도 회전
#별의 다음 꼭지점을 그릴 때는 72도 회전

import turtle as t

n = 5
t.shape('turtle')
for i in range(n):
    t.forward(100)
    t.right(144)
    t.forward(100)
    t.left(72)
    
t.done()