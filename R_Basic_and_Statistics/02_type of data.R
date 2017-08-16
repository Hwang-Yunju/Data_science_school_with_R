############################################################
### 수업내용 : 데이터의 형태(numeric, character)
### 작성자 : yunju hwang
### 작성일자 : 2017.07.17
############################################################

### [1] 벡터(Vector) ★★ 
### [2] 요인(Factor) -> 집단으로 인식 (군집분석시 사용)
### [3] 행렬(Matrix) ★
### [4] 배열(Array)
### [5] 데이터 프레임(Data.Frame) ★★
### [6] 리스트(List)
### [7] 데이터 테이블(Data.Table)
### [8] 시계열(Time Series) ☆


############################################################
### [1] 벡터(Vector)

### 하나 이상의 값(원소 : element)으로 이루어짐 #원소 1개짜리도 포함
### 하나의 열(column)로 되어 있음
### 하나의 데이터 유형만 갖는다 (Python의 경우는 여러가지 유형을 갖는다)

### 1. 벡터를 생성하는 방법

### (1) c(원소1, 원소2, ...)
###  c : combine, concatenate의 약자
###  numeric, character, logical 벡터를 만들 수 있음
###  원소들 간의 규칙이 없을 때에 사용함
age <- c(29, 21, 25, 24, 27)
age
mode(age)
is.numeric(age)

gender = c("female", "male", "male", "female", "male")
gender

marry = c(FALSE, FALSE, TRUE)
marry

v1 = c(1, "Lee", FALSE)
v1 # 모두 character로 바뀜

v2 = c(1, TRUE)
v2 # 모두 numeric으로 바뀜

### 데이터 유형 우선순위 : character > numeric > logical
### 데이터 유형은 우선순위가 높은 방향으로 자연스럽게 바뀐다

v1 <- c(7, 36, 96)
v2 <- c(8, 18, 28, 38)
vv <- c(v1, v2)
vv <- c(v1, v2)


### (2) start숫자 : end숫자

### numeric vector에만 적용됨
### 1씩 증가되는 숫자나 또는 1씩 감소되는 숫자로 이루어진 벡터를 생성
### 규칙이 있는 숫자들

### start:end
### start < end : 1씩 증가
### start > end : 1씩 감소
### start = end : start or end
### start 부터 시작해서 end를 넘지 않을 때까지 1씩 증가 또는 1씩 감소

1 : 5
5 : -1
1 : 10000
-2.3 : 1 # -2.3 -1.3 -0.3 0.7
1 : -2.3
# start가 정수면 end도 정수, start가 실수면 end도 실수

###  (3) seq(from=, to=, by=)
### seq : sequence 약자
### numeric vector에만 적용됨
### ':'의 확장

### from, to, by : arguments
### from : start
### to : end
### by : 증가 또는 감소의 폭

seq(from = 1, to = 10, by = 2)
seq(1, 10, 2)
seq(from = 5, to = 1, by = -0.1)
seq(5, 1, -0.1)

seq(0, 1, length.out=11) # 0에서 1까지의 숫자를 11개로 분할추출
seq(0, 1, length.out=15)


###  (4) sequence(숫자)
### numeric vector에만 적용됨
### 1 ~ '숫자' 사이의 정수로 이루어진 벡터
sequence(10)
sequence(3.7)


### (5) rep(vector, times=, each=)
### numeric, character, logical vector에 적용됨
### rep : replicate의 약자

rep(1, times = 10)
rep(1, each = 10)

rep(1:2, times = 10)              # 1 2 1 2 1 2 1 2 1 2 ...
rep(1:2, each = 10)               # 1 1 1 1 1... 2 2 2 2 2

rep(c("남자","여자"), each = 10)  # "남자" "남자" ... "여자" "여자" "여자" 

rep(1:3, each = 3)
rep(1:3, times = 3)
