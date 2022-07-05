#다음 소스코드를 완성하여 평균 점수가 출력되게 만드세요.

#소스코드
# maria = {'korean': 94, 'english': 91, 'mathematics': 89, 'science': 83}                            
# print(average)

#실행결과
#89.25

###############################

maria = {'korean': 94, 'english': 91, 'mathematics': 89, 'science': 83}
average = sum(maria.values())/len(maria)
print(average)