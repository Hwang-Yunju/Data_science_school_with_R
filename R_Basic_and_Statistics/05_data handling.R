############################################################
### �������� : ������ �ڵ鸵 = ������ ��ó��
### �ۼ��� : yunju hwang
### �ۼ����� : 2017.07.19 (��)
############################################################

### Data Handling = Data Pre-processing

# package install, library�� �׻� �� ���� �����ϱ�
options(repos = "https://cran.rstudio.com")

install.packages("readxl")
install.packages("data.table")
install.packages("DT")

library(readxl)
library(data.table)
library(DT)

### �۾�����(Working Directory)
setwd("C:/R")

### ���� : setwd("������ġ")
### getwd()

### ������ �о����
student = readxl::read_excel(path      = "student.xlsx",
                             sheet     = "data",
                             col_names = TRUE) # data �������� �״�� ���

### 1. ������ ��ü ����
### (1) View(������) : ���ο� script�� ǥ�� ������
View(student)

### (2) ������ : Console�� ���
student

### 2. �������� ����(Structure) ����
### str(������)
str(student)

# tbl_df, tbl : S��� ��� ������ ����
# $�� data�� ������ �� �ִ�

### 3. �������� �Ϻ� ����
### (1) head(������)
head(student)       # �⺻ �տ��� 6���� ������
head(student, n=3)  # �տ��� 3���� ������

### (2) tail(������)
tail(student)
tail(student, n=3)

### 4. ������ �������� �Ӽ�
### (1) ���� ���� : nrow(������)                    # numeric vector
nrow(student)

### (2) ���� ���� = ������ ���� : ncol(������)      # numeric vector
ncol(student)

### (3) ���� �̸� : rownames(������)                # character vector
rownames(student)   # defailt : "1" "2" "3" ...

### (4) ���� �̸� = ������ �̸� : colnames(������)  # character vector
colnames(student)

### (5) ����(dimension) : ��, ��                    # vector
### dim(������) 
dim(student)
dim(student)[1]             # nrow
dim(student)[2]             # ncol

### (6) ������ �̸� : ���� �̸�, ���� �̸�          # List
dimnames(student)           # List
dimnames(student)[1]        # List
dimnames(student)[[1]]      # vector      # = rownames
dimnames(student)[[2]]      # vector      # = colnames = �����̸�
dimnames(student)[[2]][3]   # vector      # data�� 3��° ����

### 5. ������(������ ������)�� �����̽�
### ������[��index,��index]

### (1) ��(Column) ���� : ������[ ,index]
student[ , 1]  # id
student[ , 2]  # gender

student[ , c(2,3,6)]
student[ , 4:8]
student[ , seq(from = 2, to = ncol(student), by=2)] # length�� vector����!

student[ , "weight"]
student[ , "height"]

student[ , c("weight","height")]  # :, seq�� numeric����!

student = readxl::read_excel(path = "student.xlsx",
                             sheet = "data",
                             col_names = TRUE)

### �������� Ư���� ������ �ִ� ���� ����
### grep("����",���ڿ�)           # ��� : character vector

colnames(student)

### ���������� 'e'��� ���ڸ� �����ϰ� �ִ� �������� ��ġ
grep("e",colnames(student))               # numeric vector

### ���������� 'e'��� ���ڸ� �����ϰ� �ִ� ������
grep("e",colnames(student), value = TRUE) # character vector

### ������ �߿��� 'e'��� ���ڸ� �����ϰ� �ִ� data
student[ , grep("e",colnames(student), value = TRUE)]


### < ���� ǥ���� >

### ������ �߿��� 'a'��� ���ڷ� �����ϴ� data
student[ , grep("^a",colnames(student), value = TRUE)]

### ������ �߿��� 't'��� ���ڷ� ������ data
student[ , grep("t$",colnames(student), value = TRUE)]

### ������ �߿��� 'a'�յڿ� ���ڰ� �ִ� data
student[ , grep(".a.",colnames(student), value = TRUE)]
student

### ������ �߿��� 'g'�տ� ���ڰ� �ִ� data
student[ , grep(".g",colnames(student), value = TRUE)]

### ��ü�ض�
gsub("[a-Z]","",���ڿ�)

### social network analysis program

### (2) ��
student[1 , ]
student[c(1,3,4) , ]
student[4:10 , ]
student[seq(from = 1, to = nrow(student), by = 3) , ]


### vectorization!! -> for������ ������ �ʾƵ� ��� ����ȴ�

### ������ ������ data
student_female <- student[student$gender == "����", ]
# '='�� ���� ��ü��!(����!!!)

### �������� ������ �ƴ� data
student[student$address != "����", ]

### �����԰� 50������ data
student[student$weight <= 50 , ]

### ���̰� 30�� �̻��̰� Ű�� 175 �̻��� data
student[(student$age >= 30) & (student$height >= 175) , ]

### ���̰� 30�� �̻��̰ų� Ű�� 175 �̻��� data
student[(student$age >= 30) | (student$height >= 175) , ]

### &&�� &�� ����
X = 1:3 ; Y = 4:6
(X > 2) && (Y > 3)  # FALSE             # vector�� ù��° �׸� ��
(X > 2) & (Y > 3)   # FALSE FALSE TRUE  # vector�� ��� ���� ��


### (3) ��� ��
student[4:10 , c("weight","height")]


# Ű�� 170�̻��̰� �����԰� 60�̻��� ����� data ��, �������� e�� �� data
student[(student$height >= 170) & (student$weight >= 60) ,
        grep("e",colnames(student), value = TRUE)]

### 6. ���ο� ���� �����
### ������$������ = ����(����)

student$bmi = student$weight / ((student$height/100)^2)

student
### ifelse(���ǹ�, ���϶� ǥ����, �����϶� ǥ����)
student$age.group = ifelse(student$age >= 30 , "30�� �̻�", "20�� ����")

student$age.group2 = ifelse(student$age >= 30 , "30�� �̻�",
                            ifelse(student$age >= 25, "20�� �߹�", "20�� �ʹ�"))

### cut(�����͸�$������, breaks = ��������)
student$bmi.group3 = cut(student$bmi,
                         breaks = c(0, 18.5, 23, 25, 30),
                         # c��ſ� :,seq�� ����
                         right = FALSE) 
# �̻� ~ �̸� (default : �ʰ� ~ ����)
# �Ұ�ȣ ���� �ִ� ���ڴ� ����X
# �߰�ȣ ���� �ִ� ���ڴ� ����O

# () "�Ұ�ȣ" : �켱����
# {} "�߰�ȣ" : for, if, ����� �Լ� ��
# [] "���ȣ" : �����̽�

# debugging : ������ ������ ã�Ƴ��� ��

score = readxl::read_excel(path = "score.xlsx",
                           sheet = 1,
                           col_names = TRUE)
str(score)
View(score)
score

score$avg = rowMeans(score[ , 2:6]) # �� �ະ�� ��ձ��ϱ�


### 7. ������ ���� �����ϱ�

home = readxl::read_excel(path = "home.xlsx",
                          sheet = 1,
                          col_names = TRUE)
str(home)
View(home)

home[home$price == 500, "price"] = 50
home[home$price == 50, "price"] = NA    # �̻��� �����͸� NA�� ���� �۾�

### 8. ������ ����

### (1) ���� ���� : sort(����, decreasing = )
money = c(45, 50, 40, 50, 50, 30, 500)
money
sort(money, decreasing = FALSE)   # �������� # default
sort(money, decreasing = TRUE)    # ��������

### (2) data.frame ���� : order(�����͸�$������, decreasing = )
order(money)         # 6 3 1 2 4 5 7 (��data�� ��ġ�� �����´�!)
# �����ϸ� ��data�� index�� ���� 6 3 1..�� �ְ� �´�
money[order(money)]  # sort �Ϸ�

student[order(student$height) , ]
student[order(student$height, decreasing = TRUE) , ] # ��������

student[order(student$height, student$weight) , ]

student[order(student$gender, -student$height) , ]  # ���ڿ��� -�� ���ϼ��ִ�

# ���� ��������, Ű ��������
student[order(student$gender, -student$height, decreasing = TRUE)  , ]

# ���� ��������, ������ ��������
# �⺻��ɿ����� ����! data.table package ��ġ (������)

student = readxl::read_excel(path = "student.xlsx",
                             sheet = "data",
                             col_names = TRUE)

student
str(student)
is.data.frame(student)      # TRUE
is.data.table(student)      # FALSE

studentDT = as.data.table(student)
studentDT
str(studentDT)
is.data.table(studentDT)    # TRUE
is.data.frame(studentDT)    # TRUE

studentDT[order(gender, -address) , ]


### �ð��� �󸶳� �ҿ�Ǵ����� �˷��ִ� �Լ�
### system.time(�۾�)

letters                   # "a" "b" ... "z"
sample(letters, size = 5) # 5�� random ����

sample(letters, size = 1000000, replace = TRUE) # replace : ��������


################################################
### data.frame�� data.table�� �������� �����ϱ�

DataFrame = data.frame(id = 1:100, 
                       type = sample(letters, size = 100, replace = TRUE))
typeof(DataFrame)               # List
DataFrame[id == 100, "type"]    # �ȵȴ�!
DFF <- DataFrame[DataFrame$id == 100, "type"]    # �ȴ�!  typeof = integer (?)

str(DataFrame)
str(DataFrame2)
str(DataTable)

DataFrame2 = as.data.table(DataFrame)
typeof(DataFrame2)              # List
DataFrame2[id == 100, "type"]   # ��� �ȴ�!

DataTable = data.table(id = 1:100,
                       type = sample(letters, size = 100, replace = TRUE))
typeof(DataTable)               # List
DataTable[id == 100, "type"]    # ��� �ȴ�!

################################################

# ��� ���� 1000000��
DF = data.frame(id   = 1:1000000,
                type = sample(letters, size = 1000000, replace = TRUE))

DT1 = data.table(id   = 1:1000000,
                 type = sample(letters, size = 1000000, replace = TRUE))

DT = as.data.table(DF)

DF[DF$type == "a" , ]

system.time(x =  DF[DF$type == "a" , ])   # error
system.time(x <- DF[DF$type == "a" , ])   # �̰� �´� ���!

# ���� ����
data.table::setkey(DT, type) # hash table ���� ã����. ���� ���� �˰�������.
system.time(x <- DT[J("a"), ])

system.time(x <- DT[J(c("a","c")), ])

### �����͸� �ٷ궧 -> data.frame -> data.table �� �ٲ�����Ѵ�!!

### data.table::setkey(), J(), fread(), datatable()

student[student$gender == "����", ]

### ���� �����ִ� ��� : DT Package
DT::datatable(student[student$gender == "����", ]) # Viewer



### 9. ������ ��ġ��

### (1) rbind(������1, ������2)
### �� �Ʒ� ��ġ�� (������ ������ ���ƾ���)

df1 = data.frame(id = 1:3,
                 age = 10:12,
                 gender = c("F","F","M"))

df2 = data.frame(id = 4:5,
                 age = c(20,30),
                 gender = c("M","M"))

df1; df2

df3 = rbind(df1, df2)
df3

### (2) merge(������1, ������2, by = ) ��
### ����, ������ ��ġ��

df4 = data.frame(id  = c(1,2,4,7),
                 age = c(10, 20, 40, 70))

df5 = data.frame(id     = c(1,2,3,6,10),
                 gender = c("M","M","F","M","F"))

df4; df5

## < merge�� 4���� ��� >

## 1) inner join      : merge(������1, ������2)   # �� 2���� data�� ����

##  �� data�� primary key�� ��ġ�ϴ� �͸� ��ħ

##  A = {1,2,4,7}
##  B = {1,2,3,6,10}
##  A�� B�� ������ = {1,2}

merge(df4, df5)
merge(df4, df5, by = "id")  # primary key�� �ټ��϶��� c(" "," ")

## 2) outer join

##    2.1) full join  : merge(������1, ������2, by = "", all = TRUE)

##        A = {1,2,4,7}
##        B = {1,2,3,6,10}
##        A�� B�� ������ = {1,2,3,4,6,7,10}

# ���� ���� : NA / ���� ���� : <NA>

merge(df4, df5, by = "id", all = TRUE)

##    2.2) left join  : merge(������1, ������2, by = "", all.x = TRUE)

##        ���� data�� �ش��ϴ� primary key�� ���ؼ���

merge(df4, df5, by = "id", all.x = TRUE)

##    2.3) right join  : merge(������1, ������2, by = "", all.y = TRUE)

##        ���� data�� �ش��ϴ� primary key�� ���ؼ���

merge(df4, df5, by = "id", all.y = TRUE)


### 10. R ������ �����ϱ�
### (1) �ܺ� �����ͷ� �����ϱ�
###  write.csv(R������, file = "������ġ/���ϸ�.csv")

### ���� �����͸� vector �����̳� ���� ���� �״�� ���尡��

write.csv(student,
          file = "student.csv",
          row.names = FALSE)    # �̹������� ������

write.table() # Ȯ���� : .txt

### (2) R �����ͷ� �����ϱ�
###  save(R������, file = "������ġ/���ϸ�.RData")

# R ������ �ַ� 2���� (.R : R script/ .RData : ���� R ����)

save(student, file = "student.RData")

rm(student)
student

### (3) R ������ �ҷ�����
###  load(file = "������ġ/���ϸ�.RData)

load(file = "student.RData")

student
