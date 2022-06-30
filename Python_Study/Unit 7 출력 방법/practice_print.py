#다음 소스코드를 완성하여 날짜와 시간이 출력되게 만드세요.

#year = 2000
#month = 10
#day = 27
#hour = 11
#minute = 43
#second = 59
 
#print(year, month, day, ①               )
#print(hour, minute, second, ②       )

#실행 결과
# 2000/10/27 11:43:59

year = 2000
month = 10
day = 27
hour = 11
minute = 43
second = 59
 
print(year, month, day, sep = '/', end = ' ' )
print(hour, minute, second, sep = ':')