############################################################
### �������� : ȸ�ͺм� (regression analysis)
### �ۼ��� : yunju hwang
### �ۼ����� : 2017.08.07 (��)
############################################################

install.packages("car")
install.packages("lm.beta")
library(car)
library(lm.beta)

# ------------------
Anaconda
# Anaconda�� ��ġ�� ���¿��� RStudio�� RGui���� �Ʒ��� ���ɾ �����Ѵ�.
1.
install.packages(c("pbdZMQ","repr","devtools"))
2. 
install.packages("stringr")
3.
devtools::install_github("IRkernel/IRkernel")
4.
IRkernel::installspec()
# #
# ȸ�͸���, AIC, BIC(��������)
# AIC, BIC�� ���� ���� ���� ��, adjusted R^2���� ���� ū ���� ����!
#
# �����ڷ� 1�� : ǥ, �׷���(����, ���׷���)
# �����ڷ� 1�� : ǥ, �׷���(������׷�, ���ڱ׸�), �����跮
# 
# ��������
# �����ڷ� 1�� : ��ǥ�� ����
#                - one sample t-test
#                - Wicoxon's signed rank test
# �����ڷ� 1�� & �����ڷ� 1�� (���� 2������ ���) : ���� 2ǥ�� ����
#                                              - ���� 2ǥ�� T����
#                                              - Wilcoxon's rank sum test = Mann-Whitney U test
# �����ڷ� 1�� & �����ڷ� 1�� : ������ ����ڿ��� ������ ���� �ڷ�, ������ ���� �ڷ�
# ������ ����ڿ��� x�� �����ڷ�, y�� �����ڷ� : ���� 2ǥ�� ����
#                                              - ���� 2ǥ�� T����
#                                              - Wilcoxon's signedrank test
# �����ڷ� 1��, �����ڷ� 1��(���� 3�� �̻����� �̷����)
#                                              - �л�м�
#                                              - Kruskal-Wallis rank sum test
# �����ڷ� 1�� & �����ڷ� 1�� : ���ü�
#                 - ����м�
# �����ڷ� 1�� & �����ڷ� 1�� : ���ü�
#                 - �����м� = ī���������� = Chi-Square test 
#                                              (����/�������� ���� ����� ���� ����ȭ��)
# �����ڷ� 1��(���Ӻ���), �����ڷ� 1��(��������) : �ΰ�����
#                                               - �ܼ����� ȸ�ͺм�
# �����ڷ� 1��(���Ӻ���),
# �����ڷ� 1�� �̻�, �����ڷ� 1�� �̻�(��������) : �ΰ�����
#                                               - ���߼��� ȸ�ͺм�
# ���� 2������ �����ڷ� 1��(���Ӻ���),
# �����ڷ� 1�� �̻�, �����ڷ� 1�� �̻�(��������)
#                                               - �̺��� ������ƽ ȸ�ͺм�
#                                                -> sigmoid function 
# ���� 3���� �̻��� �����ڷ� 1��(���Ӻ���),
# �����ڷ� 1�� �̻�, �����ڷ� 1�� �̻�(��������)
#                                               - �ٺ��� ������ƽ ȸ�ͺм�
#                                                -> softmax function
# �̿ܿ���..
# �ð迭�м�, �Ǻ��м�, �ǻ�������� ...


# ���� : �ΰ����� (���ΰ� ���)
#        ����(Prediction), �з�(Classification)

# ���Ӻ��� = �������� ****
# �������� = ��������

# �ܼ�����ȸ�ͺм� : ���Ӻ���(�����ڷ�) 1��, �������� 1��
# ���߼���ȸ�ͺм� : ���Ӻ���(�����ڷ�) 1��, �������� 1��

# 1. �ܼ�����ȸ�ͺм�
# ���� ������ : cars
# ������ : speed, dist

# ���Ӻ��� : dist
# �������� : speed

# ȸ�͸��� : dist = beta0 + beta1 * speed + error

# ȸ�ͺм������ = lm(���Ӻ��� ~ ��������, data = �����͸�)
# summary(ȸ�ͺм� �����)
cars.lm = lm(dist ~ speed, data = cars)
summary(cars.lm)

# Call:
#   lm(formula = dist ~ speed, data = cars)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -29.069  -9.525  -2.272   9.215  43.201 
# 
# Coefficients:
#           Estimate Std.   Error    t value   Pr(>|t|)    
# (Intercept) -17.5791     6.7584    -2.601     0.0123 *  
#   speed       3.9324     0.4155     9.464   1.49e-12 ***
#   ---
#   Signif. codes:  0 ��***�� 0.001 ��**�� 0.01 ��*�� 0.05 ��.�� 0.1 �� �� 1
# 
# Residual standard error: 15.38 on 48 degrees of freedom
# Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
# F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12


#  < ȸ�ͺм��� ����� �ؼ��ϴ� ��� >
# 1�ܰ� : ȸ�͸����� ��������� Ÿ���Ѱ�?
  # �͹����� : ȸ�͸����� Ÿ������ �ʴ�.
  # �븳���� : ȸ�͸����� Ÿ���ϴ�.

  # F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12
  # 1�ܰ��� ��� : �븳����(ȸ�͸����� Ÿ���ϴ�)
  
  # ����, 1�ܰ��� ����� �͹������̸� ȸ�ͺм��� 1�ܰ迡�� ��!


# 2�ܰ� : (1�ܰ��� ����� �븳�����϶�) ���������� ���Ӻ������� ������ �ִ°�?
  # �͹����� : ���������� ���Ӻ������� ������ ���� �ʴ´�.
  # �븳���� : ���������� ���Ӻ������� ������ �ش�.

  #           Estimate Std.   Error    t value   Pr(>|t|)    
  #   speed       3.9324     0.4155      9.464   1.49e-12 ***
  # 2�ܰ��� ��� : ����Ȯ���� 0.000�̹Ƿ� ���Ǽ��� 0.05���� ���������� ���Ӻ������� (��������� ������) ������ �ش�.


# 3�ܰ� : ���������� ���Ӻ����� ��� ������ �ִ°�?
  #           Estimate Std.
  #   speed       3.9324

  # ���������� ȸ�Ͱ��(coefficient of Regression) : 3.932
  # speed�� 1mph(�ð��� 1����) �����ϸ� dist�� �� 3.932 feet �����Ѵ�. (���� �� �����ֱ�)


# 4�ܰ� : ����(Prediction)
  # dist = -17.5791 + 3.9324 * speed
  # predict(ȸ�ͺм����, newdata = data.frame(speed = ))  # �������� c()
predict(cars.lm, newdata = data.frame(speed = 200), interval = "predict") # ������?

# 5�ܰ� : ȸ�͸����� ������ = ���������� ������
  # R-squared = �������
  # Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
  # 0.651 * 100 = 65.1%
  # speed�� dist�� �ٸ��� �� 65.1% �����Ѵ�.





# 2. ���߼��� ȸ�͹���
# ���Ӻ��� 1��      : ���� �ڷ�
# �������� 2�� �̻� : ���� �ڷ�, ���� �ڷ�
                        # factor�� ���̺��������� �ʾƵ��ȴ�
                            # �⺻ : ó���� �������� ����
# ���� ������ : attitude
# ���Ӻ��� : rating
# �������� : 6��(�����ڷ�)

# ȸ�͸��� : rating = beta0 + beta1 * complaints + ... + beta6 * advance + error

# ȸ�ͺм� ����� = lm(rating ~ complaints + ... + advance, data = �����͸�)
# ȸ�ͺм� ����� = lm(rating ~ ., data = �����͸�
# summary(ȸ�ͺм� �����)

attitude.lm = lm(rating ~ ., data = attitude)
summary(attitude.lm)

  # Call:
  #   lm(formula = rating ~ ., data = attitude)
  # 
  # Residuals:
  #   Min       1Q   Median       3Q      Max 
  # -10.9418  -4.3555   0.3158   5.5425  11.5990 
  # 
  # Coefficients:
  #         Estimate Std.   Error t   value Pr(>|t|)    
  # (Intercept) 10.78708   11.58926   0.931 0.361634    
  # complaints   0.61319    0.16098   3.809 0.000903 ***
  # privileges  -0.07305    0.13572  -0.538 0.595594    
  # learning     0.32033    0.16852   1.901 0.069925 .  
  # raises       0.08173    0.22148   0.369 0.715480    
  # critical     0.03838    0.14700   0.261 0.796334    
  # advance     -0.21706    0.17821  -1.218 0.235577    
  # ---
  #   Signif. codes:  0 ��***�� 0.001 ��**�� 0.01 ��*�� 0.05 ��.�� 0.1 �� �� 1
  # 
  # Residual standard error: 7.068 on 23 degrees of freedom
  # Multiple R-squared:  0.7326,	Adjusted R-squared:  0.6628 
  # F-statistic:  10.5 on 6 and 23 DF,  p-value: 1.24e-05


#  < ȸ�ͺм��� ����� �ؼ��ϴ� ��� >

# 1�ܰ� : ȸ�͸����� ��������� Ÿ���Ѱ�?
  # �͹����� : ȸ�͸����� Ÿ������ �ʴ�.
  # �븳���� : ȸ�͸����� Ÿ���ϴ�.

  # F-statistic:  10.5 on 6 and 23 DF,  p-value: 1.24e-05
  # 1�ܰ��� ��� : �븳����(ȸ�͸����� Ÿ���ϴ�)


# 2�ܰ� : (1�ܰ��� ����� �븳�����϶�) �������� ������ ���Ӻ������� ������ �ִ°�?
  # �͹����� : ���������� ���Ӻ������� ������ ���� �ʴ´�.
  # �븳���� : ���������� ���Ӻ������� ������ �ش�.
  
  # Coefficients:
  #         Estimate Std.   Error t   value Pr(>|t|)    
  # (Intercept) 10.78708   11.58926   0.931 0.361634    
  # complaints   0.61319    0.16098   3.809 0.000903 ***
  # privileges  -0.07305    0.13572  -0.538 0.595594    
  # learning     0.32033    0.16852   1.901 0.069925 .  
  # raises       0.08173    0.22148   0.369 0.715480    
  # critical     0.03838    0.14700   0.261 0.796334    
  # advance     -0.21706    0.17821  -1.218 0.235577  

  # 2�ܰ��� ��� : ����Ȯ���� 0.000�̹Ƿ� ���Ǽ��� 0.05���� ���������� ���Ӻ������� (��������� ������) ������ �ش�.


  #  < �������� ��� >  "���� �� �غ��� AIC, BIC�� �۰�, adjusted R^2�� ū�ָ� ����"
  # 1. �������ù�(Forward Selection)    : �����ִ� ���� �ֱ�(���� �ٽ� ������)
  # 2. �������Ź�(Backward Elimination) : �� �ְ� ���þ��°� ����(������ �ٽ� ������)
  # 3. �ܰ� ���ù�(Stepwise Selection)  : �������� �ٽ� ������ ���Դ��� �ٽ� ������
  # 4. ��ü ����

# step(ȸ�ͺм� �����, direction = c("forward", "backward", "both"))
model.forward  = step(attitude.lm, direction = "forward")   # AIC = 123.36
model.backward = step(attitude.lm, direction = "backward")  # AIC = 118
model.stepwise = step(attitude.lm, direction = "both")      # AIC = 118

summary(model.backward)
 # learning�� ������ ���ִµ��� ���ԵǾ���! �׷��� �ٽ�
model.final = lm(rating ~ complaints, data = attitude)
summary(model.final)

# 3�ܰ� : ���������� ���Ӻ����� ��� ������ �ִ°�?
  #             Estimate
  # complaints   0.75461  

# ���������� ȸ�Ͱ��(coefficient of Regression) : 0.755
# complaints�� 1�� �����ϸ� rating�� �� 0.755 �� �����Ѵ�. (���� �� �����ֱ�)


# 4�ܰ� : ����(Prediction)
# dist = -17.5791 + 3.9324 * speed
# predict(ȸ�ͺм����, newdata = data.frame(complaints = ))  # �������� c()
predict(cars.lm, newdata = data.frame(complaints = 200), interval = "predict") # ������?

# 5�ܰ� : ȸ�͸����� ������ = ���������� ������
# R-squared = �������
# Multiple R-squared:  0.6813
# 0.6813 * 100 = 68.1%
# complaints�� rating�� �ٸ��� �� 68.1% �����Ѵ�.


# �����ؾ�����
# ���� ȸ�͸����� ���������� 2�� �̻� ������ �Ǹ�,
# 1. ȸ�Ͱ���� �ؼ�
  # ��������1�� ������ ������������ �����Ǿ� ���� ����(����)
  # ��������1�� �⺻������ 1 �����ϸ� ���Ӻ����� �� �� ����/���� �Ѵ�.

# 2. ���߰�����(Multicollinearity)�� Ȯ��
  # ���������� ���� ������ ����� ����� �Ѵ�.
  # VIF(Varaince Inflation Factor) : 10 �̻��̸� ���߰������� �����Ѵٰ� �Ǵ�
  #       -> ���������� ���� ������ ���谡 �����Ѵ�.
  #       -> �� ����� ���´ٸ� ���������� �ֿ� ���� ���� �����ϱ�
  # car::vif(ȸ�ͺм����)
library(car)
car::vif(attitude.lm)

# 3. ȸ�͸����� ������ : Adjusted R-Square (�׳� R-Square�� �̰Ŷ� �Ѵ� ������Ѵ�)
                        # 2���� ���������� ������ 

# 4. ������������ ����� ũ�� ��
  # ǥ��ȭ�� ȸ�Ͱ��
  # lm.beta::lm.beta(ȸ�ͺм� �����)
library(lm.beta)
lm.beta::lm.beta(attitude.lm)