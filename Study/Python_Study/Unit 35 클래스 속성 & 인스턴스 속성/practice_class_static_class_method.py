#다음 소스코드에서 Data클래스를 완성하세요.
#is_date_valid는 문자열이 올바른 날짜인지 검사하는 메서드입니다.
#날짜에서 월은 12월 까지 일은 31일 까지 있어야 합니다.

#소스코드
# class Date:
                                                                
#     ...
                                                                
 
# if Date.is_date_valid('2000-10-31'):
#     print('올바른 날짜 형식입니다.')
# else:
#     print('잘못된 날짜 형식입니다.')
    
    
#실행결과
#올바른 날짜 형식입니다.

#################################################################
    

class Date:
    @staticmethod
    
    def is_date_valid(date_string):
        year,month,day = map(int,date_string.split('-'))
        return month <=12 and day <= 31                                                                
 
if Date.is_date_valid('2000-10-31'):
    print('올바른 날짜 형식입니다.')
else:
    print('잘못된 날짜 형식입니다.')