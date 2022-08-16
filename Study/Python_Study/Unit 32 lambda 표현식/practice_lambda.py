#다음 소스 코드를 완성하여 확장자가 .jpg, .png인 이미지 파일만 출력되게 만드세요.
#여기서는 람다 표현식을 사용해야 하며 출력 결과는 리스트 형태라야 합니다.
#람다 표현식에서 확장자를 검사할 때는 문자열 메서드를 활용하세요.

#소스코드
# files = ['font', '1.png', '10.jpg', '11.gif', '2.jpg', '3.png', 'table.xslx', 'spec.docx']
 
# print(                                                                           )

#실행결과
#['1.png', '10.jpg', '2.jpg', '3.png']

#########################################################
files = ['font', '1.png', '10.jpg', '11.gif', '2.jpg', '3.png', 'table.xslx', 'spec.docx']
 
print(list(filter(lambda x: x.find('.jpg') != -1 or x.find('.png') != -1, files)))