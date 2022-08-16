#Pickle / Unpickle
#Pickle 파이썬 객체를 파일로 저장
#Unpickle 객체를 파이썬으로 불러옴

import pickle

brand = "Mercedes"
year = "2022"
title = "S-Class"
trim = "63-AMG"

with open('Mercedes.p','wb') as file: 
#Merceds.p파일을 바이너리 쓰기모드로 열고,
#file이라는 이름을 객체로 사용
    pickle.dump(brand, file) #dump push
    pickle.dump(year,file) #dump push
    pickle.dump(title,file) #dump push
    pickle.dump(trim,file) #dump push
    
with open('Mercedes.p','rb') as file:
#Mercedes.p파일을 바이너리 읽기 모드로 열고,
#file이라는 이름을 객체로 사용
    brand = pickle.load(file) #dump pull
    year = pickle.load(file) #dump pull
    title = pickle.load(file) #dump pull
    trim = pickle.load(file) #dump pull