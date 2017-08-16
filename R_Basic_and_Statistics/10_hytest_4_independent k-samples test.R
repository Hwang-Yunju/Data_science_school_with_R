############################################################
### �������� : ���� kǥ�� ����(Independent k-samples test)
### �ۼ��� : yunju hwang
### �ۼ����� : 2017.07.31 (��)
############################################################

# ����� �Ҽ��� ��°���� ǥ�����ִ� �Ϳ� �����̴�!
#  0.000, 0.048 (�ݿø��ؼ�)

# ���� �̻��� �������� ����� �ٸ����� ��������� �����ϴ� ���

# �͹����� : �������� ����(6����)�� ���� ���� ȿ���� ����. (mu1 = mu2 = mu3 = .. = mu6)
# �븳���� : �������� ����(6����)�� ���� ���� ȿ���� �ִ�. (not H0)

# ���� ������ : InsectSprays
#      ������ : spray, count
InsectSprays$spray # ������ ����
InsectSprays$count # ����� �׾�����

# ���Լ� ����
  # �͹����� : ���Լ��� ������.
  # �븳���� : ���Լ��� ������ �ʴ´�.
by(InsectSprays$count, InsectSprays$spray, shapiro.test)

  # spray C,D : ���Լ��� �������� ����
  #   -> �Ѱ��� ���Լ��� �������� ������ ���δ� Kruskal-Wallis ������� �ؾ�
  # ���Լ� ������ ����

# 2�ܰ� : Kruskal-Wallis test
  # kruskal.test(�����͸�$������ ~ �����͸�$������)
  # kruskal.test(���� �ڷ� ~ ���� �ڷ�)
kruskal.test(InsectSprays$count ~ InsectSprays$spray)

# ��� : ����Ȯ���� 0.000�̹Ƿ� ���Ǽ��� 0.05���� �������� ������ ���� ��������� ������ ����ȿ���� �ִ� ������ ��Ÿ����. (�븳���� ä��)

# But, ������ ���̰� �ִ��� ��! -> �̰��� �˱� ���ؼ� �ΰ� �ΰ��� ���ϴ� ���ߺ񱳸� ������

# 3�ܰ� : ���ߺ� (Multiple Comparisons)
#       = ���ĺм� (Post-Hoc)

# non-parametric comparison : �������� ���ߺ񱳸� �������ִ� package
install.packages("nparcomp") 
library(nparcomp)

# nparcomp::nparcomp(�����ڷ� ������ ~ �����ڷ� ������, type = "Tukey", data = �����͸�)
    # type = c("Tukey", "Dunnett" ->�����ڵ��� ���ֻ��, "Sequen", "Williams", "Changepoint", "AVE", "McDermott", "Marcus", "UmbrellaWilliams", "UserDefined")
nparcomp::nparcomp(count ~ spray, type = "Tukey", data = InsectSprays)

# ���̰� ���� (A,B) ...
# ���̰� �ִ� (A,c) ...


### ����, ���Լ� ������ �����Ǿ��ٸ�

# 2�ܰ� : �л�м�(ANOVA : Analysis of Variance)
# �л�м���� = aov(������ ~ ������, data = �����͸�)
# summary(�л�м����) -> generic function

anova.result = aov(count ~ spray, data = InsectSprays)
summary(anova.result)

#             Df Sum Sq Mean Sq F value              Pr(>F)    
# spray        5   2669   533.8    34.7 <0.0000000000000002 ***
# Residuals   66   1015    15.4                                

# SSB = 2669,  SSE = 1015,  SST = 2669 + 1015
# df1 = k-1 = 6-1 = 5,  df2 = n-k = 72-6 = 66
# MSB = 2669/5  = 533.8
# MSE = 1015/66 = 15.4
# F = MSB/MSE = 533.8/15.4 = 34.7

# ��� : �븳������ ä���Ѵ�.



### ����, ���Լ� ������ �����ǰ� ���� ���� ���̰� �ִٰ� ����� ����

# 3�ܰ� : ���ߺ� = ���ĺ�

# TukeyHSD(�л�м����)
TukeyHSD(anova.result)   # C���� A �������� ȿ���� ����!







### ī���������� X^2

# H0 : �������ؿ� ���� �뵷�� ���̰� ����
# H1 : �������ؿ� ���� �뵷�� ���̰� �ִ�

# �� �� �� �� �� �� �� �� �� �� �� ��
# 50 40 60 50 30 70 40 40 30 70 40 50

# 30  30  40  40  40  40  50  50  50  60  70  70
# 1.5 1.5 4.5 4.5 4.5 4.5 

# <��ռ�����>
# �� : 8+8=16 -> 16/2=8
# �� : 4.5*   7
# �� : 5

# ��밪    ������   ������-��밪   (������-��밪)^2 / ��밪
# �� : 6.3    8        8 - 6.3
# �� : 6.3    7        7 - 6.3
# �� : 6.3    5        5 - 6.3
#                                        -> �հ� : ī������

# ��밪�� ������ ���̿� ���̰� ���� ���� ��� �͹����� ä��




