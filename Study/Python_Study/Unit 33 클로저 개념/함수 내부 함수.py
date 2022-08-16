#함수 내 함수 선언 및 사용법
def print_hello():
    hello = "Hello, World!"
    def print_message():
        print(hello)
    print_message()
    