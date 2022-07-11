#단어가 줄 단위로 저장된 words.txt 파일이 주어집니다.
#다음 소스 코드를 완성하여 10자 이하인 단어의 개수가 출력되게 만드세요.

# #소스코드
# .....                          
#     count = 0
#     .....            
#     ...
#                            
#     print(count)

#실행 결과
# 4

###########################################################

filename = "./words.txt"
fp = open(filename, 'r', encoding='UTF-8')
data = fp.readlines()
fp.close()

cnt = 0
for i in range(len(data)):
    if len(data[i].strip('\n') ) >= 10 : cnt += 1
    
print(cnt)