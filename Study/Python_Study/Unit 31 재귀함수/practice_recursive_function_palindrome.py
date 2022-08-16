#다음 소스코드를 완성하여 문자열이 회문인지 판별하고,
#결과를 True, False로 출력되게 만드세요.
#여기서는 재귀호출을 사용합니다.

# ##소스코드
# def is_palindrome(word):
                                    
#     ...
                                    
 
# print(is_palindrome('hello'))
# print(is_palindrome('level'))

#실행 결과
#False
#True
#################################################

def is_palindrome(word):
    if len(word) < 2:
        return True
    if word[0] != word[-1]:
        return False
    return is_palindrome(word[1:-1])

print(is_palindrome('hello'))
print(is_palindrome('level'))