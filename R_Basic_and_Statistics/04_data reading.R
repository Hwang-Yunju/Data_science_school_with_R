############################################################
### �������� : �ܺ� ������ �о����
### �ۼ��� : yunju hwang
### �ۼ����� : 2017.07.18
############################################################

### �ܺ� ������ : txt, csv, excel(xls, xlsx)
### �ܺ� �����͸� �������� data.frame �̴�!!

### 1. �ؽ�Ʈ ������ : txt
### excel�� 104������ �ٷ� �� �ִ� �ݸ�, txt�� �� ���� �����͸� �ٷ� �� �ִ�
### txt���� �����Ҷ�, �� �������� enterġ��! �׷��� warning mesage�� �ȳ���

### (1) ������(Separator) : ���� �ϳ�(blank, white space)
### �����͸� = read.table(file   = "������ġ/���ϸ�.txt",
###                       header = TRUE,
###                       seq    = " ")

hope = read.table(file   = "C:/R/hope.txt",
                  header = TRUE,  # file�� �ִ� �������� �״�� ���ڴ�
                                  # = False : v1, v2, v3 (value) �������� ���ڴ�
                  sep    = " ")
hope

### (2) ������(Separator) : ,(comma)
### �����͸� = read.table(file   = "������ġ/���ϸ�.txt",
###                       header = TRUE,
###                       seq    = ",")
reading = read.table(file   = "C:/R/reading.txt",
                     header = TRUE,
                     sep    = ",")
reading

### (3) ������(Separator) : ��(tab)
### �����͸� = read.table(file   = "������ġ/���ϸ�.txt",
###                       header = TRUE,
###                       seq    = "\t")
body = read.table(file   = "C:/R/body.txt",
                  header = TRUE,
                  sep    = "\t")
body


### 2. CSV(Comma Separated Value)
###  excel�� Ư���� ����
###  �����͸� = read.csv((file  = "������ġ/���ϸ�.csv",
###                      header = TRUE)


wish = read.csv(file   = "C:/R/wish.csv",
                header = TRUE)
wish


### 3. EXCEL : xls, xlsx
### R�� �⺻ ��ɿ����� �� �о�� ��
###  -> Package�� �߰��� ��ġ�ؾ���

### Package�� : readxl
### Package ��ġ�ϱ� : install.packages("Pachage��")
  # Internet�� ������������
  # ��ǻ�� �ϳ��� Package�� �ѹ��� ��ġ�ϸ��!

### Package error �ȳ��� �ϱ� ���� ȯ�漳���ϱ�
options(repos = "https://cran.rstudio.com")

### Package ��ġ
install.packages("readxl")

### Package loading = Package �����ϱ� : R�� Package�� �����ϴ� ���
  # ������ �� ������ ������ �� �ܰ���� �������ָ餧
library(readxl)

### " Package��::function�̸� " �ڲ� �̷��� ������ ����ϱ�
### �����͸� = readxl::read_excel(path = "������ġ/���ϸ�.",
###                               sheet = index or "��Ʈ��",
###                               col_names = TRUE)

time2 = readxl::read_excel(path = "C:/R/time.xlsx",
                           sheet = 1,
                           col_names = TRUE)
time2


