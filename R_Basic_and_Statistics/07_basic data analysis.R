############################################################
### �������� : ���� ������ �м�
### �ۼ��� : yunju hwang
### �ۼ����� : 2017.07.20 (��)
############################################################

###    �۾����� ����
setwd("C:/R")

### ���� ������ : hflights::hflights

options(repos = "https://cran.rstudio.com")

install.packages("hflights")
install.packages("DT")
install.packages("prettyR")
install.packages("psych")

library(hflights)
library(DT)
library(prettyR)
library(psych)

### ������ �Ϻ� ����
DT::datatable(head(hflights))

### �ڷ��� ���� : ������� ����

###   1. ���� �ڷ� : ����(����), ���� (�ǹ� X)  (ex. A��=1,B��=2,AB��=3...)

###     ����&����(Definition) : ���ڰ� �ǹ̰� �ִ°�?
###                             +, - ������ �Ǵ°�?

###   2. ���� �ڷ� : ���� (�ǹ� O)


############################################################
### ��.  �Ϻ��� (Uni-variate) ���� �ڷ��� �м� 
############################################################

### 1. ǥ = ��ǥ : ��(frequency), �����(percent)
### (1) �� : table(�����͸�$������)     # 0 ~ 1 �� 
table(hflights$Month)  # ���� ��Ȳ        # vector (names ����)
freq = sort( table(hflights$Month) , decreasing = TRUE )
                       # ������������ �����ִ°� �ʿ��ϴ�!

### (2) ����� = (�� / �հ�) * 100      # 0 ~ 100 ��
### prop.table(�󵵰��) * 100
prop.table( table(hflights$Month) ) * 100   # vector (names ����)
sort( prop.table(table(hflights$Month)) * 100 , decreasing = TRUE)

# �ݿø��ϱ� round( x , digits = i)       # �Ҽ� i��° �ڸ����� �����ش�
percent = round(sort( prop.table(table(hflights$Month)) * 100 ,
                      decreasing = TRUE),
                digits = 1)     # �Ҽ��� ù°�ڸ����� (��°�ڸ����� �ݿø�)

### (3) �� + ����� : cbind

month.table = cbind(freq, persent)
DT::datatable(month.table)


### CSV�� �����ϱ�!!
### write.csv(������.R , file = "������ġ/���ϸ�.csv")

write.csv(month.table , file = "month.csv")

### ����
View(hflights)
table(hflights$Dest)
freqDest = sort(table(hflights$Dest) , decreasing = TRUE)

persentDest = sort(prop.table( table(hflights$Dest) ) * 100 ,
                   decreasing = TRUE)
persentDest = round(persentDest, digits = 1)

dest.table = cbind(freqDest, persentDest)
DT::datatable(dest.table)
write.csv(dest.table , file = "dest.csv")

### 2. �׷��� : ����׷���(����, ����), ���׷���      >> �׸�5�� �̻��϶� 
###       �׷����� ��ġ�� �����ֱ� ���� ��! �׷����� �� ���� ��� �ȵ�!

### (1) ����׷��� : barplot(�󵵰��)

barplot( sort(table(hflights$Month) , decreasing = TRUE) )

### < �߿��� argument >
###   ���� ���� : col = "color"

barplot( sort(table(hflights$Month) , decreasing = TRUE) ,
         col = "#EAEAEA" )

barplot( sort(table(hflights$Month) , decreasing = TRUE) ,  # �̷��� ������
         col = c("skyblue","#EAEAEA"))

barplot( sort(table(hflights$Month) , decreasing = TRUE) ,  # �̷��� ������
         col = rainbow(12))

###   ���� : main = "����"
barplot( sort(table(hflights$Month) , decreasing = TRUE) ,
         col = "skyblue" ,
         main = "���� ������Ȳ")

###   y�� ���� : ylab = "�� ����"
barplot( sort(table(hflights$Month) , decreasing = TRUE) ,
         col = "skyblue" ,
         main = "���� ���� ��Ȳ",
         ylab = "����Ƚ��")

###   y�� ���� : ylim = c(�ּҰ�, �ִ밪)  # y limit
barplot( sort(table(hflights$Month) , decreasing = TRUE) ,
         col = "lemonchiffon" ,
         main = "���� ���� ��Ȳ" ,
         ylab = "����Ƚ��" ,
         ylim = c(0, 25000))
              # ����Ǿ�ϼ��ִ�! ������! (�׻� �ּڰ��� 0���� �ϱ�)

###   ���� ���� : horiz = TRUE             # horizontal
barplot( sort(table(hflights$Month) , decreasing = FALSE) , # FALSE
         col = "skyblue" ,
         main = "���� ���� ��Ȳ" ,
         xlab = "����Ƚ��" ,   # xlab
         xlim = c(0, 25000) ,  # xlim
         horiz = TRUE)


### (2) ���׷��� : barplot(�󵵰��) : pie(��)      >> �׸�5�� �����϶� 

pie( sort(table(hflights$Dest) , decreasing = TRUE)[1:20] ) # [�Ϻ�����]

###    ������ : radius = 0.8
pie( sort(table(hflights$Dest) , decreasing = TRUE)[1:20] ,
     radius = 1.0)

###    ù° ������ ���� : init.angle =      # 90�� �����ϴ�
pie( sort(table(hflights$Dest), decreasing = TRUE)[1:20],
     radius = 1.0,
     init.angle = 90)

###    �׷��� �з��׷�? ���� : length(table(hflights$Dest))
pie( sort(table(hflights$Dest), decreasing = TRUE)[1:20],
     col = rainbow(20),
     main = "Dest",
     radius = 1.0,
     init.angle = 90)

###     �� �κи� �����ϱ�
pie( sort(table(hflights$Dest), decreasing = TRUE)[1:20],
     col = c( "orange", rep("#EAEAEA",times=19) ),
     main = "Dest",
     radius = 1.0,
     init.angle = 90)

### �׷��� ���� Package
ggplot2
lattice
plotly   # �� ������ ���¿��� �����ִ� �� 
googleVis
ggmap

### �Ϻ��� prettyR Package�� freq �Լ�!
  # �ڵ����� ��, ����� cbind / default = �������� ����
prettyR::freq(hflights$Month)
  # < ��� >
  # %    : �����     (NA ����)
  # %!NA : ��ȿ����� (NA ����, ���������� ������ ���)

prettyR::freq(hflights$Month,
              display.na = FALSE,  # ��ȿ����� ����
              decr.order = FALSE)  # �������� ���� (�������� ��������)
?freq






############################################################
### ��.  �Ϻ��� (Uni-variate) ���� �ڷ��� �м� 
############################################################

### (1) ǥ = ��ǥ(������ ��, �����)
### (2) �׷��� : ������׷�, ���ڱ׸�
### (3) �����跮, �����跮

## < ������ ������ ���ϴ� ��� >

##    1) Sturge's Formular 
##       ������ ���� = 1 + 3.3 * log(n)    (n:�������� ����)
##    2) ������ ���� = sqrt(n)


## < ��������ǥ �׸��� ��� > 

##    1) ���� = �ִ밪 - �ּҰ�
##    2) ���� / ������ ���� = ������ ��, ����� ��
##    3) ù��° ������ �ּҰ��� ���Եǵ���
##    ������ ������ �ִ밪�� ���Եǵ��� ����


### 1. ǥ : ������ ��, �����
DT::datatable(head(hflights))

range()   # �ּҰ�, �ִ밪�� �˷��ִ� �Լ�

ArrDelay.range = range(hflights$ArrDelay, na.rm = TRUE)  # missing value ����

### ������ ����
interal.count = 1 + 3.3 * log10(length(hflights$ArrDelay))  # 18.67801
sqrt( length(hflights$ArrDelay) )           # 476.9654 (�Ⱒ)

### ������ �� = ����� ��
diff(ArrDelay.range) / interal.count        # 56.10875  -> 60

### ���� �����       # [-120, -60) / [-60, 0) / ... / [960, 1020)
##         -> ���� �ڷᰡ �Ǿ���!
hflights$ArrDelay.group = cut( hflights$ArrDelay,
                               seq(from = -120, to = 1020, by = 60),
                               right = FALSE)

sort( table(hflights$ArrDelay.group) , decreasing = TRUE )
prop.table( table(hflights$ArrDelay.group) ) * 100
  
tableArrDelay = prettyR::freq(hflights$ArrDelay.group)

# DT�� table�� ��ı����϶��� ���´�!


### 2. �׷���

### (1) ������׷�(Histogram)

###  i) hist(�����͸�$������)  : Sturge's Formular ���ä��! (���� �ڵ����)
###       hist()���� � �˰������� ������.. �����غ���

hist(hflights$ArrDelay)     # �˾Ƽ� ������ ������

###  ii) hist(�����͸�$������, breaks = ������ ����)  : ������ ������ ���� �� ����

hist(hflights$ArrDelay, breaks = 50)

###  iii) hist(�����͸�$������, breaks = ������ ����)  : ���� ������� ���� �� ����

hist(hflights$ArrDelay,
     col = "skyblue",
     breaks = seq(from = -120, to = 1020, by = 60),
     xlim = c(-120, 1020))

mean(hflights$ArrDelay, na.rm = TRUE)
median(hflights$ArrDelay, na.rm = TRUE)

# � ������ �װ��� �����ð��� ������ ����������?
# ��κ��� ������ � �װ���, ��� ��������. ������ ����

# ��� �̷п� ������ �ʾƾ��Ѵ�! (ex. ����ȭ������ �� ��ġ�� �ʾƵ� �����͸� �� ������ �� ������ ����Ѵ�)
# ����ġ

# �����Ϳ� �̻�ġ�� �ִ°�?
#     �̻�ġ(outlier) : �ٸ� ���ġ�� �������� ��ġ
#         -> �Է¿����ϱ�?
#         -> �̻�ġ�� �´ٸ�, ���� delete(����), transformation(��ȯ) ����?
#                   -> transformation ��� : log(), sqrt(), 1/x



### (2) ���ڱ׸�(Boxplot) : �̻�ġ ����   # ���׶�̴� �̻�ġ!

###   i) boxplot(�����͸�$������)

boxplot(hflights$ArrDelay)

money = c(40,50,50,50,40,50,40,70,30,40,50,60,250)
money2 = c(40,50,50,50,40,50,40,30,30,40,50,60,25)
boxplot(money)
boxplot(money2)



lotto = c(3,7,11,18,24,30,90)
boxplot(lotto)

 #  c(3,7,11,18,24,30,45)

#  1) ������ = �߾Ӱ� (Median)  : �������� ������ ������ ������ ��      # 18
#       -> data�� ������ ¦���϶� : �߰��� 2�� ���� ���
#
#  2) ������� (Quartile)  :
#       -> Medium : ������
#       -> Q1 : ������ ���� �պκп��� �߰�     # 7
#       -> Q3 : ������ ���� �ںκп��� �߰�     # 30
#
#  3) Q3 - Q1 : IQR (Inter Quartile Range)      # 30 - 7 = 23
#
#  4) 1.5 * IQR                                 # 1.5 * 23 = 34.5
#
#      �� �ȱ��̴� ����� 1.5�� "�ٸ��� ������ �� �ִ� ���� ũ��"
#      �� ������ �Ѿ�� "�̻��ϴ�"�� ������..
#
#  5) Q1 - 1.5 * IQR                            # -27.5
#     Q3 + 1.5 * IQR                            # 64.5
#       -> �� �ΰ��� ����� �� = �̻�ġ! 


###   ii) ���ܺ� ���ڱ׸� : boxplot(�����͸�$������ ~ �����͸�$������)
###                         boxplot(�����ڷ� ~ �����ڷ�)
###               -> factor ���·� ���;��Ѵ�!

boxplot(hflights$ArrDelay ~ hflights$Origin)
boxplot(hflights$ArrDelay ~ hflights$Month)
boxplot(log(hflights$ArrDelay) ~ log(hflights$Month))


### 3. �����跮 = �����跮 = ����     => ǥ������ ���� ��!
###         ���� �ڷῡ ���� ��ġ�� ���� ���� �ڷ��� ����� �׷��� �� �ִ� ��!
### Descriptive Statistics = Summary Statistics

### ��� (Parameter)    vs ��跮 (Statistics)  : ���ܿ� ���� ��� ��ġ
### ������ (Population) vs ǥ�� (Sample)

### (1) �߽� = ��ǥ��
###     ���, �������, ������(�߾Ӱ�), �ֺ��(�ֺ�)
###
###   i) ��� : mean(�����͸�$������, na.rm = TRUE)
###         -> �̻�ġ�� ������ ���� �޴´�    
mean(hflights$ArrDelay, na.rm = TRUE)

###   ii) 5% �������(Trimmed Mean) : mean(�����͸�$������, trim = 0.05, na.rm = TRUE)
###         -> ������ 5%, ū�� 5% ���� (��10% ����)
###      mean�� �� ���̰� ����? �̻�ġ�� ���� ���°Ű����� �׳� mean�ᵵ �ǰڴ�
mean(hflights$ArrDelay, trim = 0.1, na.rm = TRUE)

###   iii) ������(�߾Ӱ�) : median(�����͸�$������, na.rm = TRUE)
###         -> �̻�ġ�� ������ �� ���� �ʴ´�    
median(hflights$ArrDelay, na.rm = TRUE)

###   iv) �ֺ��(�ֺ�) (Mode)
###     : which.max(table(�����͸�$������))
##                              # which:��ġ / �󵵰� max�� which�� �˷���
###     : prettyR::Mode()

which.max(c(10,5,3,200))
which.max(table(hflights$ArrDelay))

prettyR::Mode(hflights$ArrDelay)

### (2) ���� = ���� = �ٸ�
### ����, ���������(�����������), �л�, ǥ������, ������ ���� ����

###   i) ����(Range)
range(hflights$ArrDelay, na.rm = TRUE)
diff( range(hflights$ArrDelay, na.rm = TRUE) )  # ����

###   ii) ��������� = �����������(IQR:Inter Quartile Range)
###       : IQR(�����͸�$������)
IQR(hflights$ArrDelay, na.rm = TRUE)

# "������ ����������� ���� �ٸ� ���, �̻�ġ�� ������~"

###   iii) (ǥ��)�л� (variance) : var(�����͸�$������, na.rm = TRUE)
###       degree of freedom (df) = s-1
var = var(hflights$ArrDelay, na.rm = TRUE)      # �л��� ��� = (���� ����)^2
sqrt(var)

###   iv) (ǥ��)ǥ������ (sd : standart Deviation)
###       : sd(�����͸�$������, na.rm = TRUE)
###       -> '�ٸ�'�� ǥ���ϴµ��� ���� ����!!
sd(hflights$ArrDelay, na.rm = TRUE)

###   v) ������ ���� ���� (MAD : Median Absolute Deviation)
###       : mad(�����͸�$������, na.rm = TRUE)
mad(hflights$ArrDelay, na.rm = TRUE)
#######
# c(1,2,3,5,7,8,10)
#
# 1) ������
#   5
#
# 2) data - ������ = ����
#   -4  -3  -2  0  2  3  5
#
# 3) 2)�� ���밪
#    4   3   2  0  2  3  5
#
# 4) 3)�� ������
#   3 -> ������ ���� ����
#
#######


### (3) ������ ���

###   ���� �ڷῡ ���� ��ġ�� ���� ���� �ڷ��� ����� �׷��� �� �ִ� ��!
###   ���м��� �ϴ� ���� : '�ٸ�'�� �ֱ� �����̴�!
###         -> ���⼭ �м����� �ؾ����� : '�ٸ�'�� ��ġȭ�ϰ�, ������ ã��

### i) �ֵ�(Skewness) : ��Ī����
###       �ֵ�  = 0 : ��Ī
###       �ֵ� != 0 : ���Ī
###       �ֵ�  > 0 : �������� ġ��ģ ���� (������ ��������)
###       �ֵ�  < 0 : ���������� ġ��ģ ���� (���� ��������)

### ii) ÷��(Kurtosis) : �߽��� �󸶳� �����Ѱ�?
###       ÷�� > 0 �߽��� ��������
###       ÷�� = 0 �߽��� �����̴�
###       ÷�� < 0 �߽��� �����ϴ�

### �߰� Package ��ġ �ʿ� : psych::describe(), describeBy()
                                                  # By �� ���� -> factor

psych::describe(hflights$ArrDelay, na.rm = TRUE)
# se : Standard Error ǥ�ؿ���
#     -> ���� ǥ������ ����� 7.09���� ���Դµ�,
#        �ٸ� ǥ���� ������ ����� ���� ǥ���� ��հ� se��ŭ �޶�����

psych::describeBy(hflights$ArrDelay, hflights$Origin)

# psych::describeBy(���� �ڷ�, ���� �ڷ�)
psych::describeBy(hflights$ArrDelay, hflights$Month)



### summary(�����͸�$������)
summary(hflights$Month)
hflights$Month_factor = as.factor(hflights$Month)
summary(hflights$Month_factor)

summary(hflights$ArrDelay)


### summary(�����͸�)
summary(hflights)


### by(�����ڷ�, �����ڷ�, �Լ���)
by(hflights$ArrDelay, hflights$Origin, mean, na.rm = TRUE)
by(hflights$ArrDelay, hflights$Origin, sd, na.rm = TRUE)
by(hflights$ArrDelay, hflights$Origin, summary, na.rm = TRUE)
by(hflights$ArrDelay, hflights$Origin, describe)

### () : ����ǰ�, ����� ����϶�
(x=3)     # ��� 3�� �ٷ� ���