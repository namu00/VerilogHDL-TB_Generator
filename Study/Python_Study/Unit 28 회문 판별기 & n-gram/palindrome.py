word = input("문장을 입력하세요.")
word = list(word.strip('\n'))
temp = list(reversed(word))

state = False
for i in range(len(word)):
    if word[i] == temp[i]: state = True
    else: state = False
    
print(state)