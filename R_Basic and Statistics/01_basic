###########################################################
### 연습
###########################################################

# 한글이 인식되도록 지원하는 인코딩방식 Ask-> EUC_KR, CP949..
3 + 4;
x = rnorm(100000)
# random normal distribution
# 100000개의 normal distribution를 하는 난수 생성. x로 할당
# (평균인 0과 가까운 숫자가 가장 많이 나옴)
x
hist(x)
hist(x, col = "skyblue")
?hist

############################################################
### 수업내용 : 기초 사용법
### 작성자 : yunju hwang
### 작성일자 : 2017.07.17
############################################################

### 1. 연산자 (Operator)
###  (1) 산술 연산자 : +, -, *, /, **, ^, %%, %/%
3 + 4
3 - 4
3 * 4
3 / 4
3 ** 4    #거듭제곱 (사칙연산보다 우선순위가 높음)
3 ^ 4     #거듭제곱 (사칙연산보다 우선순위가 높음)
12 %% 5   #나머지
12 %/% 5  #몫

3 ^ (1/2)
sqrt(3)

###  (2) 할당 연산자 : <-, =, ->
x <- 3    #전문가들은 이것을 더 선호
x
y = 4     #함수를 쓸때 error가 날 경우가 있음
y
5 -> z
z

###  (3) 비교 연산자 : >, >=, <. <=, ==, !=, !
3 > 4
3 <= 4
3 == 4
3 != 4
!(3 == 4)

###  (4) 논리 연산자 : &(Ampersand, "and"), |(Vertical bar, "or")
###   타겟별 분석을 할때 자주 사용
(3 > 4) & (5 > 4)
(3 > 4) | (5 > 4)

### 데이터 분석
### 1) 전체 분석
### 2) 집단별 분석(여자, 남자, ...)
### 3) 타겟별 분석(여자 & 연봉1억이상 & 서울거주, ...)
### 4) 개인별 분석


### 2. 데이터의 유형(Type of Data)
###  (1) 수치형(Numeric)
###  (2) 문자형(Character)
###  (3) 논리형(Logical)
###  (4) ??? -> 거의 안쓰임
x <- 3
y1 <- 'Love is choice.'
y2 <- "Love is choice."
z <- TRUE

###### Memory Management
######  ctrl + L : 화면지우기
######  rm(x, y) : x, y 데이터 지우기
######  ls() : 데이터 set 전체
######  rm(list = ls()) : remove all

### 3. 데이터의 유형 알아내기
###  (1) mode(데이터) # return값을 항상 character로 준다!
mode(x)
mode(y1)
mode(z)
# if(mode(x) == "numeric") 이런방식으로 사용해야함

###  (2) is.xxxx(데이터) # return값을 항상 logical로 준다!
is.numeric(x)
is.character(y1)
is.character(z)
is.logical(z)
# if(is.numeric(x)) 이런방식으로 사용해야함


### 4. 강제적으로 데이터의 유형 변환(변경)하기
### as.xxxx(데이터)
x1 <- 3
x2 <- "3"
x3 <- "Lee"
x4 <- TRUE
x0 <- 0

as.numeric(x2)    # numeric : "" 안이 숫자로만 되있어야 바뀜
as.numeric(x3)    # error
as.numeric(x4)    # TRUE => 1

as.character(x1)  # character : 모든 것이 바뀜
as.character(x4)

as.logical(x1)    # 0이 아닌 모든 숫자는 TRUE
as.logical(x0)    # 0만 FALSE
as.logical(x3)    # NA : Not Available
as.logical(x2)    # NA : Not Available

?NA
?NULL
