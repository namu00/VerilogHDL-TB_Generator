#리스트 또는 튜플 요소에 접근하는 방법
a= [1, 2, 3, 4, 5, 6]

#정방향 인덱스 호출 방법
a[0] #리스트 a의 첫 번재 요소 호출
a[5] #리스트 a의 마지막 요소 호출

#역방향 인덱스 호출 방법
a[-1] #리스트 a의 뒤에서 첫 번째 요소 호출
a[-2] #리스트 a의 뒤에서 두 번쨰 요소 호출

#인덱스의 범위를 넘어선 호출은 Index Outof Range오류가 발생한다.

#리스트 요소 삭제
del a[2] #리스트 a의 3번 째 요소 삭제

#튜플은 생성 이후 수정이 불가능한 자료형이다.
#튜플을 수정하기 위해서는, list()로 변환 후 수정해야 한다.
#range()와 str형은 del 기능을 지원하지 않는다.