############################################################
### �������� : ����м� (Correlation Analysis)
### �ۼ��� : yunju hwang
### �ۼ����� : 2017.07.31 (��)
############################################################

install.packages("DT")
install.packages("psych")
install.packages("Hmisc")

library(DT)
library(psych)
library(Hmisc)

# ���� : �ΰ��� �����ڷ� ���� ���ü��� �ִ����� ��������� �����ϴ� ���
# ���ü� : ������ ���� = ������ ����9

# ���� ������ : cars
# ������      : speed(�ӵ�), dist(�����Ÿ�) : distance

# �͹����� : speed�� dist ������ ���ü�(����=������ ����)�� ����.
# �븳���� : speed�� dist ������ ���ü�(����=������ ����)�� �ִ�.

# 1�ܰ� : ������(Scatter plot)
# plot(�����͸�$������, �����͸�$������)
#   plot(x�࿡, y�࿡) -> �� �߿��� ������ y�� ������! (x�� ���� y�� ��� ���ϴ���)
plot(cars$speed, cars$dist)

# 2�ܰ� : ������(Coefficient of Correlation) = r (-1 < r < 1)
# cor(�����͸�$������, �����͸�$������)
#   cor(x�࿡, y�࿡)
cor(cars$speed, cars$dist) # 0.807 

cor(cars$speed, cars$dist)                      # �⺻ : Pearson (r)   0.807
cor(cars$speed, cars$dist, method = "kendall")  # Kendall (tau)        0.669  
cor(cars$speed, cars$dist, method = "spearman") # Spearman (rho)       0.830


# < ������ �ؼ��� ���̵� >
# 0.0 �̻� ~ 0.2 �̸� : ���ü��� ����
# 0.2 �̻� ~ 0.4 �̸� : ���� ���ü��� ����
# 0.4 �̻� ~ 0.6 �̸� : ������ ��ü��� ����
# 0.6 �̻� ~ 0.8 �̸� : ���� ���ü��� ����
# 0.8 �̻� ~ 1.0 ���� : �ſ� ���� ���ü��� ����

# 3�ܰ� : ����м�
# cor.test(�����͸�$������, �����͸�$������)
cor.test(cars$speed, cars$dist)
  # t = 0.807 / sqrt((1-0.807^2)/48)

cor.test(cars$speed, cars$dist)                      # �⺻ : Pearson (r) 
cor.test(cars$speed, cars$dist, method = "kendall")  # Kendall (tau)     
cor.test(cars$speed, cars$dist, method = "spearman") # Spearman (rho) 

# ��� : ���ǵ�� �����Ÿ� ���� ��������� ������ ���� ������踦 ���δ�. �� ������ �ſ� ����. (�븳���� ä��)




### 

# ���� ������ : attitude
View(attitude)
str(attitude)

# 1�ܰ� : ������ĵ�, ��Ļ�����
# Scatter plot matrix, matrix scatter plot
# plot(�����͸�[ , index]) # ��� ������ �����ڷ��϶� plot(�����͸�)
plot(attitude)



# 2�ܰ� : ������ ���, ��� ������
# cor(�����͸�[ , index])
cor(attitude)
round(cor(attitude), digits = 3)

library(DT)
DT::datatable(round(cor(attitude), digits = 3)) # ǥ�� ����(���������� ������ ����)



# 3�ܰ� : ����м�
cor.test(attitude)  # �ȵȴ�! 

  # ���1 )
library(psych)
# psych::corr.test(�����͸�[ , index])
psych::corr.test(attitude)

  # ���2 )
library(Hmisc)
# Hmisc::rcorr(as.matrix(�����͸�[ , index]))
  # matrix�� ���� : �Ѱ����� ������ ������ ���´�
Hmisc::rcorr(as.matrix(attitude))