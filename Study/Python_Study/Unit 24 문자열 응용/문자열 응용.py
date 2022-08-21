#문자열을 변경하는 방법
print('Hello, Replace_Me'.replace('Replace_Me', 'World!'))

#문자를 변경하는 방법
table = str.maketrans('abcde','12345') #변환 테이블 만들기 (map_data,value)
print('abcdffff'.translate(table)) #테이블을 참조하여 변환

#문자열 분리
print('Hello,World!'.split(','))

#문자열 병합
print(' '.join(['Hello', 'World!', 'Python'])) #공백을 기준점으로 문자열 병합

#대소문자 변환
print('python'.upper()) #대문자 변환
print('PYTHON'.lower()) #소문자 변환

#공백 삭제
str = ' Ferrari 488 GTB  '
print(str.lstrip()) #왼쪽 공백 삭제
print(str.rstrip()) #오른쪽 공백 삭제
print(str.strip()) #양쪽 공백 삭제

#특정 문자 삭제
str = ',kv Mercedes-Benz [['
print(str.lstrip(',kv')) # 왼쪽 특정 문자 삭제
print(str.rstrip('[[')) #오른쪽 특정 문자 삭제
print(str.strip(',kv[[')) #양쪽 특정 문자 삭제

#문자열 정렬
str = "WolksWagen, Das Auto."
print(str.ljust(30)) #총 30칸 문자열을 만들어 왼쪽정렬
print(str.rjust(30)) #총 30칸 문자열을 만들어 오른쪽정렬
print(str.center(30)) #총 30칸 문자열을 만들어 가운데정렬

#메서드 체이닝
#예시문제) 주어진 문자열에서 공백을 삭제하고 문자를 모두 대문자로 변경해라.
str = ' maxverstappen'
str = str.replace(' ','').upper() #이것이 메서드 체이닝
print(str) 

#문자열 위치 찾기
#find매서드 활용
str = "Vorsprung Durch Technik"
print(str.fine('Durch')) #target 문자열의 인덱스 위치를 반환
print(str.find('BMW')) #target 문자열이 없으면 -1을 반환

#index매서드 활용
print(str.index('sp')) # target문자열의 인덱스 위치를 반환, 문자열이 없으면 오류를 반환
print(str.rindex('sp')) #오른쪽에서 문자열 찾기

#문자열 개수 세기
str = 'BMW E92 M3'
print(str.count('M')) #target 문자열의 개수를 반환