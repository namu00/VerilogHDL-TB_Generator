#try except

def check_file():
#파일 존재 유무를 확인하는 함수
    try :
        #실행할 코드
        fp = open('test.txt','r',encoding='UTF-8')
    except:
        #예외 발생시, 처리 코드
        print("Can't Open File")
    else:
        #예외가 발생하지 않았을 때 실행할 코드
        return fp
    finally:
        #예외 발생여부와 상관없이 실행할 코드
        pass
