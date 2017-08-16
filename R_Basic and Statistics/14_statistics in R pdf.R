############################################################
### 수업내용 : 통계학의 이해_최용석.pdf
### 작성자 : yunju hwang
### 작성일자 : 2017.07.24 (월)
############################################################

### <2.6>

### barplot, pie
blood = c("B","A","B","A","A","B","O","A","A","A","O","B","AB","B","AB",
          "AB","A","A","O","AB","O","A","B","O","B","B","A","A","O","A",
          "A","AB","B","B","O","B","B","B","A","AB","A","A","B","O","B",
          "B","O","B","O","B","A","A","AB","A","A")
length(blood)    # 55
blood_freq = sort( table(blood), decreasing = TRUE)  # 20 7 18 10
blood_prop = prop.table( table(blood) )  # proportion 비율
cbind(blood_freq, blood_prop)
barplot(blood_freq)
pie(blood_freq, init.angle = 90)

### hist
height = c(170,178,171,168,173,178,171,174,170,170,175,
           170,169,166,162,170,171,175,175,171,171,170,
           172,179,164,170,181,178,180,177,166,169,168,
           165,163,175,166,178,165,168,167,177,168,177,
           174,174,176,179,169,173,167,170,173,170,162)
hei_range = range(height)  # data 범위  # 162 ~ 181
hei_classcnt = 1 + 3.3 * log10( length(height) ) # 계급의 수
diff( range_hei ) / classcnt_hei  # 계급의 크기
hei_group = cut(height,
                seq(from = 161.5, to = 181.5, by = 5),
                right = FALSE)
hist(height,
     xlim = c(161.5, 181.5))
hist(height,
     col = "#EAEAEA",
     breaks = seq(from = 162, to = 183, by = 3),
     xlim = c(162, 183))

### boxplot
noise = c(55.9,63.8,57.2,59.8,65.7,62.7,60.8,51.3,61.8,56.0,
          66.9,56.8,66.2,64.6,59.5,63.1,60.6,62.0,59.4,67.2,
          63.6,60.5,66.8,61.8,64.8,55.8,55.7,77.1,62.1,61.0,
          58.9,60.0,66.9,61.7,60.3,51.5,67.0,60.2,56.2,59.4,
          67.9,64.9,55.7,61.4,62.6,56.4,56.4,69.4,57.6,63.8)
mean(noise)
median(noise)
max(noise)
min(noise)
quantile(noise, type = 7)
?quantile
boxplot(noise,
        horizontal = TRUE)


### < 3.6 >

### 이항분포 Binomial Distribution = B(n,p) ~ N(np, npq)

# dbinom(x, size = , prob = ) : P(X = x)  
# pbinom(x, size = , prob = , lower.tail = TRUE) : P(X <= x)
#         size : 시행횟수(n), prob : 성공확률(p)
#         lower.tail = TRUE가 default
?dbinom 
?pbinom

dbinom(6, size = 20, prob = 0.3) # P(X=6)

pbinom(2, size = 20, prob = 0.3) # P(X<=2)
pbinom(2, size = 20, prob = 0.3, lower.tail = FALSE) # P(X>2)


### < 4.5 >

### 정규분포

# pnorm(x, mean = 0, sd = 1) : 정규분포표에서 z값에 대한 확률 P(Z <= x)를 구해줌

mu = 3000
sigma = 80
x1 = 2948
x2 = 3080
pnorm(x2, mean = mu, sd = sigma) - pnorm(x1, mean = mu, sd = sigma)

z1 = (x1 - mu) / sigma
z2 = (x2 - mu) / sigma
pnorm(z2) - pnorm(z1) # 위의 결과와 같다

# qnorm(p) : 확률이 p가 되는 z값을 구해주
qnorm(0.05)  # -1.65
qnorm(0.025) # -1.96

# pnorm과 qnorm은 역함수 관계!
pnorm(-1.65) # 0.05
pnorm(-1.96) # 0.025


### < 5.3 >

mu = 87.6
sigma = 3.3
n = 6
x1 = 86.6 ; x2 = 89.4
pnorm(x2, mu, sigma/sqrt(n)) - pnorm(x1, mu, sigma/sqrt(n))

z1 = (x1 - mu) / (sigma/sqrt(n))
z2 = (x2 - mu) / (sigma/sqrt(n))
pnorm(z2) - pnorm(z1)   # 0.9082 - 0.2296


### < 6.5 >

### t분포

x = c(175,190,215,198,184,207,210,193,196,180)
mean(x) # 194.8
sd(x) # 13.13858
alpha = 0.05
qt(1-alpha/2, df = 9) # t0.025 = 2.262
mean(x) - sd(x)
t.test(x, conf.level = 0.95)

###
n = 100
phat = 0.06
mu = n*phat
sigma = n*phat*(1-phat)
alpha = 0.05
error = qnorm(1-alpha/2) * sqrt(phat * (1-phat) / n)

CL = c(phat - error, phat + error)
names(CL) <- c("Lower", "Upper")
CL

### 보기 7.4

H0 : mu = 200
H1 : mu < 200

alpha = 0.01
x = c(175, 190, 215, 198, 184, 207, 210, 193, 196, 180)
n = length(x)
xbar = mean(x)
s = sd(x)
t_a = qt( alpha, (n-1) )
t = (xbar - mu) / (s/sqrt(n))
if(t_a<t){
  "H0를 기각하지 못한다"
}else{
  "H0를 기각한다"
}
  # H0를 기각하지 못한다

### 보기 7.5

H0: p  = 0.2
H1: p != 0.2
n = 400
phat = 70/n
alpha = 0.05

### < 7.7 >

H0: mu = 1.9
H1: mu > 1.9

x=c(2.6, 1.9, 1.8, 1.6, 1.4, 2.2, 1.2, 1.6,
    1.6, 1.5, 1.4, 1.6, 2.3, 1.5, 1.1, 1.6,
    2.0, 1.5, 1.7, 1.5, 1.6, 2.1, 2.8, 1.0,
    1.2, 1.2, 1.8, 1.7, 0.8, 1.5, 2.0, 2.2,
    1.5, 1.6, 2.2, 2.1, 3.1, 1.7, 1.7, 1.2)

z = (mean(x) - mu) / (sd(x) / sqrt(length(x)) )
pvalue = 1 - pnorm(z)
pnorm(z)

###
x=c(175, 190, 215, 198, 184, 207, 210, 193, 196, 180)
t.test(x, mu = 200, alternative = "less")
prop.test()
prop.test(70, 400, p=0.2, alternative="two.sided", correct=FALSE) # 비율검정
prop.test(70, 400, p=0.2, alternative="two.sided", correct=TRUE)  # 카이제곱검정


qnorm(0.05)
(225200 - 218700) / sqrt((49*9800^2 + 29*10800^2) / 78) * sqrt(1/50 + 1/30)
(225200 - 218700) / sqrt( 9800^2/50 + 10800^2/30 )

#####################################################
x = c(1,2,3,4,5,6,7,8,9,10,
      11,12,13,14,15,16,17,18,19,20,
      21,22,23,24,25,26,27,28,29,30,
      31,32,33,34,35,36,37,38,39)
mean(x) # 20
var(x)
sd(x)
for(i in 1: length(x)){
  hap = 0
  hap = hap + (x[i] - mean(x))^2
  cat(hap)
}
y = c(1,2,3,4,5)
var(y)  # 2.5
10/4
sqrt(0.0149)

###
1- 88/252
34/113-54/139
(-0.0876) / sqrt(0.349*(1-0.349)) * sqrt(1/113 + 1/139)
0.0876/0.0604

z = c(1,1,1,2,2,2,3,3,3,4,4,4,5,5,5,
      6,6,6,7,7,7,8,8,8,9,9,9)
var(z)
mean(z)
#####################################################

### < 8.6 >

###
x=c(44, 44, 56, 46, 47, 38, 58, 53, 49, 35, 46, 30, 41)
y=c(35, 47, 55, 29, 40, 39, 32, 41, 42, 57, 51, 39)
mean(x); sd(x); length(x)
mean(y); sd(y); length(y)
t = (mean(x) - mean(y)) / sqrt(sd(x)^2/length(x) + sd(y)^2/length(y))# 0.864
1-pt(t, 23) # p-value = 0.198
qt(0.05, 23)

length(x)+length(y)-2  # 23
t_0.05 <- qt(0.95, 23) # 1.714
qt(t_0.05)
t.test(x, y, var.equal = TRUE, alt = "greater")

### Paired t-test

# 한 집단의 개체를 대상으로 처리 전과 처리 후의 특성치를 관측하여 차이를 알아보는 분석
x=c(14.0, 8.8, 11.2, 14.2, 11.8, 6.4, 9.8, 11.3, 9.3, 13.6)
y=c(13.2, 8.2, 10.9, 14.3, 10.7, 6.6, 9.5, 10.8, 8.8, 13.3)

t.test(x, y, paired = TRUE)



### 분산분석 (analysis of variance : ANOVA)

#
wt = c(55, 49, 42, 21, 52, 61, 112, 30, 89, 63, 169, 137, 169, 85, 154, 42, 97, 81, 95, 92)
feed = c(rep("A",5), rep("B",5), rep("C",5), rep("D",5))
chicken = data.frame(wt, feed)
chicken
results = aov(wt ~ feed, data = chicken)
anova(results)

#
time = c(21.4, 20.1, 21.1, 19.6, 21.8, 19.0, 17.8, 19.3, 19.1, 18.8,
         18.3, 19.0, 18.9, 20.3, 19.1, 19.6, 20.0, 20.1, 19.9, 18.4, 
         18.0, 17.9, 20.2, 19.5)
lecture = c(rep("A",6), rep("B",6), rep("C",6), rep("D",6))
swim = data.frame(time, lecture)
summary(swim)
results = aov(time ~ lecture, data = swim)
anova(results)


### 회귀분석

#
IQ   = c(110, 130, 125, 120, 115, 120, 125, 130, 150, 140, 
         100, 110, 115, 120, 135)
Math = c(75, 90, 80, 80, 70, 75, 90, 95, 90, 85, 60, 65, 75, 75, 90)
plot(IQ, Math, pch=16)
cor(IQ, Math)

#
IQ   = c(110, 130, 125, 120, 115, 120, 125, 130, 150, 140,
         100, 110, 115, 120, 135)
Math = c(75, 90, 80, 80, 70, 75, 90, 95, 90, 85, 60, 65, 75, 75, 90)
x = IQ
y = Math
lsm = lm(y ~ x)
summary(lsm)
plot(IQ, Math, col = "blue", pch = 16, main="Scatter Diagram and Fitted
     Regression Line ")
abline(coef(lsm), col="red")

# Call:
#   lm(formula = y ~ x)
# 
# Residuals:
#    Min     1Q  Median     3Q     Max 
# -7.824 -4.243  -1.012  3.213  10.626 
# 
# Coefficients:
#              Estimate Std.  Error  t value  Pr(>|t|)    
# (Intercept)  -3.0495      14.9894   -0.203     0.842    
# x             0.6725       0.1213    5.546  9.45e-05 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 5.803 on 13 degrees of freedom
# Multiple R-squared:  0.7029,	Adjusted R-squared:  0.6801 
# F-statistic: 30.76 on 1 and 13 DF,  p-value: 9.447e-05

# IQ와 수학성적의 적합된 회귀식을 위한 베타0와 베타1의 최소제곱추정량을 위한 lm( ) 함수와 적합된 회귀선을 원래 산점도에 같이 나타내기 위해 abline( ) 함수를 이용하는 R-프로그램
# 특히, 모형의 적합성을 위한 귀모가설 H0: 베타1 = 0를 검정하기 위한 검정통계량이 F-statistic : 30.76 on 1 and 14 DF, p-value : 9.447e-05 에 주어져 있다. p-value가 유의수준 5%보다 매우 작아 귀무가설을 기각하기에 충분하며 IQ와 수학성적간의 단순회귀모형이 적합함을 보여준다.


#
x = c(3, 3, 4, 5, 6, 6, 7, 8, 8, 9)
y = c(9, 5, 12, 9, 14, 16, 22, 18, 24, 22)
plot(x, y, col = "blue", pch = 16)
lsm = lm(y ~ x)
summary(lsm)
plot(x, y, col = "red", pch = 16, main = "Scatter Diagram and Fitted Regression Line")
abline(coef(lsm), col = "blue")

anova(lsm)


### 카이제곱 검정

# 분할표(contingency table) : 관찰된 자료가 범주형 변수에 따라 표로 정리되어 있을때

# 일반적으로 r X c 분할표로부터 계산된 통계량 X^2은 귀무가설이 옳다는 가정 하에 각 칸 기대도수가 대략 5 이상이고 총합계가 큰 경우에 근사적으로 X^2 분포를 따르고 자유도(df) = (r-1) X (c-1) = (행범주의 수 - 1) X (열범주의 수 - 1)이 된다.

# 독립성 검
row1 = c(38,79)
row2 = c(87,118)
row3 = c(78,89)
data.table = rbind(row1, row2, row3)
chisq.test(data.table)






