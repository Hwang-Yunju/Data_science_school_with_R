############################################################
### 수업내용 : 데이터 핸들링 = 데이터 전처리
### 작성자 : yunju hwang
### 작성일자 : 2017.07.19 (수)
############################################################

### Data Handling = Data Pre-processing

# package install, library는 항상 맨 위에 정렬하기
options(repos = "https://cran.rstudio.com")

install.packages("readxl")
install.packages("data.table")
install.packages("DT")

library(readxl)
library(data.table)
library(DT)

### 작업공간(Working Directory)
setwd("C:/R")

### 설정 : setwd("파일위치")
### getwd()

### 데이터 읽어오기
student = readxl::read_excel(path      = "student.xlsx",
                             sheet     = "data",
                             col_names = TRUE) # data 변수명을 그대로 사용

### 1. 데이터 전체 보기
### (1) View(데이터) : 새로운 script에 표로 보여줌
View(student)

### (2) 데이터 : Console에 출력
student

### 2. 데이터의 구조(Structure) 보기
### str(데이터)
str(student)

# tbl_df, tbl : S언어 기반 데이터 유형
# $로 data에 접근할 수 있다

### 3. 데이터의 일부 보기
### (1) head(데이터)
head(student)       # 기본 앞에서 6개를 보여줌
head(student, n=3)  # 앞에서 3개를 보여줌

### (2) tail(데이터)
tail(student)
tail(student, n=3)

### 4. 데이터 프레임의 속성
### (1) 행의 개수 : nrow(데이터)                    # numeric vector
nrow(student)

### (2) 열의 개수 = 변수의 개수 : ncol(데이터)      # numeric vector
ncol(student)

### (3) 행의 이름 : rownames(데이터)                # character vector
rownames(student)   # defailt : "1" "2" "3" ...

### (4) 열의 이름 = 변수의 이름 : colnames(데이터)  # character vector
colnames(student)

### (5) 차원(dimension) : 행, 열                    # vector
### dim(데이터) 
dim(student)
dim(student)[1]             # nrow
dim(student)[2]             # ncol

### (6) 차원의 이름 : 행의 이름, 열의 이름          # List
dimnames(student)           # List
dimnames(student)[1]        # List
dimnames(student)[[1]]      # vector      # = rownames
dimnames(student)[[2]]      # vector      # = colnames = 변수이름
dimnames(student)[[2]][3]   # vector      # data의 3번째 변수

### 5. 데이터(데이터 프레임)의 슬라이싱
### 데이터[행index,열index]

### (1) 열(Column) 추출 : 데이터[ ,index]
student[ , 1]  # id
student[ , 2]  # gender

student[ , c(2,3,6)]
student[ , 4:8]
student[ , seq(from = 2, to = ncol(student), by=2)] # length는 vector에서!

student[ , "weight"]
student[ , "height"]

student[ , c("weight","height")]  # :, seq는 numeric에만!

student = readxl::read_excel(path = "student.xlsx",
                             sheet = "data",
                             col_names = TRUE)

### 변수명에 특정한 패턴이 있는 것을 추출
### grep("패턴",문자열)           # 결과 : character vector

colnames(student)

### 변수명에서 'e'라는 글자를 포함하고 있는 변수명의 위치
grep("e",colnames(student))               # numeric vector

### 변수명에서 'e'라는 글자를 포함하고 있는 변수명
grep("e",colnames(student), value = TRUE) # character vector

### 변수명 중에서 'e'라는 글자를 포함하고 있는 data
student[ , grep("e",colnames(student), value = TRUE)]


### < 정규 표현식 >

### 변수명 중에서 'a'라는 글자로 시작하는 data
student[ , grep("^a",colnames(student), value = TRUE)]

### 변수명 중에서 't'라는 글자로 끝나는 data
student[ , grep("t$",colnames(student), value = TRUE)]

### 변수명 중에서 'a'앞뒤에 글자가 있는 data
student[ , grep(".a.",colnames(student), value = TRUE)]
student

### 변수명 중에서 'g'앞에 글자가 있는 data
student[ , grep(".g",colnames(student), value = TRUE)]

### 대체해라
gsub("[a-Z]","",문자열)

### social network analysis program

### (2) 행
student[1 , ]
student[c(1,3,4) , ]
student[4:10 , ]
student[seq(from = 1, to = nrow(student), by = 3) , ]


### vectorization!! -> for문으로 돌리지 않아도 모두 적용된다

### 성별이 여자인 data
student_female <- student[student$gender == "여자", ]
# '='로 쓰면 대체됨!(주의!!!)

### 거주지가 수원이 아닌 data
student[student$address != "수원", ]

### 몸무게가 50이하인 data
student[student$weight <= 50 , ]

### 나이가 30대 이상이고 키가 175 이상인 data
student[(student$age >= 30) & (student$height >= 175) , ]

### 나이가 30대 이상이거나 키가 175 이상인 data
student[(student$age >= 30) | (student$height >= 175) , ]

### &&와 &의 차이
X = 1:3 ; Y = 4:6
(X > 2) && (Y > 3)  # FALSE             # vector의 첫번째 항만 비교
(X > 2) & (Y > 3)   # FALSE FALSE TRUE  # vector의 모든 항을 비교


### (3) 행과 열
student[4:10 , c("weight","height")]


# 키가 170이상이고 몸무게가 60이상인 사람의 data 중, 변수명에 e가 들어간 data
student[(student$height >= 170) & (student$weight >= 60) ,
        grep("e",colnames(student), value = TRUE)]

### 6. 새로운 변수 만들기
### 데이터$변수명 = 연산(수식)

student$bmi = student$weight / ((student$height/100)^2)

student
### ifelse(조건문, 참일때 표현실, 거짓일때 표현식)
student$age.group = ifelse(student$age >= 30 , "30대 이상", "20대 이하")

student$age.group2 = ifelse(student$age >= 30 , "30대 이상",
                            ifelse(student$age >= 25, "20대 중반", "20대 초반"))

### cut(데이터명$변수명, breaks = 구간정보)
student$bmi.group3 = cut(student$bmi,
                         breaks = c(0, 18.5, 23, 25, 30),
                         # c대신에 :,seq도 가능
                         right = FALSE) 
# 이상 ~ 미만 (default : 초과 ~ 이하)
# 소괄호 옆에 있는 숫자는 포함X
# 중괄호 옆에 있는 숫자는 포함O

# () "소괄호" : 우선순위
# {} "중괄호" : for, if, 사용자 함수 등
# [] "대괄호" : 슬라이싱

# debugging : 문법적 오류를 찾아내는 것

score = readxl::read_excel(path = "score.xlsx",
                           sheet = 1,
                           col_names = TRUE)
str(score)
View(score)
score

score$avg = rowMeans(score[ , 2:6]) # 각 행별로 평균구하기


### 7. 데이터 값을 수정하기

home = readxl::read_excel(path = "home.xlsx",
                          sheet = 1,
                          col_names = TRUE)
str(home)
View(home)

home[home$price == 500, "price"] = 50
home[home$price == 50, "price"] = NA    # 이상한 데이터를 NA로 놓는 작업

### 8. 데이터 정렬

### (1) 벡터 정렬 : sort(벡터, decreasing = )
money = c(45, 50, 40, 50, 50, 30, 500)
money
sort(money, decreasing = FALSE)   # 오름차순 # default
sort(money, decreasing = TRUE)    # 내림차순

### (2) data.frame 정렬 : order(데이터명$변수명, decreasing = )
order(money)         # 6 3 1 2 4 5 7 (원data의 위치만 가져온다!)
# 정렬하면 원data의 index가 각각 6 3 1..인 애가 온다
money[order(money)]  # sort 완료

student[order(student$height) , ]
student[order(student$height, decreasing = TRUE) , ] # 내림차순

student[order(student$height, student$weight) , ]

student[order(student$gender, -student$height) , ]  # 숫자에만 -를 붙일수있다

# 성별 내림차순, 키 오름차순
student[order(student$gender, -student$height, decreasing = TRUE)  , ]

# 성별 오름차순, 거주지 내림차순
# 기본기능에서는 못함! data.table package 설치 (맨위에)

student = readxl::read_excel(path = "student.xlsx",
                             sheet = "data",
                             col_names = TRUE)

student
str(student)
is.data.frame(student)      # TRUE
is.data.table(student)      # FALSE

studentDT = as.data.table(student)
studentDT
str(studentDT)
is.data.table(studentDT)    # TRUE
is.data.frame(studentDT)    # TRUE

studentDT[order(gender, -address) , ]


### 시간이 얼마나 소요되는지를 알려주는 함수
### system.time(작업)

letters                   # "a" "b" ... "z"
sample(letters, size = 5) # 5개 random 추출

sample(letters, size = 1000000, replace = TRUE) # replace : 복원추출


################################################
### data.frame과 data.table의 차이점이 무엇일까

DataFrame = data.frame(id = 1:100, 
                       type = sample(letters, size = 100, replace = TRUE))
typeof(DataFrame)               # List
DataFrame[id == 100, "type"]    # 안된다!
DFF <- DataFrame[DataFrame$id == 100, "type"]    # 된다!  typeof = integer (?)

str(DataFrame)
str(DataFrame2)
str(DataTable)

DataFrame2 = as.data.table(DataFrame)
typeof(DataFrame2)              # List
DataFrame2[id == 100, "type"]   # 얘는 된다!

DataTable = data.table(id = 1:100,
                       type = sample(letters, size = 100, replace = TRUE))
typeof(DataTable)               # List
DataTable[id == 100, "type"]    # 얘는 된다!

################################################

# 행과 열이 1000000개
DF = data.frame(id   = 1:1000000,
                type = sample(letters, size = 1000000, replace = TRUE))

DT1 = data.table(id   = 1:1000000,
                 type = sample(letters, size = 1000000, replace = TRUE))

DT = as.data.table(DF)

DF[DF$type == "a" , ]

system.time(x =  DF[DF$type == "a" , ])   # error
system.time(x <- DF[DF$type == "a" , ])   # 이게 맞는 방법!

# 위와 같음
data.table::setkey(DT, type) # hash table 빨리 찾아줌. 가장 좋은 알고리즘을.
system.time(x <- DT[J("a"), ])

system.time(x <- DT[J(c("a","c")), ])

### 데이터를 다룰때 -> data.frame -> data.table 로 바꿔줘야한다!!

### data.table::setkey(), J(), fread(), datatable()

student[student$gender == "남자", ]

### 웹에 보여주는 기능 : DT Package
DT::datatable(student[student$gender == "남자", ]) # Viewer



### 9. 데이터 합치기

### (1) rbind(데이터1, 데이터2)
### 위 아래 합치기 (데이터 포맷이 같아야함)

df1 = data.frame(id = 1:3,
                 age = 10:12,
                 gender = c("F","F","M"))

df2 = data.frame(id = 4:5,
                 age = c(20,30),
                 gender = c("M","M"))

df1; df2

df3 = rbind(df1, df2)
df3

### (2) merge(데이터1, 데이터2, by = ) ★
### 왼쪽, 오른쪽 합치기

df4 = data.frame(id  = c(1,2,4,7),
                 age = c(10, 20, 40, 70))

df5 = data.frame(id     = c(1,2,3,6,10),
                 gender = c("M","M","F","M","F"))

df4; df5

## < merge의 4가지 방법 >

## 1) inner join      : merge(데이터1, 데이터2)   # 딱 2가지 data만 가능

##  각 data의 primary key가 일치하는 것만 합침

##  A = {1,2,4,7}
##  B = {1,2,3,6,10}
##  A와 B의 교집합 = {1,2}

merge(df4, df5)
merge(df4, df5, by = "id")  # primary key가 다수일때는 c(" "," ")

## 2) outer join

##    2.1) full join  : merge(데이터1, 데이터2, by = "", all = TRUE)

##        A = {1,2,4,7}
##        B = {1,2,3,6,10}
##        A와 B의 합집합 = {1,2,3,4,6,7,10}

# 숫자 공백 : NA / 문자 공백 : <NA>

merge(df4, df5, by = "id", all = TRUE)

##    2.2) left join  : merge(데이터1, 데이터2, by = "", all.x = TRUE)

##        왼쪽 data에 해당하는 primary key에 대해서만

merge(df4, df5, by = "id", all.x = TRUE)

##    2.3) right join  : merge(데이터1, 데이터2, by = "", all.y = TRUE)

##        왼쪽 data에 해당하는 primary key에 대해서만

merge(df4, df5, by = "id", all.y = TRUE)


### 10. R 데이터 저장하기
### (1) 외부 데이터로 저장하기
###  write.csv(R데이터, file = "파일위치/파일명.csv")

### 실제 데이터를 vector 형식이나 원래 형식 그대로 저장가능

write.csv(student,
          file = "student.csv",
          row.names = FALSE)    # 이미있으면 덮어쓰기됨

write.table() # 확장자 : .txt

### (2) R 데이터로 저장하기
###  save(R데이터, file = "파일위치/파일명.RData")

# R 파일은 주로 2가지 (.R : R script/ .RData : 실제 R 파일)

save(student, file = "student.RData")

rm(student)
student

### (3) R 데이터 불러오기
###  load(file = "파일위치/파일명.RData)

load(file = "student.RData")

student

