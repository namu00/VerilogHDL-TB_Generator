#다음 소스 코드를 완성하여 파일 경로에서 파일명만 출력되게 만드세요.
#단, 경로에서 폴더의 깊이가 달라지더라도 파일명만 출력할 수 있어야 합니다.

# #소스코드
# path = 'C:\\Users\\dojang\\AppData\\Local\\Programs\\Python\\Python36-32\\python.exe'
                                      
# ...
                                      
 
# print(filename)

#실행결과
#python.exe

#########################################################
path = 'C:\\Users\\dojang\\AppData\\Local\\Programs\\Python\\Python36-32\\python.exe'
filename = path.split('\\')
filename = filename[-1]
print(filename)