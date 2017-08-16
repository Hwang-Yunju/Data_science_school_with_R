############################################################
### �������� : �������� ����(numeric, character)
### �ۼ��� : yunju hwang
### �ۼ����� : 2017.07.17
############################################################

### [1] ����(Vector) �ڡ� 
### [2] ����(Factor) -> �������� �ν� (�����м��� ���)
### [3] ���(Matrix) ��
### [4] �迭(Array)
### [5] ������ ������(Data.Frame) �ڡ�
### [6] ����Ʈ(List)
### [7] ������ ���̺�(Data.Table)
### [8] �ð迭(Time Series) ��


############################################################
### [1] ����(Vector)

### �ϳ� �̻��� ��(���� : element)���� �̷���� #���� 1��¥���� ����
### �ϳ��� ��(column)�� �Ǿ� ����
### �ϳ��� ������ ������ ���´� (Python�� ���� �������� ������ ���´�)

### 1. ���͸� �����ϴ� ���

### (1) c(����1, ����2, ...)
###  c : combine, concatenate�� ����
###  numeric, character, logical ���͸� ���� �� ����
###  ���ҵ� ���� ��Ģ�� ���� ���� �����
age <- c(29, 21, 25, 24, 27)
age
mode(age)
is.numeric(age)

gender = c("female", "male", "male", "female", "male")
gender

marry = c(FALSE, FALSE, TRUE)
marry

v1 = c(1, "Lee", FALSE)
v1 # ��� character�� �ٲ�

v2 = c(1, TRUE)
v2 # ��� numeric���� �ٲ�

### ������ ���� �켱���� : character > numeric > logical
### ������ ������ �켱������ ���� �������� �ڿ������� �ٲ��

v1 <- c(7, 36, 96)
v2 <- c(8, 18, 28, 38)
vv <- c(v1, v2)
vv <- c(v1, v2)


### (2) start���� : end����

### numeric vector���� �����
### 1�� �����Ǵ� ���ڳ� �Ǵ� 1�� ���ҵǴ� ���ڷ� �̷���� ���͸� ����
### ��Ģ�� �ִ� ���ڵ�

### start:end
### start < end : 1�� ����
### start > end : 1�� ����
### start = end : start or end
### start ���� �����ؼ� end�� ���� ���� ������ 1�� ���� �Ǵ� 1�� ����

1 : 5
5 : -1
1 : 10000
-2.3 : 1 # -2.3 -1.3 -0.3 0.7
1 : -2.3
# start�� ������ end�� ����, start�� �Ǽ��� end�� �Ǽ�

###  (3) seq(from=, to=, by=)
### seq : sequence ����
### numeric vector���� �����
### ':'�� Ȯ��

### from, to, by : arguments
### from : start
### to : end
### by : ���� �Ǵ� ������ ��

seq(from = 1, to = 10, by = 2)
seq(1, 10, 2)
seq(from = 5, to = 1, by = -0.1)
seq(5, 1, -0.1)

seq(0, 1, length.out=11) # 0���� 1������ ���ڸ� 11���� ��������
seq(0, 1, length.out=15)


###  (4) sequence(����)
### numeric vector���� �����
### 1 ~ '����' ������ ������ �̷���� ����
sequence(10)
sequence(3.7)


### (5) rep(vector, times=, each=)
### numeric, character, logical vector�� �����
### rep : replicate�� ����

rep(1, times = 10)
rep(1, each = 10)

rep(1:2, times = 10)              # 1 2 1 2 1 2 1 2 1 2 ...
rep(1:2, each = 10)               # 1 1 1 1 1... 2 2 2 2 2

rep(c("����","����"), each = 10)  # "����" "����" ... "����" "����" "����" 

rep(1:3, each = 3)
rep(1:3, times = 3)