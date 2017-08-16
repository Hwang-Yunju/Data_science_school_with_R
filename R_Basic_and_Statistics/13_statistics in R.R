############################################################
### 수업내용 : statistics in R
### 작성자 : yunju hwang
### 작성일자 : 2017.07.27 (목)
############################################################


# Sampling(표본추출방법)
#   단순 무작위 표본 추출법은 과정 중에 반드시 한번은 포함되어야한다!

# 5점 척도 설문조사 : 원래는 순위형 자료이지만 보통 함수를 넣거나 평균을 내서 연속형 자료로 만든다!

# 질적자료는 원data를 그대로 냅두고 새로운 더미data를 만들어야한다!
#   ex) gender_Dm <- 남자 = 1, 여자 = 0
#       A_R (원래 값에 reverse 시켰다)


# 왜도(Skewness) : 비대칭도
# 왜도 > 0 (오른쪽꼬리분포) : 최빈값 < 중앙값 < 평균
# 왜도 < 0 (왼쪽꼬리분포)   : 평균 < 중앙값 < 최빈값


# 배반사건 : A,B가 동시에 일어나지 않는다
#         -> P(A or B)  = P(A) + P(B)
# 독립사건 : A가 B의 발생에 영향을 주지 않는다
#         -> P(A and B) = P(A) * P(B)
#            P(A|B) = P(A), P(B|A) = P(B)


# < 베이즈 정리 >

# 빈도주의적 관점 : 아직 발생하지 않은 미래의 일에 대해
# 베이지안적 관점 : 이미 발생한 사건의 발생원인에 대해 -> 회귀분석

# P(A|B) = P(A and B) / P(B)
# P(B|A) = P(A and B) / P(A)
# P(A and B) = P(B) * P(A|B)
#            = P(A) * P(B|A)

# P(A|가) = P(가 and A) / P(가)
#         = P(가 and A) / P(가 and A) + P(가 and B)
#         = P(A)*P(가|A) / P(A)*P(가|A) + P(B)*P(가|B)

# P(A|B, C) = P(A|C , B) * P(A|B) / P(C|B)



# 이산확률분포 : 이항분포, 포아송 분포, 다항분포, 초기하분포 ...
#        (매 시행이 독립일때는 이항분포 / 매 시행이 종속일때는 초기하분포)
# 연속확률분포 : 정규분포, t분포, 카이제곱분포, F분포 ...


### 모평균, 분산, 표준편차 추정 ppt.19

x <- c(170,177,165,180,174,169,182,175,174,176,
       177,175,178,170,170,175,177,167,180,174,
       169,180,174,175,178,177,175,178,172,172)
# 표본평균
xbar <- mean(x)

# 표본평균의 표본오차
SE <- sd(x) / sqrt( length(x) )

xbar # 174.5
SE   # 0.7531543




# qnorm(p, mean, sd)
# 정규분포에서 백분위수 구하는 함수 (mean = 0, sd = 1는 생략가능)
# 여기서 p = 1-alpha/2 (양측검정에서 alpha/2부분을 전체에서 제외한 부분)

z0 <- qnorm(p=c(0.975, 0.950, 0.90), mean = 0, sd = 1)
qnorm(0.95)
pnorm(1.65)


# 모표준편차
sigma <- 4
alpha <- 0.05
# alpha = 0.025
# 1-alpha/2 = 0.975
LCL <- xbar - qnorm(1-alpha/2) * sigma / sqrt(length(x))
UCL <- xbar + qnorm(1-alpha/2) * sigma / sqrt(length(x))
LCL   # 173.0686
UCL   # 175.9314


### 모비율 추정 ppt.20
n <- 100
x <- 10

phat <- x/n  # 표본 비율
SE <- sqrt( phat*(1-phat)/n )  # 표본비율의 표준오차

phat # 0.1
SE   # 0.03



##########################
# < R의 확률함수 >
# 
# d(pdf이용), p(cdf 이용), q(quantile 이용), r(해당분포의 난수생성)
#     pdf : 확률밀도함수
#     cdf : 누적확률분포함수
# 
# 이산형 분포 : binom(이항분포), multinom(다항분포), pois(포아송분포), geom(기하분포), multinom(초기하분포)
z0 <- qnorm(p = c(0.975, 0.950, 0.90), mean = 0, sd = 1)
round(z0, digit = 3)
p0 <- pnorm(q = c(-1.28, -1.64, -1.95), mean = 0, sd = 1, lower.tail = FALSE)
round(p0, digit = 4)
p1 <- pnorm(q = c(1.28, 1.64, 1.95), mean = 0, sd = 1, lower.tail = FALSE)
round(p1, digit = 4)




### plot(function(x) 함수식, xlim = x축범위, ylim = y축범위)
plot(c(1,2),c(3,4),
     xlim = c(0,3),
     ylim = c(0,5))
plot(function(x) x^2,
     xlim = c(0,3),
     ylim = c(0,5))

# 표준정규분포 그림 그리기
op <- par(yaxs = "i")
plot( function(x) dnorm(x, mean = 0, sd = 1),
      xlim = c(-3, 3),
      ylim = c(0, 0.5),
      main = "Normal Distribution" )
par(op)  # 원래상태로 회복한다



### Chi-Squared Distribution
# dchisq(x, df, ncp = 0, log = FALSE)
# pchisq(q, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# qchisq(p, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# rchisq(n, df, ncp = 0)

# 자유도에 따른 카이제곱분포의 변화
x <- rchisq(n = 100, df = 5)
hist(x, probability = TRUE, ylim = c(0, 0.20), main = "Chi-Square Distribution (df=5)")
curve(dchisq(x, df = 5), col = "red", add = TRUE)  # 막대그래프 위에 곡선그래프 그리기

x <- rchisq(n = 100, df = 10)
hist(x, prob = TRUE, ylim = c(0,0.20), main = "Chi-Square Distribution (df=10)")
curve(dchisq(x, df = 10), col = "red", add = TRUE)



### set.seed(변수) : 이 함수 실행후 나오는 random 결과를 set.seed(변수)에 저장한다
set.seed(1)
sample(letters, 5)
set.seed(5)
sample(letters, 5)

### 균일분포 Uniform Distribution
# 균일분포에서 난수 발생 후 barchart

set.seed(2010)  # 난수발생기 초기값 설정
rtable <- round(runif(100, min = 0, max = 100))
breaks <- seq(from = 1, to = 100, by = 20)
output <- table(cut(rtable, breaks, right = FALSE))
# 위에꺼 한꺼번에 쓰면,
output <- table( cut(round(runif(100, min = 0, max = 100)),
                     breaks = seq(from = 1, to = 100, by = 20),
                     right = FALSE) )
barplot(output, ylim = c(0,25), col = "mistyrose")



### 1에서 5까지의 숫자에서 복원추출하여 크기 100인 표본 임의 생성 후 평균 구하기
xmean <- numeric(0)   # numeric(10) : 크기가 10개인 numeric vector를 생성해라(초기값=0)
# 그냥 numeric(0)만 해줘도 됨!
for(i in 1:100){
  x <- sample(1:5, size = 100, replace = TRUE)
  xmean[i] <- mean(x)
}
xmean
hist(xmean, ylim = c(0,30), main = "Histogram")





### 이항분포 계산
# B(n, p)    # n : 시행횟수, p : 성공확률
# dbinom(x, n, p) : 이항확률밀도함수
# pbinom(x, n, p) : 이항누적확률함수

# 성공확률 p를 바꾸어주었을때
x <- seq(from = 0, to = 10)
win.graph()  # 다음 그래프를 새창에 띄워라
plot(x, dbinom(x, size = 10, p = 0.2), type = "h", ylab = "P(X=x)", lwd = 5)
# lwd : 선두께
# type = "h" : histogram-like vertical lines (점좌표를 막대그래프로!)
win.graph()
plot(x, dbinom(x, size = 10, p = 0.5), type = "h", ylab = "P(X=x)", lwd = 5)
win.graph()
plot(x, dbinom(x, size = 10, p = 0.8), type = "h", ylab = "P(X=x)", lwd = 5)


# 시행횟수 n을 바꾸어주었을때 -> 이항분포의 정규분포근사
n1 = 5; n2 = 10; n3 = 20; n4 = 30
x <- seq(0, 10)
plot(x, dbinom(x, n1, 0.2), type = "b", ylim = c(0, 0.5), xlab = "", ylab = "")
# type = "b" : 점 사이를 이어서 꺽은선 그래프로!
par(new = T)    # 이전에 실행한 그래프에 겹쳐서 그리기
plot(x, dbinom(x, n2, 0.2), type = "b", ylim = c(0, 0.5), xlab = "", ylab = "")
par(new = T)
plot(x, dbinom(x, n3, 0.2), type = "b", ylim = c(0, 0.5), xlab = "", ylab = "")
par(new = T)
plot(x, dbinom(x, n4, 0.2), type = "b", ylim = c(0, 0.5), xlab = "", ylab = "")


# x ~ B(50, 0.4), p(X >= 25)
x <- seq(0, 50)
n = 50; p = 0.4
plot(x, dbinom(x, n, p), type = "h", xlab = "", ylab = "")
par(new=T)
lines(x, dnorm(x, n*p, sqrt(n*p*(1-p))), col = "red")
# np = 50*0.4 = 20, npq = 50*0.4*0.6 = 12
# 얘로 하면 그래프가 꺽어진 직선형태
curve(dnorm(x, n*p, sqrt(n*p*(1-p))), col = "red", add = TRUE) # 얘로하면 그래프가 곡선



### 가설검정 문제
xbar <- 66; n <- 25
z <- (xbar-60) / (15/sqrt(25))
z # 2
1 - pnorm(z) # p-value : 0.02275013

# t검정
# t.test(x, y = NULL, alternative = c("two-sided", "less", "greater"), mu = 0)
x <- c(65, 70, 60, 55, 75, 65, 55, 60, 70, 60)

mean(x); sd(x)
t = (mean(x) - 60) / (sd(x)/sqrt(length(x)))
1-pt(t, 9)

t.test(x, alternative = "greater", mu = 60)  # 표본의 수가 적은 관계로 t검정 사용

#	One Sample t-test
#
# data:  x
# t( = (xbar-mu)/sigma) = 1.655, df = 9, p-value( = 1-pt(t,9)) = 0.06615
# alternative hypothesis: true mean is greater than 60
# 95 percent confidence interval:
#    59.6234     Inf
# sample estimates:
# mean of x 
#    63.5 

# ??
# One Sample t-test
#
# data:  x
# t = -16.813, df = 50, p-value = 1
# alternative hypothesis: true mean is greater than 60
# 95 percent confidence interval:
#    21.51133      Inf
# sample estimates:
# mean of x 
#    25 
#

#유의확률 계산
n <- length(x)
t <- (mean(x)-60) / (sd(x)/sqrt(n))
t  # 1.655032
1-pt(t, df=n-1) # p-value = 0.06615148

##
x <- c(3.4, 3.3, 4.2, 4.4, 3.7, 4.5, 4.6, 3.8, 4.1)
t.test(x, alternative = "two.sided", mu = 3.5)

# One Sample t-test
#
# data:  x
# t = 3.1623, df = 8, p-value = 0.01335
# alternative hypothesis: true mean is not equal to 3.5
# 95 percent confidence interval:
#   3.635389 4.364611
# sample estimates:
# mean of x 
#   4



n <- length(x)
t <- abs((mean(x)-3.5)/(sd(x)/sqrt(n)))  # abs(x) : |x|, x의 절대값
t   # 3.162278
2 * (1 - pt(t, df = n-1))  # 양측검정  # p-value = 0.01334906



xbar <- 19; n <- 36; s <- 3.4
z <- (xbar-20) / (s/sqrt(n)) 
z     #  -1.764706
pnorm(z) # 0.0388066




### 모비율검정 함수

# prop.test(x, n, p, alternative = c("two-sided", "less", "greater"))
prop.test(x = 6, n = 200, alternative = "less")

# 1-sample proportions test with continuity correction
#
# data:  6 out of 200, null probability 0.5
# X-squared = 174.84, df = 1, p-value < 2.2e-16
# alternative hypothesis: true p is less than 0.5
# 95 percent confidence interval:
#   0.00000000 0.06015521
# sample estimates:
#   p 
#   0.03 

p <- 0.032; n <- 200
phat = 0.03
var = (p * (1-p)) / n
z <- (phat-p) / sqrt(var)
z  # -0.1607061
pnorm(z) # 0.4361624




### 교차분석

# table( )을 사용해 주어진 벡터에서 a, b, c의 출현 횟수
table(c("a", "b", "b", "b", "c", "c", "d"))  # 변수와 빈도를 표시

df <- data.frame(x = c("a","b","C","d"),
                 y = c("1","2","3","4"),
                 num = c(100,200,300,400))
xtabs(num ~ x + y, data = df)

d <- data.frame(x   = c("1", "1", "2", "2"),
                y   = c("A", "B", "A", "B"),
                num = c(190, 230,  60, 20))
mytable <- xtabs(num ~ x + y, data = d)
# xtabs( )는 formula를 사용해 데이터를 지정
# 종속변수 ~ 독립변수
# x, y에 대해 table화 시킨다  # (1행,A열):190개, (1행,B열):230개...
mytable

(d2 <- data.frame(x = c("A", "A", "A", "B", "B")))
(xtabs(~ x, d2)) # x에 대해서 table화 시킨다


# 주변 합과 주변 비율은 margin.table( ), prop.table( )로 계산한다.

margin.table(mytable, 1) # A frequencies (summed over B) "행끼리의 합"
margin.table(mytable, 2) # B frequencies (summed over A) "열끼리의 합"

prop.table(mytable)      # cell percentages # table 전체를 1로 보았을때 비율
prop.table(mytable, 1)   # row percentages 
prop.table(mytable, 2)   # column percentages

#
d <- data.frame(x   = c("car", "car", "truck", "truck", "doll", "doll"),
                y   = c("Child1", "Child2", "Child1", "Child2", "Child1", "Child2"),
                num = c(5, 4, 11, 7, 1, 3))
mytable <- xtabs(num ~ x + y, data = d)
mytable

margin.table(mytable, 1) # A frequencies (summed over B) 
margin.table(mytable, 2) # B frequencies (summed over A)

prop.table(mytable)      # cell percentages
prop.table(mytable, 1)   # row percentages 
prop.table(mytable, 2)   # column percentages



### 카이제곱검ㅈ
# 자유도 = (행의 개수 - 1) * (열의 개수 - 1)
chisq.test(mytable)
# Warning message:In chisq.test(mytable) : Chi-squared approximation may be incorrect
## 5개가 안되는 것이 50% 이상 있기 때문에!?! -> fisher.test를 해준다!
fisher.test(mytable)


# x <- matrix(c(24, 3,5,12), nc = 2) 일때 검정해보자
x <- matrix(c(24, 3, 5, 12), ncol = 2)
x
colnames(x)<- c("A", "B")
rownames(x)<-c("X", "y")
margin.table(x, 1) # A frequencies (summed over B)
margin.table(x, 2) # B frequencies (summed over A)

prop.table(x)      # cell percentages
prop.table(x, 1)   # row percentages
prop.table(x, 2)   # column percentages

chisq.test(x)


### 일표본 t검정
# 3-1반의 학생들의 수학 평균성적은 55점이었다. 
# 0교시 수업을 시행하고 나서 학생들의 시험 성적은 다음과 같다.
# 58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39
# 교시 수업을 시행한 후, 학생들의 성적은 올랐다고 할 수 있는가?

a <- c(58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39)

shapiro.test(a)  #데이터가 정규분포를 하는지를 검사한다
# 정규분포를 따른다! p-value > 0.5라서 ?!?

t.test(a, mu=55, alternative="greater")  # 올랐다고 말할 수 없다


### 독립표본 t검정
pre<-c(13.2, 8.2, 10.9, 14.3, 10.7, 6.6, 9.5, 10.8, 8.8, 13.3)
post<-c(14.0, 8.8, 11.2, 14.2, 11.8, 6.4, 9.8, 11.3, 9.3, 13.6)
G<-c(1,2,2,1,1,2,2,2,1,1)
t.test(pre~G)  # p-value가 0.05보다 크니까 차이가 없다
t.test(post~G) # p-value가 0.05보다 작으니까 차이가 있다

# 종속표본 t 검정
t.test(pre, post, paired=T, alternative="two.sided")  # 차이가 있다고 말할 수 있다 (Post 평균값이 크다)
Diff<-post-pre
Diff

t.test(Diff~G) # p-value = 0.4042 차이가 없다 (성별간의 차이는 없다)

# pair간의 차이도 나고 diff에 대한 차이도 나야 최종적으로 차이가 난다고 말할 수 있다



# 세표본 비교
xx <- c(40, 30,50, 60)
yy <- c(60, 40, 55, 65, 60, 50)
zz <- c(70, 65, 70, 50, 60)
mydata <-c(xx,yy,zz)  #벡터형으로 자료를 생성함
mydata
group <-c(rep(1,4), rep(2,6), rep(3,5))  
group
cbind(mydata, group)
boxplot(mydata~group)
library(psych)
describe.by(mydata, group)  # 그룹별 기술통계량 계산
ANO_R<-aov(mydata~group)
anova(ANO_R) # 3그룹 간에 유의한 차이가 있다
# 사후검정
# install.packages("agricolae")
library(agricolae)
scheffe.test(ANO_R, "group", alpha=0.05, console=TRUE) # "group" 주의
# 큰애가 a나오고, 작은애가 b나오고
# 같은 알파벳이 속해있으면 비슷한 그룹 -> 1과2 비슷, 2와3비슷, 1과3다름
LSD.test(ANO_R, "group", alpha=0.05, console=TRUE)
duncan.test(ANO_R, "group", alpha=0.05, console=TRUE)



### 비모수 검정

# t.test(t검정)=> Wilcox.test(윌콕슨검정)
# 표본의 크기가 작고 정규성 검정을 따르지 않은 경우 
# 분포가 대칭적이라고 가정하고 비모수 검정을 한다

x<-c(1.83, 0.50, 1.62, 2.48, 2.68, 1.88, 1.55, 3.06, 1.30)
y<-c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)  
shapiro.test(x)  #데이터가 정규분포를 하는지를 검사한다
shapiro.test(y)
wilcox.test(x,y, paired=TRUE, alternative="greater")
wilcox.test(x,y, paired=TRUE, alternative="two.sided")
wilcox.test(y-x, alternative="less")
wilcox.test(y-x, alternative="less", exact=FALSE, correct=FALSE)
# 부호화 순위검정 정규근사를 이용하는 경우, exact=FALSE, correct=FALSE를 사용
# 연속성 보장하는 경우는 correct=TRUE


# anova => kruskal.test(크루스칼 왈리스검정)

x<-c(2.9, 3.0, 2.5, 2.6, 9.2)
y<-c(3.8, 5.7, 4.0, 7.4)
z<-c(2.8, 3.4, 2.2, 2.0)
shapiro.test(x)
shapiro.test(y)
shapiro.test(z)
kruskal.test(list(x,y,z))  # list 주의


# 
performance <-matrix(c(794, 86, 150, 570), nrow=2, dimnames=list("1st Survey"=c("Approve", "Disapprove"), "2nd Survey"=c("Approve", "Disapprove")))
performance
mcnemar.test(performance)



# 설문조사 1문항은 교차분석이 맞지만, 일반적으로 ANOVA분석을 한다




install.packages("corrplot")
install.packages("lm.beta")
install.packages("mlbench")
install.packages("car")

library(corrplot)
library(lm.beta)
library(mlbench)
library(car)

options(scipen = 100)   # 숫자 e로 나오는거 없애는 option

# 상관관계분석
x <- c(170, 172, 162, 164, 171, 176, 160,165,174,172)
y <- c(70,74, 65, 68, 72, 74, 61, 66, 76, 75)
plot(x, y,  xlab="키", ylab="몸무게", pch=19, # pch : 검정색 점으로
     col="black", bg="yellow", cex=1.5 )      # cex : 점을 좀 크게하겠다
cor.test(x,y,method="pearson")  

# Pearson's product-moment correlation
# 
# data:  x and y
# t = 8.5685, df = 8, p-value = 2.656e-05    # p-value 값 : 의미있는 통계이다!
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:  
#  0.7957471 0.9883181
# sample estimates:
#       cor 
# 0.9496011 




data(mtcars)
mtcars
car_Cor<-cor(mtcars)   # 모든 변수들의 서로서로 간의 상관관계를 계산 
round(car_Cor, 2)
pairs(car_Cor, pch=19, bg=c("red", "green", "blue"))  # 행렬모양 산점도

install.packages("corrplot")
library(corrplot)
corrplot(car_Cor)  
# 상관원계수가 클수록 크기가 크고 색깔이 진하다
# 양수면 파란색, 음수면 붉은색
corrplot(car_Cor, method="number") # 수와 색깔로 표현
col<-colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(car_Cor, 
         method="color",      # 색깔로 표현
         col=col(200),        # 색상 200개 선정
         type="lower",        # 왼쪽 아래 행렬만 표기
         order="hclust",      # 유사한 상관계수끼리 군집화
         addCoef.col="black", # 상관계수 색깔
         tl.col="black",      # 변수명 색깔  
         tl.srt=45,           # 변수명 45도 기울임
         diag=F)              # 대각행렬 제외



# Regression

setwd("C:/R") # 실습 디렉토리 설정
R1 = read.csv("Regression_Data.csv")
names(R1)

# lm() : Fitting Linear Models
# lm(fomula = , data = )
RgFit <- lm(Y ~ X, data = R1) # 단순회귀식   # 다중일때 : Y ~ X1 + X2
summary(RgFit)
# Call:
#   lm(formula = Y ~ X, data = R1)
# 
# Residuals: # 잔차(회귀식에 의해 추정된 값과 실제값(입력값)의 차이)
#      Min       1Q   Median       3Q      Max 
# -10.6221  -3.2169   0.6305   2.5411   7.8515 
#
# Coefficients: # 계수(추정된 회귀식의 계수) -> 유의성 판단 : t검정
#           Estimate Std.     Error  t value   Pr(>|t|)    
#            추정된 계수   표준오차      t값    p-value
# (Intercept)   130.6746     5.4541    23.96   4.17e-15 ***
#       절편            -> 귀무가설 기각("회귀식의 절편이 유의하다")
#   X             0.6211     0.0891     6.97   1.65e-06 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 4.625 on 18 degrees of freedom
# 잔차의 표준오차
#
# Multiple R-squared:  0.7297,	Adjusted R-squared:  0.7146 
#         결정계수                수정된 결정계수
#         -> 1에 가까울수록 회귀계수의 설명력이 높음
#         -> 수정된 결정계수를 중심으로 회귀모형의 설명력을 측정
#             (독립변수가 하나이상일때 의미있는 값)
#
# F-statistic: 48.58 on 1 and 18 DF,  p-value: 1.645e-06
# 모형 전체의 유의성을 판단하기 위한 통계량 "유의하다"
# -> 이 F값에 대한 p-value가 유의해야 이 결과를 볼 가치가 있다!

coefficients(RgFit) # model coefficients  # 계수값만 표시해줌
# = coef(RgFit)
confint(RgFit, level=0.95) # 모델에서 적합된 회귀계수의95% 신뢰구간(CI) 표기 
fitted(RgFit)       # 예측된 값 표시
residuals(RgFit)    # 잔차
deviance(RgFit)     # 잔차 제곱의 합
anova(RgFit)        # anova table 
vcov(RgFit)         # covariance matrix for model parameters 
influence(RgFit)    # regression diagnostics 어떤 변수들이 가장 영향을 주었는지

# diagnostic plots 
# Error in plot.new() : figure margins too large error 
graphics.off()
par("mar")
par(mar=c(1,1,1,1))
#
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(RgFit)
plot(RgFit, which=c(4,6)) 
# residuals vs Fitted : 선형회귀는 오차평균 0, 분산일정가정하므로 기울기 0인 직성이 이상적 
# Sclae -location : 기울기가 0인 직선이 이상적
# nornal Q-Q : 잔차의 정규분포를 따르는지 검정  -> 이거를 중점으로 보고 선형에 가까우면 회귀부석을 해도되겠다!라고 판단함
# Residuals vs Leverage : 
# leverage (지렛점-설명변수가 얼마나 극단적으로 치우치는지 보여줌)
# 빨간 점 : Cook Distance 영향점 을 의미함

#회귀직선의 시각화
plot(Y~X, data=R1) # X축 Y축 표
abline(coef(RgFit)) # 덧붙여서 예측회귀선 표기


#다중회귀분석

RgFit2<-lm(Y ~ X1+X2, data=R1) 
summary(RgFit2) #회귀계수와 R-square, F값 표시
coefficients(RgFit2) # model coefficients
confint(RgFit2, level=0.95) # 모델에서 적합된 회귀계수의95% 신뢰구간(CI) 표기 
fitted(RgFit2) # 예측된 값 표시
residuals(RgFit2) # 잔차
deviance(RgFit2)
anova(RgFit2) # anova table 
vcov(RgFit2) # covariance matrix for model parameters 
influence(RgFit2) # regression diagnostics


# beta표기  (standard된 beta값을 보고싶다)
install.packages("lm.beta")
library(lm.beta)
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
# standardize
lm.D9.beta <- lm.beta(lm.D9)
print(lm.D9.beta)
summary(lm.D9.beta)

# Coefficients:
#        Estimate  Standardized Std. Error t value   Pr(>|t|)    
# (Intercept)  5.0320   0.0000  0.2202  22.850  0.00000000000000955 ***
#   groupTrt  -0.3710  -0.2703  0.3114  -1.191  0.249    

coef(lm.D9.beta)

RgFit2 <- lm(Y ~ X1 + X2, data = R1)
RgFit2.beta <- lm.beta(RgFit2)
print(RgFit2.beta)
summary(RgFit2.beta) #회귀계수와 R-square, F값 표시


# 자료변환 I()사용

x <- 1:1000
x
y <- x^2 + 3*x + 5 + rnorm(1000)
y
lm(y ~ I(x^2) + x)  # x변형해서 독립변수 넣을때 I()사용

x <- 101:200
y <- exp(3*x + rnorm(100))
lm(log(y) ~ x)


x <- 101:200
y <- log(x) + rnorm(100)
lm(y ~ log(x))


x1 <- 1:10000
x2 <- 3*x1
y  <- 3*(x1 + x2) + rnorm(1000)
lm(y ~ x1 + x2)

# 변수선택법

install.packages("mlbench")
library(mlbench)
data(BostonHousing)
m <- lm(medv ~ ., data = BostonHousing) 
# medv~. : 그외 나머지변수를 다 넣겠다
m2 <- step(m, directory="both")  # 단계적 선택법 (넣고 빼고 넣고 빼고)
formula(m2)  # 최종모형 선택
m3 <- step(m, directory="forward")  # 전체 다 넣고 영향없는거 빼고
formula(m3) # 최종모형 선택
m4 <- step(m, directory="backward") # 
formula(m4) # 최종모형 선택


# 다중공선성

R2 = read.csv("Regression_Data.csv")
names(R2)
RgFit2 <- lm(Y ~ X1 + X2, data = R2) # 다중회귀식
install.packages("car")
library(car)
vif(RgFit2)  # 10이상이면 다중공선성이 있다고 판단
sqrt(vif(RgFit2)) > 2 # problem?   # 4정도 되는건지 보는것 (4이상이면 위험하다고 판단 -> package마다 다르기 때문에 확인해봐야함)


# Assume that we are fitting a multiple linear regression
# on the MTCARS data
install.packages("car")
data(mtcars)
library(car)
fit <- lm(mpg ~ disp + hp + wt + drat, data = mtcars)

# Assessing Outliers
rstudent(fit)                 # 외면 스튜던터 잔차 표기 
outlierTest(fit)              # Bonferonni p-value for most extreme obs
qqPlot(fit, main = "QQ Plot") # qq plot for studentized resid
# 점선 밖으로 넘어가지 않으면 정규성을 따른다로 볼 수 있다
leveragePlots(fit)            # leverage plots

# Cook's D plot
# identify D values > 4/(n-k-1)
cutoff <- 4/( (nrow(mtcars) - length(fit$coefficients) - 2) ) 
plot(fit, which = 4, cook.levels = cutoff)

# Influence Plot 
influencePlot(fit,
              id.method = "identify", 
              main = "Influence Plot", 
              sub="Circle size is proportial to Cook's Distance")
