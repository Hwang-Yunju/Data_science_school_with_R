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

rep(1:3, times = 5, each = 3)     # each�� ���� ���� ��, times ����
# argument�� �����ϴ� ������ ���ֶ�!

c(rep(1, times = 100), rep(2, times = 50), rep(3, times = 13)) # �̰ź���,
rep(1:3, times = c(100, 50, 13))  # 1�� 100��, 2�� 50��, 3�� 13��

### (6) paste(����1, ����2, ...) ��
### ������ ������ ���ҵ��� ���ļ� character ������ ���Ҹ� ����
### ������, �����̸� naming �Ҷ� �ſ� ����
paste(1, 1)
paste(1, 1, sep = "-")  # ���� ��ſ� -�� �־��
paste(1, 1, sep = "")   # ������ ���ش�
paste(1:3, 1:3)   # ����ȭ (Vectorization) ��� : "1 1" "2 2" "3 3"

paste("X", 1:4, sep = "")


### 2. vector�� �Ӽ�
### (1) length(vector) : ���Ͱ� ������ ������ ���� (data�� ����)
age = c(26, 27, 25)
length(age)

### (2) names(vector) : ������ �̸�
names(age)  # NULL


############################## NA, NULL

# NA    : ������ ����������, ���� �������� �ʾҴ�
#         (Not Available = "Missing Value = ����ġ, ������")
# NULL  : ������ü�� ����.
#         (��ü, ��ü Object, ������, ���Ұ� �������� �ʴ´�)

# NaN (Not a Number) -> NA�� ���
# Inf, -Inf (Infinite)

?NA     # ���� �Ұ���. ����� ��� NA
?NULL   # ���� ����. NULL�� �����ϰ� ����

length(NA)      # 1
length(NULL)    # 0

A <- c(1,NA,3,NULL,5)
A               # 1 NA 3 5
length(A)       # 4       ( NA�� ���̿� ���� / NULL�� ���̿� ����X )

N <- 1 + NA     # NA
N == 1          # NA
is.numeric(N)   # TRUE

NU <- 1 + NULL  # numeric(0)  
NU == 1         # logical(0)
is.numeric(NU)  # TRUE

?numeric(0)

### NA, NULL ������ Ȯ��
is.na()
is.infinite()

colSums(is.na())
colSums(is.infinite())

### NA, NULL ������ ó��
mean(student$age, na.rm = TRUE)
student_1 <- na.omit(student)   #���ʿ� NA���� ���ִ� ���� ��� ����
student[is.na(student)] <- 0    #NA���� �ٸ� ������ ��ü

############################## NA, NULL

names(age) <- c("Ha", "Jeong", "Kim")   # names�� ��� : character vector!
age     # ��� : vector

names(age) <- NULL
names(age)
age

### 3. ������ �����̽�(slicing) = �ε���(indexing)
###  vector �߿��� �Ϻ��� ����(��)�� ����
###  vector[index] : ���ȣ[]�� ���
###  index�� 1���� ������

income = c(500, 1000, 3500, 400, 300)
income[1]
income[2]
income[3]
income[4]
income[5]
income[6]   # NA  # NULL�� ���;��ϴ°žƴѰ�???

income[c(1,4,5)]  # 1��°, 4��°, 5��° ���Ҹ� �����Ͷ�
income[2:5]       # 2��°���� 5��°���� ���Ҹ� �����Ͷ�

income[seq(from = 1, to = length(income), by = 2)]

### 4. vector�� ���� : +, -, *, /, **, ^, %%, %/%
v1 = 1:3
v2 = 4:6

v3 <- v1 + v2 # index�� ���� ���̵鳢�� ������ ��
v3

v3 <- 1:6
v1 + v3
# ���� ��Ģ (Recycling Rule)
# ���� vector�� ū vertor �����,
# ���� vector�� ū vector�� ���� ũ�Ⱑ �ɶ����� �ݺ��Ǿ� ����

v4 <- 1:8  
v1; v4
vv <- v1 + v4 # error�� �ƴϰ�! Warning mesage : vector���� ����� ���迩����
vv
v5 <- 1:9
v1 + v5



############################################################
### [2] ����(Factor)

### vector�� ����
### ����(group)���� �ν���
### 1����

### factor(vector, labels = , ordered = )
bt = c("AB", "AB", "A", "A", "B") # ���� ���������� ���ٰ� �ν����� ����
bt.factor = factor(bt)
bt.factor     #Levels : A AB B    # ���ĺ� ������ ����

bt_factor = factor(bt, labels = c("A��", "AB��", "B��")) 
# levels�� ���� ���� �״�� �����ֱ�
bt_factor

btFactor = factor(bt, 
                  levels = c("AB", "A", "B"), 
                  labels = c("AB��", "A��", "B��"),
                  ordered = TRUE) # shift + enter : ������
btFactor

### factor�� �Ӽ�
### (1) levels(����)
### (2) ordered(����) : ������ ������ �ǹ� �ֵ��� ����
bt.factor <- ordered(bt.factor)


aa <- c("a","c","a","a","b","c","d")
aa.factor <- factor(aa)


factor(aa,
       levels = c("a", "b", "c", "d"),
       labels = c("A", "B", "C", "D"))

factor(aa,
       levels = c("a", "b", "c", "d"),
       labels = c("A", "B", "C", "D"),
       ordered = TRUE)
A<D


bt.factor 


############################################################
### [3] ���(Matrix) ��

### 2����
### ��(row)�� ��(column)���� �����Ǿ� ����
### vector�� Ȯ�� (������ ���� �ϳ���, recycling ... ���� ����)
### ����� �̸��� �빮�ڷ�!

### 1. ����� ����� ���
### (1) rbind(����1, ����2, ...) : vector�� ������ ����
###     cbind(����1, ����2, ...) : vector�� ���� ����
v1 = 1:3
v2 = 4:6
M1 = rbind(v1, v2)
M1    # M1 2X3 (two by three matrix)

M2 = cbind(v1, v2)
M2

v3 <- 1:6
M3 <- cbind(v1, v2, v3)
M3    # M3 6X3 matrix  # recycling rule ����!

### (2) matrix(����, nrow = , ncol = , byrow = )
matrix(1:4, nrow = 2, ncol = 2) # dafault�� : byrow = FALSE
# column�� row���� �켱�̴�!
# 1 3
# 2 4
matrix(1:4, nrow = 2, ncol = 2, byrow = TRUE)
# 1 2
# 3 4
a <- matrix(1:4, nrow = 3, ncol = 3)  # recycling
a


### 2. ����� �����̽�
### ���[��index, ��index]      # ,�� ������ ����!
M3
M3[1   , ]
M3[1:2 , ]

M3[ , 1]
M3[ , 1:2]


### 3. ����� ������ ����
### ����ϴ� ������� ����� ���ƾ���
A <- matrix(1:4, nrow = 2, ncol = 2)
B <- matrix(5:8, nrow = 2, ncol = 2)
A + B
A - B
A * B

### 4. ����� ���� : A %*% B
### A[r1 X c1], B[r2 X c2]
### ���� : c1 = r2
### ��� : r1 X c2
A %*% B
B %*% A   # ���� ����� �ٸ���


### 5. �����(Reverse Matrix) : solve(matrix)
### ���� 1) �������(Square Matrix) : Row�� ���� = Column�� ����
###      2) ��Ľ� != 0
solve(A)
A %*% solve(A)  # ��� X ����� = �������(Identity Matrix : I)

A1 = matrix(c(2, 1, -1, 3), nrow = 2, ncol = 2)
A1
B1 = matrix(c(3, 10), nrow = 2, ncol = 1)
B1

solve(A1) %*% B1


### 6. ��ġ���(Transpose Matrix) : t(matrix)
### ��� ���� �ٲ�
A
t(A)

### cf. ����� �Ӽ��� [5] ������ �����ӿ��� �ٷ� ����

############################################################
### [4] �迭(Array)

### ������
### vector, matrix�� Ȯ��
### ������ ������ �ϳ��� ���´�, Recycling.. ���� ����ȴ�

### array(vector, dim = )
###  dim : ���� ���� 1�� ������ vector, 2�� ������ matrix, 3�� ������ array ��..
array(1:10, dim = 10)   # vector
array(1:10, dim = 12)   # 
array(1:10, dim = 3)    # 

array(1:10, dim = c(3, 4))       # 2���� matrix

array(1:10, dim = c(3, 4, 2))    # 3���� matrix

array(1:10, dim = c(3, 4, 2, 2)) # 4���� matrix



############################################################
### [5] ������ ������(Data.Frame) �ڡ�

### ��� ���� ����. 2���� ����
### �������� ������ ������ ���´� (��, 1���� ���� 1���� ������ ���´�)
### ���� �ٷ�� �� data�� ����̴�!

### data.frame(����1, ����2, ���, ...)
id <- 1:5     # ���κ� �ĺ���ȣ�� ó���� ����������Ѵ�
gender <- c("M", "M", "M", "F", "M")
address <- c("���Ĺ�", "����", "�б���", "����", "����")
survey <- data.frame(id, gender, address)
survey

### ������ �������� �Ӽ�
### (1) ���� ���� : nrow(������)      # numeric vector
nrow(student)

### (2) ���� ���� = ������ ���� : ncol(������)      # numeric vector
ncol(student)

### (3) ���� �̸� : rownames(������)       # character vector
rownames(student)   # defailt : "1" "2" "3" ...

### (4) ���� �̸� = ������ �̸� : colnames(������)      # character vector
colnames(student)

### (5) ����(dimension) : ��, ��        # vector
### dim(������) 
dim(student)
dim(student)[1]
dim(student)[2]

### (6) ������ �̸� : ���� �̸�, ���� �̸�        # List
dimnames(student)           # List
dimnames(student)[1]        # List
dimnames(student)[[1]]      # vector
dimnames(student)[[1]][3]   # vector�� 3��° data







############################################################
### [6] ����Ʈ(List)

### �м��� ����� ������ �� ���� ����ϴ� ����
### ���� ������ ������ ����
### List�� ���ҷ� vector, factor, matrix, array, dataframe, list�� ����������
### ȸ�ͺм�, �л�м�

### List �����̽� ���
###  List[index]    : ����� List��!
###  List[[index]]  : ����� �����̵̽� �������� ��������!

v1 <- 1:10
v2 <- 1:3
m1 <- cbind(v1, v2)
result <- list(v1, v2, m1, survey)
result

result[1]     # List
result[[1]]   # vector

result[4]     # List
result[[4]]   # data.frame
