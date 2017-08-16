############################################################
### �������� : statistics in R
### �ۼ��� : yunju hwang
### �ۼ����� : 2017.07.27 (��)
############################################################


# Sampling(ǥ��������)
#   �ܼ� ������ ǥ�� ������� ���� �߿� �ݵ�� �ѹ��� ���ԵǾ���Ѵ�!

# 5�� ô�� �������� : ������ ������ �ڷ������� ���� �Լ��� �ְų� ����� ���� ������ �ڷ�� �����!

# �����ڷ�� ��data�� �״�� ���ΰ� ���ο� ����data�� �������Ѵ�!
#   ex) gender_Dm <- ���� = 1, ���� = 0
#       A_R (���� ���� reverse ���״�)


# �ֵ�(Skewness) : ���Ī��
# �ֵ� > 0 (�����ʲ�������) : �ֺ� < �߾Ӱ� < ���
# �ֵ� < 0 (���ʲ�������)   : ��� < �߾Ӱ� < �ֺ�


# ��ݻ�� : A,B�� ���ÿ� �Ͼ�� �ʴ´�
#         -> P(A or B)  = P(A) + P(B)
# ������� : A�� B�� �߻��� ������ ���� �ʴ´�
#         -> P(A and B) = P(A) * P(B)
#            P(A|B) = P(A), P(B|A) = P(B)


# < ������ ���� >

# �������� ���� : ���� �߻����� ���� �̷��� �Ͽ� ����
# ���������� ���� : �̹� �߻��� ����� �߻����ο� ���� -> ȸ�ͺм�

# P(A|B) = P(A and B) / P(B)
# P(B|A) = P(A and B) / P(A)
# P(A and B) = P(B) * P(A|B)
#            = P(A) * P(B|A)

# P(A|��) = P(�� and A) / P(��)
#         = P(�� and A) / P(�� and A) + P(�� and B)
#         = P(A)*P(��|A) / P(A)*P(��|A) + P(B)*P(��|B)

# P(A|B, C) = P(A|C , B) * P(A|B) / P(C|B)



# �̻�Ȯ������ : ���׺���, ���Ƽ� ����, ���׺���, �ʱ��Ϻ��� ...
#        (�� ������ �����϶��� ���׺��� / �� ������ �����϶��� �ʱ��Ϻ���)
# ����Ȯ������ : ���Ժ���, t����, ī����������, F���� ...


### �����, �л�, ǥ������ ���� ppt.19

x <- c(170,177,165,180,174,169,182,175,174,176,
       177,175,178,170,170,175,177,167,180,174,
       169,180,174,175,178,177,175,178,172,172)
# ǥ�����
xbar <- mean(x)

# ǥ������� ǥ������
SE <- sd(x) / sqrt( length(x) )

xbar # 174.5
SE   # 0.7531543




# qnorm(p, mean, sd)
# ���Ժ������� ������� ���ϴ� �Լ� (mean = 0, sd = 1�� ��������)
# ���⼭ p = 1-alpha/2 (������������ alpha/2�κ��� ��ü���� ������ �κ�)

z0 <- qnorm(p=c(0.975, 0.950, 0.90), mean = 0, sd = 1)
qnorm(0.95)
pnorm(1.65)


# ��ǥ������
sigma <- 4
alpha <- 0.05
# alpha = 0.025
# 1-alpha/2 = 0.975
LCL <- xbar - qnorm(1-alpha/2) * sigma / sqrt(length(x))
UCL <- xbar + qnorm(1-alpha/2) * sigma / sqrt(length(x))
LCL   # 173.0686
UCL   # 175.9314


### ����� ���� ppt.20
n <- 100
x <- 10

phat <- x/n  # ǥ�� ����
SE <- sqrt( phat*(1-phat)/n )  # ǥ�������� ǥ�ؿ���

phat # 0.1
SE   # 0.03



##########################
# < R�� Ȯ���Լ� >
# 
# d(pdf�̿�), p(cdf �̿�), q(quantile �̿�), r(�ش������ ��������)
#     pdf : Ȯ���е��Լ�
#     cdf : ����Ȯ�������Լ�
# 
# �̻��� ���� : binom(���׺���), multinom(���׺���), pois(���Ƽۺ���), geom(���Ϻ���), multinom(�ʱ��Ϻ���)
z0 <- qnorm(p = c(0.975, 0.950, 0.90), mean = 0, sd = 1)
round(z0, digit = 3)
p0 <- pnorm(q = c(-1.28, -1.64, -1.95), mean = 0, sd = 1, lower.tail = FALSE)
round(p0, digit = 4)
p1 <- pnorm(q = c(1.28, 1.64, 1.95), mean = 0, sd = 1, lower.tail = FALSE)
round(p1, digit = 4)




### plot(function(x) �Լ���, xlim = x�����, ylim = y�����)
plot(c(1,2),c(3,4),
     xlim = c(0,3),
     ylim = c(0,5))
plot(function(x) x^2,
     xlim = c(0,3),
     ylim = c(0,5))

# ǥ�����Ժ��� �׸� �׸���
op <- par(yaxs = "i")
plot( function(x) dnorm(x, mean = 0, sd = 1),
      xlim = c(-3, 3),
      ylim = c(0, 0.5),
      main = "Normal Distribution" )
par(op)  # �������·� ȸ���Ѵ�



### Chi-Squared Distribution
# dchisq(x, df, ncp = 0, log = FALSE)
# pchisq(q, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# qchisq(p, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
# rchisq(n, df, ncp = 0)

# �������� ���� ī������������ ��ȭ
x <- rchisq(n = 100, df = 5)
hist(x, probability = TRUE, ylim = c(0, 0.20), main = "Chi-Square Distribution (df=5)")
curve(dchisq(x, df = 5), col = "red", add = TRUE)  # ����׷��� ���� ��׷��� �׸���

x <- rchisq(n = 100, df = 10)
hist(x, prob = TRUE, ylim = c(0,0.20), main = "Chi-Square Distribution (df=10)")
curve(dchisq(x, df = 10), col = "red", add = TRUE)



### set.seed(����) : �� �Լ� ������ ������ random ����� set.seed(����)�� �����Ѵ�
set.seed(1)
sample(letters, 5)
set.seed(5)
sample(letters, 5)

### ���Ϻ��� Uniform Distribution
# ���Ϻ������� ���� �߻� �� barchart

set.seed(2010)  # �����߻��� �ʱⰪ ����
rtable <- round(runif(100, min = 0, max = 100))
breaks <- seq(from = 1, to = 100, by = 20)
output <- table(cut(rtable, breaks, right = FALSE))
# ������ �Ѳ����� ����,
output <- table( cut(round(runif(100, min = 0, max = 100)),
                     breaks = seq(from = 1, to = 100, by = 20),
                     right = FALSE) )
barplot(output, ylim = c(0,25), col = "mistyrose")



### 1���� 5������ ���ڿ��� ���������Ͽ� ũ�� 100�� ǥ�� ���� ���� �� ��� ���ϱ�
xmean <- numeric(0)   # numeric(10) : ũ�Ⱑ 10���� numeric vector�� �����ض�(�ʱⰪ=0)
# �׳� numeric(0)�� ���൵ ��!
for(i in 1:100){
  x <- sample(1:5, size = 100, replace = TRUE)
  xmean[i] <- mean(x)
}
xmean
hist(xmean, ylim = c(0,30), main = "Histogram")





### ���׺��� ���
# B(n, p)    # n : ����Ƚ��, p : ����Ȯ��
# dbinom(x, n, p) : ����Ȯ���е��Լ�
# pbinom(x, n, p) : ���״���Ȯ���Լ�

# ����Ȯ�� p�� �ٲپ��־�����
x <- seq(from = 0, to = 10)
win.graph()  # ���� �׷����� ��â�� �����
plot(x, dbinom(x, size = 10, p = 0.2), type = "h", ylab = "P(X=x)", lwd = 5)
# lwd : ���β�
# type = "h" : histogram-like vertical lines (����ǥ�� ����׷�����!)
win.graph()
plot(x, dbinom(x, size = 10, p = 0.5), type = "h", ylab = "P(X=x)", lwd = 5)
win.graph()
plot(x, dbinom(x, size = 10, p = 0.8), type = "h", ylab = "P(X=x)", lwd = 5)


# ����Ƚ�� n�� �ٲپ��־����� -> ���׺����� ���Ժ����ٻ�
n1 = 5; n2 = 10; n3 = 20; n4 = 30
x <- seq(0, 10)
plot(x, dbinom(x, n1, 0.2), type = "b", ylim = c(0, 0.5), xlab = "", ylab = "")
# type = "b" : �� ���̸� �̾ ������ �׷�����!
par(new = T)    # ������ ������ �׷����� ���ļ� �׸���
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
# ��� �ϸ� �׷����� ������ ��������
curve(dnorm(x, n*p, sqrt(n*p*(1-p))), col = "red", add = TRUE) # ����ϸ� �׷����� �



### �������� ����
xbar <- 66; n <- 25
z <- (xbar-60) / (15/sqrt(25))
z # 2
1 - pnorm(z) # p-value : 0.02275013

# t����
# t.test(x, y = NULL, alternative = c("two-sided", "less", "greater"), mu = 0)
x <- c(65, 70, 60, 55, 75, 65, 55, 60, 70, 60)

mean(x); sd(x)
t = (mean(x) - 60) / (sd(x)/sqrt(length(x)))
1-pt(t, 9)

t.test(x, alternative = "greater", mu = 60)  # ǥ���� ���� ���� ����� t���� ���

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

#����Ȯ�� ���
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
t <- abs((mean(x)-3.5)/(sd(x)/sqrt(n)))  # abs(x) : |x|, x�� ���밪
t   # 3.162278
2 * (1 - pt(t, df = n-1))  # ��������  # p-value = 0.01334906



xbar <- 19; n <- 36; s <- 3.4
z <- (xbar-20) / (s/sqrt(n)) 
z     #  -1.764706
pnorm(z) # 0.0388066




### ��������� �Լ�

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




### �����м�

# table( )�� ����� �־��� ���Ϳ��� a, b, c�� ���� Ƚ��
table(c("a", "b", "b", "b", "c", "c", "d"))  # ������ �󵵸� ǥ��

df <- data.frame(x = c("a","b","C","d"),
                 y = c("1","2","3","4"),
                 num = c(100,200,300,400))
xtabs(num ~ x + y, data = df)

d <- data.frame(x   = c("1", "1", "2", "2"),
                y   = c("A", "B", "A", "B"),
                num = c(190, 230,  60, 20))
mytable <- xtabs(num ~ x + y, data = d)
# xtabs( )�� formula�� ����� �����͸� ����
# ���Ӻ��� ~ ��������
# x, y�� ���� tableȭ ��Ų��  # (1��,A��):190��, (1��,B��):230��...
mytable

(d2 <- data.frame(x = c("A", "A", "A", "B", "B")))
(xtabs(~ x, d2)) # x�� ���ؼ� tableȭ ��Ų��


# �ֺ� �հ� �ֺ� ������ margin.table( ), prop.table( )�� ����Ѵ�.

margin.table(mytable, 1) # A frequencies (summed over B) "�ೢ���� ��"
margin.table(mytable, 2) # B frequencies (summed over A) "�������� ��"

prop.table(mytable)      # cell percentages # table ��ü�� 1�� �������� ����
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



### ī�������ˤ�
# ������ = (���� ���� - 1) * (���� ���� - 1)
chisq.test(mytable)
# Warning message:In chisq.test(mytable) : Chi-squared approximation may be incorrect
## 5���� �ȵǴ� ���� 50% �̻� �ֱ� ������!?! -> fisher.test�� ���ش�!
fisher.test(mytable)


# x <- matrix(c(24, 3,5,12), nc = 2) �϶� �����غ���
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


### ��ǥ�� t����
# 3-1���� �л����� ���� ��ռ����� 55���̾���. 
# 0���� ������ �����ϰ� ���� �л����� ���� ������ ������ ����.
# 58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39
# ���� ������ ������ ��, �л����� ������ �ö��ٰ� �� �� �ִ°�?

a <- c(58, 49, 39, 99, 32, 88, 62, 30, 55, 65, 44, 55, 57, 53, 88, 42, 39)

shapiro.test(a)  #�����Ͱ� ���Ժ����� �ϴ����� �˻��Ѵ�
# ���Ժ����� ������! p-value > 0.5�� ?!?

t.test(a, mu=55, alternative="greater")  # �ö��ٰ� ���� �� ����


### ����ǥ�� t����
pre<-c(13.2, 8.2, 10.9, 14.3, 10.7, 6.6, 9.5, 10.8, 8.8, 13.3)
post<-c(14.0, 8.8, 11.2, 14.2, 11.8, 6.4, 9.8, 11.3, 9.3, 13.6)
G<-c(1,2,2,1,1,2,2,2,1,1)
t.test(pre~G)  # p-value�� 0.05���� ũ�ϱ� ���̰� ����
t.test(post~G) # p-value�� 0.05���� �����ϱ� ���̰� �ִ�

# ����ǥ�� t ����
t.test(pre, post, paired=T, alternative="two.sided")  # ���̰� �ִٰ� ���� �� �ִ� (Post ��հ��� ũ��)
Diff<-post-pre
Diff

t.test(Diff~G) # p-value = 0.4042 ���̰� ���� (�������� ���̴� ����)

# pair���� ���̵� ���� diff�� ���� ���̵� ���� ���������� ���̰� ���ٰ� ���� �� �ִ�



# ��ǥ�� ��
xx <- c(40, 30,50, 60)
yy <- c(60, 40, 55, 65, 60, 50)
zz <- c(70, 65, 70, 50, 60)
mydata <-c(xx,yy,zz)  #���������� �ڷḦ ������
mydata
group <-c(rep(1,4), rep(2,6), rep(3,5))  
group
cbind(mydata, group)
boxplot(mydata~group)
library(psych)
describe.by(mydata, group)  # �׷캰 �����跮 ���
ANO_R<-aov(mydata~group)
anova(ANO_R) # 3�׷� ���� ������ ���̰� �ִ�
# ���İ���
# install.packages("agricolae")
library(agricolae)
scheffe.test(ANO_R, "group", alpha=0.05, console=TRUE) # "group" ����
# ū�ְ� a������, �����ְ� b������
# ���� ���ĺ��� ���������� ����� �׷� -> 1��2 ���, 2��3���, 1��3�ٸ�
LSD.test(ANO_R, "group", alpha=0.05, console=TRUE)
duncan.test(ANO_R, "group", alpha=0.05, console=TRUE)



### ���� ����

# t.test(t����)=> Wilcox.test(���۽�����)
# ǥ���� ũ�Ⱑ �۰� ���Լ� ������ ������ ���� ��� 
# ������ ��Ī���̶�� �����ϰ� ���� ������ �Ѵ�

x<-c(1.83, 0.50, 1.62, 2.48, 2.68, 1.88, 1.55, 3.06, 1.30)
y<-c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)  
shapiro.test(x)  #�����Ͱ� ���Ժ����� �ϴ����� �˻��Ѵ�
shapiro.test(y)
wilcox.test(x,y, paired=TRUE, alternative="greater")
wilcox.test(x,y, paired=TRUE, alternative="two.sided")
wilcox.test(y-x, alternative="less")
wilcox.test(y-x, alternative="less", exact=FALSE, correct=FALSE)
# ��ȣȭ �������� ���Աٻ縦 �̿��ϴ� ���, exact=FALSE, correct=FALSE�� ���
# ���Ӽ� �����ϴ� ���� correct=TRUE


# anova => kruskal.test(ũ�罺Į �и�������)

x<-c(2.9, 3.0, 2.5, 2.6, 9.2)
y<-c(3.8, 5.7, 4.0, 7.4)
z<-c(2.8, 3.4, 2.2, 2.0)
shapiro.test(x)
shapiro.test(y)
shapiro.test(z)
kruskal.test(list(x,y,z))  # list ����


# 
performance <-matrix(c(794, 86, 150, 570), nrow=2, dimnames=list("1st Survey"=c("Approve", "Disapprove"), "2nd Survey"=c("Approve", "Disapprove")))
performance
mcnemar.test(performance)



# �������� 1������ �����м��� ������, �Ϲ������� ANOVA�м��� �Ѵ�




install.packages("corrplot")
install.packages("lm.beta")
install.packages("mlbench")
install.packages("car")

library(corrplot)
library(lm.beta)
library(mlbench)
library(car)

options(scipen = 100)   # ���� e�� �����°� ���ִ� option

# �������м�
x <- c(170, 172, 162, 164, 171, 176, 160,165,174,172)
y <- c(70,74, 65, 68, 72, 74, 61, 66, 76, 75)
plot(x, y,  xlab="Ű", ylab="������", pch=19, # pch : ������ ������
     col="black", bg="yellow", cex=1.5 )      # cex : ���� �� ũ���ϰڴ�
cor.test(x,y,method="pearson")  

# Pearson's product-moment correlation
# 
# data:  x and y
# t = 8.5685, df = 8, p-value = 2.656e-05    # p-value �� : �ǹ��ִ� ����̴�!
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:  
#  0.7957471 0.9883181
# sample estimates:
#       cor 
# 0.9496011 




data(mtcars)
mtcars
car_Cor<-cor(mtcars)   # ��� �������� ���μ��� ���� ������踦 ��� 
round(car_Cor, 2)
pairs(car_Cor, pch=19, bg=c("red", "green", "blue"))  # ��ĸ�� ������

install.packages("corrplot")
library(corrplot)
corrplot(car_Cor)  
# ���������� Ŭ���� ũ�Ⱑ ũ�� ������ ���ϴ�
# ����� �Ķ���, ������ ������
corrplot(car_Cor, method="number") # ���� ����� ǥ��
col<-colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(car_Cor, 
         method="color",      # ����� ǥ��
         col=col(200),        # ���� 200�� ����
         type="lower",        # ���� �Ʒ� ��ĸ� ǥ��
         order="hclust",      # ������ ���������� ����ȭ
         addCoef.col="black", # ������ ����
         tl.col="black",      # ������ ����  
         tl.srt=45,           # ������ 45�� �����
         diag=F)              # �밢��� ����



# Regression

setwd("C:/R") # �ǽ� ���丮 ����
R1 = read.csv("Regression_Data.csv")
names(R1)

# lm() : Fitting Linear Models
# lm(fomula = , data = )
RgFit <- lm(Y ~ X, data = R1) # �ܼ�ȸ�ͽ�   # �����϶� : Y ~ X1 + X2
summary(RgFit)
# Call:
#   lm(formula = Y ~ X, data = R1)
# 
# Residuals: # ����(ȸ�ͽĿ� ���� ������ ���� ������(�Է°�)�� ����)
#      Min       1Q   Median       3Q      Max 
# -10.6221  -3.2169   0.6305   2.5411   7.8515 
#
# Coefficients: # ���(������ ȸ�ͽ��� ���) -> ���Ǽ� �Ǵ� : t����
#           Estimate Std.     Error  t value   Pr(>|t|)    
#            ������ ���   ǥ�ؿ���      t��    p-value
# (Intercept)   130.6746     5.4541    23.96   4.17e-15 ***
#       ����            -> �͹����� �Ⱒ("ȸ�ͽ��� ������ �����ϴ�")
#   X             0.6211     0.0891     6.97   1.65e-06 ***
#   ---
#   Signif. codes:  0 ��***�� 0.001 ��**�� 0.01 ��*�� 0.05 ��.�� 0.1 �� �� 1
# 
# Residual standard error: 4.625 on 18 degrees of freedom
# ������ ǥ�ؿ���
#
# Multiple R-squared:  0.7297,	Adjusted R-squared:  0.7146 
#         �������                ������ �������
#         -> 1�� �������� ȸ�Ͱ���� �������� ����
#         -> ������ ��������� �߽����� ȸ�͸����� �������� ����
#             (���������� �ϳ��̻��϶� �ǹ��ִ� ��)
#
# F-statistic: 48.58 on 1 and 18 DF,  p-value: 1.645e-06
# ���� ��ü�� ���Ǽ��� �Ǵ��ϱ� ���� ��跮 "�����ϴ�"
# -> �� F���� ���� p-value�� �����ؾ� �� ����� �� ��ġ�� �ִ�!

coefficients(RgFit) # model coefficients  # ������� ǥ������
# = coef(RgFit)
confint(RgFit, level=0.95) # �𵨿��� ���յ� ȸ�Ͱ����95% �ŷڱ���(CI) ǥ�� 
fitted(RgFit)       # ������ �� ǥ��
residuals(RgFit)    # ����
deviance(RgFit)     # ���� ������ ��
anova(RgFit)        # anova table 
vcov(RgFit)         # covariance matrix for model parameters 
influence(RgFit)    # regression diagnostics � �������� ���� ������ �־�����

# diagnostic plots 
# Error in plot.new() : figure margins too large error 
graphics.off()
par("mar")
par(mar=c(1,1,1,1))
#
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(RgFit)
plot(RgFit, which=c(4,6)) 
# residuals vs Fitted : ����ȸ�ʹ� ������� 0, �л����������ϹǷ� ���� 0�� ������ �̻��� 
# Sclae -location : ���Ⱑ 0�� ������ �̻���
# nornal Q-Q : ������ ���Ժ����� �������� ����  -> �̰Ÿ� �������� ���� ������ ������ ȸ�ͺμ��� �ص��ǰڴ�!��� �Ǵ���
# Residuals vs Leverage : 
# leverage (������-���������� �󸶳� �ش������� ġ��ġ���� ������)
# ���� �� : Cook Distance ������ �� �ǹ���

#ȸ�������� �ð�ȭ
plot(Y~X, data=R1) # X�� Y�� ǥ
abline(coef(RgFit)) # ���ٿ��� ����ȸ�ͼ� ǥ��


#����ȸ�ͺм�

RgFit2<-lm(Y ~ X1+X2, data=R1) 
summary(RgFit2) #ȸ�Ͱ���� R-square, F�� ǥ��
coefficients(RgFit2) # model coefficients
confint(RgFit2, level=0.95) # �𵨿��� ���յ� ȸ�Ͱ����95% �ŷڱ���(CI) ǥ�� 
fitted(RgFit2) # ������ �� ǥ��
residuals(RgFit2) # ����
deviance(RgFit2)
anova(RgFit2) # anova table 
vcov(RgFit2) # covariance matrix for model parameters 
influence(RgFit2) # regression diagnostics


# betaǥ��  (standard�� beta���� �����ʹ�)
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
summary(RgFit2.beta) #ȸ�Ͱ���� R-square, F�� ǥ��


# �ڷắȯ I()���

x <- 1:1000
x
y <- x^2 + 3*x + 5 + rnorm(1000)
y
lm(y ~ I(x^2) + x)  # x�����ؼ� �������� ������ I()���

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

# �������ù�

install.packages("mlbench")
library(mlbench)
data(BostonHousing)
m <- lm(medv ~ ., data = BostonHousing) 
# medv~. : �׿� ������������ �� �ְڴ�
m2 <- step(m, directory="both")  # �ܰ��� ���ù� (�ְ� ���� �ְ� ����)
formula(m2)  # �������� ����
m3 <- step(m, directory="forward")  # ��ü �� �ְ� ������°� ����
formula(m3) # �������� ����
m4 <- step(m, directory="backward") # 
formula(m4) # �������� ����


# ���߰�����

R2 = read.csv("Regression_Data.csv")
names(R2)
RgFit2 <- lm(Y ~ X1 + X2, data = R2) # ����ȸ�ͽ�
install.packages("car")
library(car)
vif(RgFit2)  # 10�̻��̸� ���߰������� �ִٰ� �Ǵ�
sqrt(vif(RgFit2)) > 2 # problem?   # 4���� �Ǵ°��� ���°� (4�̻��̸� �����ϴٰ� �Ǵ� -> package���� �ٸ��� ������ Ȯ���غ�����)


# Assume that we are fitting a multiple linear regression
# on the MTCARS data
install.packages("car")
data(mtcars)
library(car)
fit <- lm(mpg ~ disp + hp + wt + drat, data = mtcars)

# Assessing Outliers
rstudent(fit)                 # �ܸ� ��Ʃ���� ���� ǥ�� 
outlierTest(fit)              # Bonferonni p-value for most extreme obs
qqPlot(fit, main = "QQ Plot") # qq plot for studentized resid
# ���� ������ �Ѿ�� ������ ���Լ��� �����ٷ� �� �� �ִ�
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