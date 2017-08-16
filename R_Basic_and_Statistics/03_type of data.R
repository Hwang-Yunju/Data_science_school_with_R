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

rep(1:3, times = 5, each = 3)     # each가 먼저 실행 후, times 실행
# argument를 생략하는 습관을 없애라!

c(rep(1, times = 100), rep(2, times = 50), rep(3, times = 13)) # 이거보다,
rep(1:3, times = c(100, 50, 13))  # 1이 100개, 2가 50개, 3이 13개

### (6) paste(벡터1, 벡터2, ...) ★
### 벡터의 각각의 원소들을 합쳐서 character 형태의 원소를 생성
### 변수명, 변수이름 naming 할때 매우 유용
paste(1, 1)
paste(1, 1, sep = "-")  # 공백 대신에 -를 넣어라
paste(1, 1, sep = "")   # 공백을 없앤다
paste(1:3, 1:3)   # 벡터화 (Vectorization) 결과 : "1 1" "2 2" "3 3"

paste("X", 1:4, sep = "")


### 2. vector의 속성
### (1) length(vector) : 벡터가 가지는 원소의 개수 (data의 개수)
age = c(26, 27, 25)
length(age)

### (2) names(vector) : 원소의 이름
names(age)  # NULL


############################## NA, NULL

# NA    : 공간은 존재하지만, 값이 지정되지 않았다
#         (Not Available = "Missing Value = 결측치, 결측값")
# NULL  : 공간자체가 없다.
#         (객체, 개체 Object, 데이터, 원소가 존재하지 않는다)

# NaN (Not a Number) -> NA와 비슷
# Inf, -Inf (Infinite)

?NA     # 연산 불가능. 결과가 모두 NA
?NULL   # 연산 가능. NULL은 무시하고 계산됨

length(NA)      # 1
length(NULL)    # 0

A <- c(1,NA,3,NULL,5)
A               # 1 NA 3 5
length(A)       # 4       ( NA은 길이에 포함 / NULL은 길이에 포함X )

N <- 1 + NA     # NA
N == 1          # NA
is.numeric(N)   # TRUE

NU <- 1 + NULL  # numeric(0)  
NU == 1         # logical(0)
is.numeric(NU)  # TRUE

?numeric(0)

### NA, NULL 데이터 확인
is.na()
is.infinite()

colSums(is.na())
colSums(is.infinite())

### NA, NULL 데이터 처리
mean(student$age, na.rm = TRUE)
student_1 <- na.omit(student)   #애초에 NA값이 들어가있는 행을 모두 제거
student[is.na(student)] <- 0    #NA값을 다른 값으로 대체

############################## NA, NULL

names(age) <- c("Ha", "Jeong", "Kim")   # names의 결과 : character vector!
age     # 결과 : vector

names(age) <- NULL
names(age)
age

### 3. 벡터의 슬라이싱(slicing) = 인덱싱(indexing)
###  vector 중에서 일부의 원소(들)를 추출
###  vector[index] : 대괄호[]를 사용
###  index가 1부터 시작함

income = c(500, 1000, 3500, 400, 300)
income[1]
income[2]
income[3]
income[4]
income[5]
income[6]   # NA  # NULL이 나와야하는거아닌가???

income[c(1,4,5)]  # 1번째, 4번째, 5번째 원소를 가져와라
income[2:5]       # 2번째부터 5번째까지 원소를 가져와라

income[seq(from = 1, to = length(income), by = 2)]

### 4. vector의 연산 : +, -, *, /, **, ^, %%, %/%
v1 = 1:3
v2 = 4:6

v3 <- v1 + v2 # index이 같은 아이들끼리 연산이 됨
v3

v3 <- 1:6
v1 + v3
# 재사용 규칙 (Recycling Rule)
# 작은 vector와 큰 vertor 연산시,
# 작은 vector가 큰 vector와 같은 크기가 될때까지 반복되어 계산됨

v4 <- 1:8  
v1; v4
vv <- v1 + v4 # error는 아니고! Warning mesage : vector끼리 배수의 관계여야함
vv
v5 <- 1:9
v1 + v5



############################################################
### [2] 요인(Factor)

### vector의 일종
### 집단(group)으로 인식함
### 1차원

### factor(vector, labels = , ordered = )
bt = c("AB", "AB", "A", "A", "B") # 같은 혈액형끼리 같다고 인식하지 못함
bt.factor = factor(bt)
bt.factor     #Levels : A AB B    # 알파벳 순서로 정렬

bt_factor = factor(bt, labels = c("A형", "AB형", "B형")) 
# levels에 나온 순서 그대로 적어주기
bt_factor

btFactor = factor(bt, 
                  levels = c("AB", "A", "B"), 
                  labels = c("AB형", "A형", "B형"),
                  ordered = TRUE) # shift + enter : 줄정렬
btFactor

### factor의 속성
### (1) levels(요인)
### (2) ordered(요인) : 집단의 순서가 의미 있도록 변경
bt.factor <- ordered(bt.factor)


aa <- c("a","c","a","a","b","c","d")
aa.factor <- factor(aa)


factor(aa,
       levels = c("a", "b", "c", "d"),
       labels = c("A", "B", "C", "D"))

factor(aa,
       levels = c("a", "b", "c", "d"),
       labels = c("A", "B", "C", "D"),
       ordered = TRUE)
A<D


bt.factor 


############################################################
### [3] 행렬(Matrix) ★

### 2차원
### 행(row)과 열(column)으로 구성되어 있음
### vector의 확장 (데이터 유형 하나만, recycling ... 등이 적용)
### 행렬의 이름은 대문자로!

### 1. 행렬을 만드는 방법
### (1) rbind(벡터1, 벡터2, ...) : vector를 행으로 놓기
###     cbind(벡터1, 벡터2, ...) : vector를 열로 놓기
v1 = 1:3
v2 = 4:6
M1 = rbind(v1, v2)
M1    # M1 2X3 (two by three matrix)

M2 = cbind(v1, v2)
M2

v3 <- 1:6
M3 <- cbind(v1, v2, v3)
M3    # M3 6X3 matrix  # recycling rule 적용!

### (2) matrix(벡터, nrow = , ncol = , byrow = )
matrix(1:4, nrow = 2, ncol = 2) # dafault값 : byrow = FALSE
# column이 row보다 우선이다!
# 1 3
# 2 4
matrix(1:4, nrow = 2, ncol = 2, byrow = TRUE)
# 1 2
# 3 4
a <- matrix(1:4, nrow = 3, ncol = 3)  # recycling
a


### 2. 행렬의 슬라이싱
### 행렬[행index, 열index]      # ,를 빼먹지 말기!
M3
M3[1   , ]
M3[1:2 , ]

M3[ , 1]
M3[ , 1:2]


### 3. 행렬의 덧셈과 뺄셈
### 계산하는 두행렬의 모양이 같아야함
A <- matrix(1:4, nrow = 2, ncol = 2)
B <- matrix(5:8, nrow = 2, ncol = 2)
A + B
A - B
A * B

### 4. 행렬의 곱셈 : A %*% B
### A[r1 X c1], B[r2 X c2]
### 조건 : c1 = r2
### 결과 : r1 X c2
A %*% B
B %*% A   # 위의 결과와 다르다


### 5. 역행렬(Reverse Matrix) : solve(matrix)
### 조건 1) 정방행렬(Square Matrix) : Row의 개수 = Column의 개수
###      2) 행렬식 != 0
solve(A)
A %*% solve(A)  # 행렬 X 역행렬 = 단위행렬(Identity Matrix : I)

A1 = matrix(c(2, 1, -1, 3), nrow = 2, ncol = 2)
A1
B1 = matrix(c(3, 10), nrow = 2, ncol = 1)
B1

solve(A1) %*% B1


### 6. 전치행렬(Transpose Matrix) : t(matrix)
### 행과 열을 바꿈
A
t(A)

### cf. 행렬의 속성은 [5] 데이터 프레임에서 다룰 예정

############################################################
### [4] 배열(Array)

### 다차원
### vector, matrix의 확장
### 데이터 유형을 하나만 갖는다, Recycling.. 등이 적용된다

### array(vector, dim = )
###  dim : 차원 정의 1개 넣으면 vector, 2개 넣으면 matrix, 3개 넣으면 array 등..
array(1:10, dim = 10)   # vector
array(1:10, dim = 12)   # 
array(1:10, dim = 3)    # 

array(1:10, dim = c(3, 4))       # 2차원 matrix

array(1:10, dim = c(3, 4, 2))    # 3차원 matrix

array(1:10, dim = c(3, 4, 2, 2)) # 4차원 matrix



############################################################
### [5] 데이터 프레임(Data.Frame) ★★

### 행과 열로 구성. 2차원 구조
### 여러개의 데이터 유형을 갖는다 (단, 1개의 열은 1개의 유형만 갖는다)
### 실제 다루게 될 data의 모습이다!

### data.frame(벡터1, 벡터2, 행렬, ...)
id <- 1:5     # 개인별 식별번호를 처음에 지정해줘야한다
gender <- c("M", "M", "M", "F", "M")
address <- c("구파발", "강동", "압구정", "수원", "용인")
survey <- data.frame(id, gender, address)
survey

### 데이터 프레임의 속성
### (1) 행의 개수 : nrow(데이터)      # numeric vector
nrow(student)

### (2) 열의 개수 = 변수의 개수 : ncol(데이터)      # numeric vector
ncol(student)

### (3) 행의 이름 : rownames(데이터)       # character vector
rownames(student)   # defailt : "1" "2" "3" ...

### (4) 열의 이름 = 변수의 이름 : colnames(데이터)      # character vector
colnames(student)

### (5) 차원(dimension) : 행, 열        # vector
### dim(데이터) 
dim(student)
dim(student)[1]
dim(student)[2]

### (6) 차원의 이름 : 행의 이름, 열의 이름        # List
dimnames(student)           # List
dimnames(student)[1]        # List
dimnames(student)[[1]]      # vector
dimnames(student)[[1]][3]   # vector의 3번째 data







############################################################
### [6] 리스트(List)

### 분석한 결과를 저장할 때 많이 사용하는 형태
### 가장 유연한 데이터 형태
### List의 원소로 vector, factor, matrix, array, dataframe, list를 가질수있음
### 회귀분석, 분산분석

### List 슬라이싱 방법
###  List[index]    : 결과가 List로!
###  List[[index]]  : 결과가 슬라이싱된 데이터의 유형으로!

v1 <- 1:10
v2 <- 1:3
m1 <- cbind(v1, v2)
result <- list(v1, v2, m1, survey)
result

result[1]     # List
result[[1]]   # vector

result[4]     # List
result[[4]]   # data.frame

