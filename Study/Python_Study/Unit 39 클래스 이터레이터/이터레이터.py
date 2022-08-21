#이터레이터 = 값을 차례대로 꺼낼 수 있는 객체
#반복 가능한 객체

#이터레이터 사용법
class iteretor_name:
    def __iter__(self):
        #Code Here
        pass

    def __next__(self):
        #Code Here
        pass

#이터레이터를 이용한 카운터 설계 예시
class Counter:
    def __init__(self, stop):
        self.current = 0
        self.stop = stop

    def __iter__(self):
        return self
    
    def __next__(self):
        if self.current < self.stop:
            r = self.current
            self.current += 1
            return r
        
        else:
            raise StopIteration

if __name__ == "__main__":
    for i in Counter(3):
        print(i,end = ' ')