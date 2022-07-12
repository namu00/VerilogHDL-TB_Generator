import math

class point2d:
    def __init__(self,x,y):
        self.x = x
        self.y = y
p1 = point2d(x = 30, y = 20)
p2 = point2d(x = 60, y = 50)

print("current location")
print("p1 : (%d ,%d)" % (p1.x, p1.y))
print("p2 : (%d ,%d)" % (p2.x, p2.y))

a = p2.x - p1.x
b = p2.y - p2.y

c = math.sqrt(pow(a,2.0) + pow(b,2.0))

print("\nDistance")
print(c)