text = input('문장을 입력하세요:')
words = text.split()

for i in range(len(words)-1):
    print(words[i], words[i + 1])