#다음 소스 코드를 완성하여
#리스트 a에 들어있는 문자열 중에서 길이가 5인 것들만 리스트형태로 출력되게 만드세요.

#소스코드
# a = ['alpha', 'bravo', 'charlie', 'delta', 'echo', 'foxtrot', 'golf', 'hotel', 'india']
# b = [                           ]
 
# print(b)

#실행결과
#['alpha', 'bravo', 'delta', 'hotel', 'india']

###################################################################

a = ['alpha', 'bravo', 'charlie', 'delta', 'echo', 'foxtrot', 'golf', 'hotel', 'india']
b = [i for i in a if len(i)==5]
 
print(b)