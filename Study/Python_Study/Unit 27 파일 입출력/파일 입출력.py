#파일 객체 생성방법
#file_instance = open('filename', mode)

#파일 편집
#file_instance.write('문자열')

#파일 읽기
#file_instance.read()
#file_instance.readlines()

#파일 객체 종료
#file_instance.close()

#####################################
fp = open('test.txt','w',encoding='UTF-8') #"test.txt" open
fp.write("Hello, World!\n") #Write String
fp.close() #close "test.txt"

fp = open('test.txt','r',encoding='UTF-8') #"test.txt" open
data = fp.readlines() #read file data
print(data) #print data
fp.close() #close "test.txt"