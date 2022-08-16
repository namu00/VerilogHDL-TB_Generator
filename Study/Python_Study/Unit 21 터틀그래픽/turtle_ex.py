import turtle
turtle.shape('turtle')

#사각형을 그리는 터틀그래픽
def draw_squre():
    for i in range(4):
        turtle.forward(100)
        turtle.right(90)
    #turtle.done() 

#오각형을 그리는 터틀그래픽

def draw_pentagon():
    for i in range(5):
        turtle.forward(100)
        turtle.right(360/5)
    #turtle.done()

#다각형을 그리는 터틀그래픽
def draw_polygon():
    n = int(input())
    for i in range(n):
        turtle.forward(100)
        turtle.right(360/n)

#다각형 내부를 색칠하기
def draw_fill_polygon():
    n = 6
    turtle.color('red')
    turtle.begin_fill()
    for i in range(n):
        turtle.forward(100)
        turtle.right(360/n)
    turtle.end_fill()

#터틀그래픽 원 그리기
def draw_circle(n = 1):
    turtle.speed('fastest')
    for i in range(n):
        turtle.circle(120)
        turtle.right(360/n)
    
#복잡한 도형 그리기
def draw_complex():
    turtle.speed('fastest')
    for i in range(300):
        turtle.forward(i)
        turtle.right(91)