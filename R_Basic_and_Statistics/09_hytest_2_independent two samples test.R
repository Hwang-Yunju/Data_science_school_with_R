############################################################
### �������� : ���� 2ǥ�� ���� (Independent two samples test)
### �ۼ��� : yunju hwang
### �ۼ����� : 2017.07.31 (��)
############################################################

# �� �������� ����� ��� ������ ū��, ������, ���� �������� ��������� �����ϴ� ���

# �͹����� : ������ ���� �뵷�� ���̰� ���� (mu1  = mu2)
# �븳���� : ������ ���� �뵷�� ���̰� �ִ� (mu1 != mu2)


id = 1:13
gender = c("m","f","f","f","m","m","m","f","m","m","m","m","m")
money = c(30, 50, 50, 60, 70, 30, 70, 40, 50, 70, 60, 40, 50)
st2 = data.frame(id, gender, money)
View(st2)

# 1�ܰ� : �� ���ܺ� ���Լ� ����
  # by(�����͸�$������, �����͸�$������, shapiro.test)
  # by(���� �ڷ�, ���� �ڷ�, shapiro.test)
by(st2$money, st2$gender, shapiro.test)
  # ��� : ���Լ� ������ �����Ѵ�

# 2�ܰ� : ��л꼺 ����(Equality of Variance Test)
  # �͹����� : ��л��̴�. (���������� �뵷�� �л�� ���������� �뵷�� �л��� ����.)
  # �븳���� : �̺л��̴�.

  # var.test(�����͸�$������ ~ �����͸�$������)
  # var.test(���� �ڷ� ~ ���� �ڷ�)
var.test(st2$money ~ st2$gender)

# F test to compare two variances
# 
# data:  st2$money by st2$gender
# F = 0.24742, num df = 3, denom df = 8, p-value = 0.278
# alternative hypothesis: true ratio of variances is not equal to 1
# 95 percent confidence interval:
#   0.04568397 3.59749771
# sample estimates:
#   ratio of variances 
#   0.2474227

# ��� : ��л��̴�.

# 3�ܰ� : ��л��� ������ ���� 2ǥ�� T����
# t.test(�����͸�$������ ~ �����͸�$������, alternative = , var.equal = TRUE)
                                                            # ��л�
                                                            # �̺л��� ��� : var.equal = FALSE
t.test(st2$money ~ st2$gender, alternative = "two.sided", var.equal = TRUE)

# ��� : ���� Ȯ���� 0.805�̹Ƿ� ���Ǽ��� 0.05���� "������ ���� �뵷�� ���̰� ����"�� �͹������� �Ⱒ�� �� ����.
# ������ ���� �뵷�� ��������� ������ ���̴� ���� ������ ��Ÿ����.


# ����, ���Լ� ������ �����ǰ� �̺л��̶��,
# t.test(�����͸�$������ ~ �����͸�$������, alternative = , var.equal = FALSE)
t.test(st2$money ~ st2$gender, alternative = "two.sided", var.equal = FALSE)

t.result = t.test(st2$money ~ st2$gender, alternative = "two.sided", var.equal = FALSE)
str(t.result)

# ��� ������ �߿��� ������ �����鸸 �̾Ƴ���!
#   -> money�κ��� �ٲٰ� gender�κ��� �ٲ��� ���� for���� ������, if p-value��<0.05�� �̾Ƴ���


# ����, ���Լ� ������ �������� �ʴ´ٸ�,
# 2�ܰ� : ���۽��� ������ ����(Wilcoxon's rank sum test)
# wilcox.test(�����͸�$������ ~ �����͸�$������, alternative = )
wilcox.test(st2$money ~ st2$gender, alternative = "two.sided")

# ��� : �͹������� ä���Ѵ�


# Wilcoxon's rank sum test (W��跮)  -> R�� �̰��� ä��
#      = Mann-Whitney test (U��跮)
