############################################################
### 수업내용 : 기초 데이터 분석
### 작성자 : yunju hwang
### 작성일자 : 2017.07.20 (목)
############################################################

###    작업공간 설정
setwd("C:/R")

### 예제 데이터 : hflights::hflights

options(repos = "https://cran.rstudio.com")

install.packages("hflights")
install.packages("DT")
install.packages("prettyR")
install.packages("psych")

library(hflights)
library(DT)
library(prettyR)
library(psych)

### 데이터 일부 보기
DT::datatable(head(hflights))

### 자료의 종류 : 통계적인 관점

###   1. 질적 자료 : 글자(문자), 숫자 (의미 X)  (ex. A형=1,B형=2,AB형=3...)

###     기준&정의(Definition) : 숫자가 의미가 있는가?
###                             +, - 연산이 되는가?

###   2. 양적 자료 : 숫자 (의미 O)


############################################################
### Ⅰ.  일변량 (Uni-variate) 질적 자료의 분석 
############################################################

### 1. 표 = 빈도표 : 빈도(frequency), 백분율(percent)
### (1) 빈도 : table(데이터명$변수명)     # 0 ~ 1 값 
table(hflights$Month)  # 월별 현황        # vector (names 포함)
freq = sort( table(hflights$Month) , decreasing = TRUE )
                       # 내림차순으로 보여주는게 필요하다!

### (2) 백분율 = (빈도 / 합계) * 100      # 0 ~ 100 값
### prop.table(빈도결과) * 100
prop.table( table(hflights$Month) ) * 100   # vector (names 포함)
sort( prop.table(table(hflights$Month)) * 100 , decreasing = TRUE)

# 반올림하기 round( x , digits = i)       # 소수 i번째 자리까지 보여준다
percent = round(sort( prop.table(table(hflights$Month)) * 100 ,
                      decreasing = TRUE),
                digits = 1)     # 소숫점 첫째자리까지 (둘째자리에서 반올림)

### (3) 빈도 + 백분율 : cbind

month.table = cbind(freq, persent)
DT::datatable(month.table)


### CSV로 저장하기!!
### write.csv(데이터.R , file = "파일위치/파일명.csv")

write.csv(month.table , file = "month.csv")

### 문제
View(hflights)
table(hflights$Dest)
freqDest = sort(table(hflights$Dest) , decreasing = TRUE)

persentDest = sort(prop.table( table(hflights$Dest) ) * 100 ,
                   decreasing = TRUE)
persentDest = round(persentDest, digits = 1)

dest.table = cbind(freqDest, persentDest)
DT::datatable(dest.table)
write.csv(dest.table , file = "dest.csv")

### 2. 그래프 : 막대그래프(세로, 가로), 원그래프      >> 항목5개 이상일때 
###       그래프는 수치를 보여주기 위한 것! 그래픽이 더 눈에 띄면 안돼!

### (1) 막대그래프 : barplot(빈도결과)

barplot( sort(table(hflights$Month) , decreasing = TRUE) )

### < 중요한 argument >
###   막대 색깔 : col = "color"

barplot( sort(table(hflights$Month) , decreasing = TRUE) ,
         col = "#EAEAEA" )

barplot( sort(table(hflights$Month) , decreasing = TRUE) ,  # 이렇게 하지마
         col = c("skyblue","#EAEAEA"))

barplot( sort(table(hflights$Month) , decreasing = TRUE) ,  # 이렇게 하지마
         col = rainbow(12))

###   제목 : main = "제목"
barplot( sort(table(hflights$Month) , decreasing = TRUE) ,
         col = "skyblue" ,
         main = "월별 운행현황")

###   y축 제목 : ylab = "축 제목"
barplot( sort(table(hflights$Month) , decreasing = TRUE) ,
         col = "skyblue" ,
         main = "월별 운항 현황",
         ylab = "운항횟수")

###   y축 눈금 : ylim = c(최소값, 최대값)  # y limit
barplot( sort(table(hflights$Month) , decreasing = TRUE) ,
         col = "lemonchiffon" ,
         main = "월별 운항 현황" ,
         ylab = "운항횟수" ,
         ylim = c(0, 25000))
              # 과장되어보일수있다! 안좋음! (항상 최솟값은 0으로 하기)

###   가로 막대 : horiz = TRUE             # horizontal
barplot( sort(table(hflights$Month) , decreasing = FALSE) , # FALSE
         col = "skyblue" ,
         main = "월별 운항 현황" ,
         xlab = "운항횟수" ,   # xlab
         xlim = c(0, 25000) ,  # xlim
         horiz = TRUE)


### (2) 원그래프 : barplot(빈도결과) : pie(빈도)      >> 항목5개 이하일때 

pie( sort(table(hflights$Dest) , decreasing = TRUE)[1:20] ) # [일부추출]

###    반지름 : radius = 0.8
pie( sort(table(hflights$Dest) , decreasing = TRUE)[1:20] ,
     radius = 1.0)

###    첫째 조각의 각도 : init.angle =      # 90가 적절하다
pie( sort(table(hflights$Dest), decreasing = TRUE)[1:20],
     radius = 1.0,
     init.angle = 90)

###    그래프 분류그룹? 개수 : length(table(hflights$Dest))
pie( sort(table(hflights$Dest), decreasing = TRUE)[1:20],
     col = rainbow(20),
     main = "Dest",
     radius = 1.0,
     init.angle = 90)

###     한 부분만 강조하기
pie( sort(table(hflights$Dest), decreasing = TRUE)[1:20],
     col = c( "orange", rep("#EAEAEA",times=19) ),
     main = "Dest",
     radius = 1.0,
     init.angle = 90)

### 그래프 관련 Package
ggplot2
lattice
plotly   # 웹 브라우저 상태에서 보여주는 것 
googleVis
ggmap

### 일변량 prettyR Package에 freq 함수!
  # 자동으로 빈도, 백분율 cbind / default = 내림차순 정렬
prettyR::freq(hflights$Month)
  # < 결과 >
  # %    : 백분율     (NA 포함)
  # %!NA : 유효백분율 (NA 제외, 실직적으로 응답한 사람)

prettyR::freq(hflights$Month,
              display.na = FALSE,  # 유효백분율 제외
              decr.order = FALSE)  # 내림차순 없앰 (실전에서 하지말기)
?freq






############################################################
### Ⅱ.  일변량 (Uni-variate) 양적 자료의 분석 
############################################################

### (1) 표 = 빈도표(구간의 빈도, 백분율)
### (2) 그래프 : 히스토그램, 상자그림
### (3) 기술통계량, 요약통계량

## < 구간의 개수를 정하는 방법 >

##    1) Sturge's Formular 
##       구간의 개수 = 1 + 3.3 * log(n)    (n:데이터의 개수)
##    2) 구간의 개수 = sqrt(n)


## < 도수분포표 그리는 방법 > 

##    1) 범위 = 최대값 - 최소값
##    2) 범위 / 구간의 개수 = 구간의 폭, 계급의 폭
##    3) 첫번째 구간에 최소값이 포함되도록
##    마지막 구간에 최대값이 포함되도록 조정


### 1. 표 : 구간의 빈도, 백분율
DT::datatable(head(hflights))

range()   # 최소값, 최대값을 알려주는 함수

ArrDelay.range = range(hflights$ArrDelay, na.rm = TRUE)  # missing value 제외

### 구간의 개수
interal.count = 1 + 3.3 * log10(length(hflights$ArrDelay))  # 18.67801
sqrt( length(hflights$ArrDelay) )           # 476.9654 (기각)

### 구간의 폭 = 계급의 폭
diff(ArrDelay.range) / interal.count        # 56.10875  -> 60

### 구간 만들기       # [-120, -60) / [-60, 0) / ... / [960, 1020)
##         -> 질적 자료가 되었다!
hflights$ArrDelay.group = cut( hflights$ArrDelay,
                               seq(from = -120, to = 1020, by = 60),
                               right = FALSE)

sort( table(hflights$ArrDelay.group) , decreasing = TRUE )
prop.table( table(hflights$ArrDelay.group) ) * 100
  
tableArrDelay = prettyR::freq(hflights$ArrDelay.group)

# DT의 table은 행렬구조일때만 나온다!


### 2. 그래프

### (1) 히스토그램(Histogram)

###  i) hist(데이터명$변수명)  : Sturge's Formular 방식채택! (구간 자동계산)
###       hist()에는 어떤 알고리즘이 들어갔을까.. 고민해보기

hist(hflights$ArrDelay)     # 알아서 구간도 정해줌

###  ii) hist(데이터명$변수명, breaks = 구간의 개수)  : 구간의 개수를 정할 수 있음

hist(hflights$ArrDelay, breaks = 50)

###  iii) hist(데이터명$변수명, breaks = 구간의 정보)  : 구간 마음대로 정할 수 있음

hist(hflights$ArrDelay,
     col = "skyblue",
     breaks = seq(from = -120, to = 1020, by = 60),
     xlim = c(-120, 1020))

mean(hflights$ArrDelay, na.rm = TRUE)
median(hflights$ArrDelay, na.rm = TRUE)

# 어떤 원인이 항공기 도착시간의 지연을 가져왔을까?
# 대부분의 값들은 어떤 항공기, 어디서 나왔을까. 원인은 뭘까

# 통계 이론에 갇히지 않아야한다! (ex. 정규화과정을 꼭 거치지 않아도 데이터를 잘 보여줄 수 있으면 사용한다)
# 다쿠치

# 데이터에 이상치가 있는가?
#     이상치(outlier) : 다른 통계치와 동떨어진 값치
#         -> 입력오류일까?
#         -> 이상치가 맞다면, 값을 delete(삭제), transformation(변환) 할지?
#                   -> transformation 방법 : log(), sqrt(), 1/x



### (2) 상자그림(Boxplot) : 이상치 유무   # 동그라미는 이상치!

###   i) boxplot(데이터명$변수명)

boxplot(hflights$ArrDelay)

money = c(40,50,50,50,40,50,40,70,30,40,50,60,250)
money2 = c(40,50,50,50,40,50,40,30,30,40,50,60,25)
boxplot(money)
boxplot(money2)



lotto = c(3,7,11,18,24,30,90)
boxplot(lotto)

 #  c(3,7,11,18,24,30,45)

#  1) 중위수 = 중앙값 (Median)  : 데이터의 개수를 반으로 나누는 값      # 18
#       -> data의 개수가 짝수일때 : 중간에 2개 값의 평균
#
#  2) 사분위수 (Quartile)  :
#       -> Medium : 중위수
#       -> Q1 : 중위수 빼고 앞부분에서 중간     # 7
#       -> Q3 : 중위수 빼고 뒤부분에서 중간     # 30
#
#  3) Q3 - Q1 : IQR (Inter Quartile Range)      # 30 - 7 = 23
#
#  4) 1.5 * IQR                                 # 1.5 * 23 = 34.5
#
#      내 팔길이는 어깨의 1.5배 "다름을 포용할 수 있는 나의 크기"
#      이 범위가 넘어가면 "이상하다"고 느낀다..
#
#  5) Q1 - 1.5 * IQR                            # -27.5
#     Q3 + 1.5 * IQR                            # 64.5
#       -> 이 두값을 벗어나는 값 = 이상치! 


###   ii) 집단별 상자그림 : boxplot(데이터명$변수명 ~ 데이터명$변수명)
###                         boxplot(양적자료 ~ 질적자료)
###               -> factor 형태로 나와야한다!

boxplot(hflights$ArrDelay ~ hflights$Origin)
boxplot(hflights$ArrDelay ~ hflights$Month)
boxplot(log(hflights$ArrDelay) ~ log(hflights$Month))


### 3. 기술통계량 = 요약통계량 = 숫자     => 표본에서 나온 값!
###         양적 자료에 대한 수치를 보고 질적 자료의 모습을 그려낼 수 있는 것!
### Descriptive Statistics = Summary Statistics

### 모수 (Parameter)    vs 통계량 (Statistics)  : 집단에 대한 모든 수치
### 모집단 (Population) vs 표본 (Sample)

### (1) 중심 = 대표값
###     평균, 절사평균, 중위수(중앙값), 최빈수(최빈값)
###
###   i) 평균 : mean(데이터명$변수명, na.rm = TRUE)
###         -> 이상치의 영향을 많이 받는다    
mean(hflights$ArrDelay, na.rm = TRUE)

###   ii) 5% 절사평균(Trimmed Mean) : mean(데이터명$변수명, trim = 0.05, na.rm = TRUE)
###         -> 작은쪽 5%, 큰쪽 5% 절사 (총10% 절사)
###      mean과 별 차이가 없네? 이상치가 별로 없는거같으니 그냥 mean써도 되겠다
mean(hflights$ArrDelay, trim = 0.1, na.rm = TRUE)

###   iii) 중위수(중앙값) : median(데이터명$변수명, na.rm = TRUE)
###         -> 이상치의 영향을 잘 받지 않는다    
median(hflights$ArrDelay, na.rm = TRUE)

###   iv) 최빈수(최빈값) (Mode)
###     : which.max(table(데이터명$변수명))
##                              # which:위치 / 빈도가 max인 which를 알려줌
###     : prettyR::Mode()

which.max(c(10,5,3,200))
which.max(table(hflights$ArrDelay))

prettyR::Mode(hflights$ArrDelay)

### (2) 퍼짐 = 산포 = 다름
### 범위, 사분위범위(사분위수범위), 분산, 표준편차, 중위수 절대 편ㅊ

###   i) 범위(Range)
range(hflights$ArrDelay, na.rm = TRUE)
diff( range(hflights$ArrDelay, na.rm = TRUE) )  # 범위

###   ii) 사분위범위 = 사분위수범위(IQR:Inter Quartile Range)
###       : IQR(데이터명$변수명)
IQR(hflights$ArrDelay, na.rm = TRUE)

# "범위랑 사분위범위가 많이 다를 경우, 이상치가 많구나~"

###   iii) (표본)분산 (variance) : var(데이터명$변수명, na.rm = TRUE)
###       degree of freedom (df) = s-1
var = var(hflights$ArrDelay, na.rm = TRUE)      # 분산의 결과 = (원래 단위)^2
sqrt(var)

###   iv) (표본)표준편차 (sd : standart Deviation)
###       : sd(데이터명$변수명, na.rm = TRUE)
###       -> '다름'을 표현하는데에 가장 좋다!!
sd(hflights$ArrDelay, na.rm = TRUE)

###   v) 중위수 절대 편차 (MAD : Median Absolute Deviation)
###       : mad(데이터명$변수명, na.rm = TRUE)
mad(hflights$ArrDelay, na.rm = TRUE)
#######
# c(1,2,3,5,7,8,10)
#
# 1) 중위수
#   5
#
# 2) data - 중위수 = 편차
#   -4  -3  -2  0  2  3  5
#
# 3) 2)의 절대값
#    4   3   2  0  2  3  5
#
# 4) 3)의 중위수
#   3 -> 중위수 절대 편차
#
#######


### (3) 분포의 모양

###   양적 자료에 대한 수치를 보고 질적 자료의 모습을 그려낼 수 있는 것!
###   통계분석을 하는 이유 : '다름'이 있기 때문이다!
###         -> 여기서 분석가가 해야할일 : '다름'을 수치화하고, 원인을 찾기

### i) 왜도(Skewness) : 대칭여부
###       왜도  = 0 : 대칭
###       왜도 != 0 : 비대칭
###       왜도  > 0 : 왼쪽으로 치우친 분포 (오른쪽 꼬리분포)
###       왜도  < 0 : 오른쪽으로 치우친 분포 (왼쪽 꼬리분포)

### ii) 첨도(Kurtosis) : 중심이 얼마나 뾰족한가?
###       첨도 > 0 중심이 높아진다
###       첨도 = 0 중심이 보통이다
###       첨도 < 0 중심이 평평하다

### 추가 Package 설치 필요 : psych::describe(), describeBy()
                                                  # By 는 집단 -> factor

psych::describe(hflights$ArrDelay, na.rm = TRUE)
# se : Standard Error 표준오차
#     -> 지금 표본에서 평균이 7.09분이 나왔는데,
#        다른 표본을 뽑으면 평균이 지금 표본의 평균과 se만큼 달라진다

psych::describeBy(hflights$ArrDelay, hflights$Origin)

# psych::describeBy(양적 자료, 질적 자료)
psych::describeBy(hflights$ArrDelay, hflights$Month)



### summary(데이터명$변수명)
summary(hflights$Month)
hflights$Month_factor = as.factor(hflights$Month)
summary(hflights$Month_factor)

summary(hflights$ArrDelay)


### summary(데이터명)
summary(hflights)


### by(양적자료, 질적자료, 함수명)
by(hflights$ArrDelay, hflights$Origin, mean, na.rm = TRUE)
by(hflights$ArrDelay, hflights$Origin, sd, na.rm = TRUE)
by(hflights$ArrDelay, hflights$Origin, summary, na.rm = TRUE)
by(hflights$ArrDelay, hflights$Origin, describe)

### () : 실행되고, 결과도 출력하라
(x=3)     # 결과 3도 바로 출력
