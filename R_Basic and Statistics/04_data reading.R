############################################################
### 수업내용 : 외부 데이터 읽어오기
### 작성자 : yunju hwang
### 작성일자 : 2017.07.18
############################################################

### 외부 데이터 : txt, csv, excel(xls, xlsx)
### 외부 데이터를 가져오면 data.frame 이다!!

### 1. 텍스트 데이터 : txt
### excel은 104만개만 다룰 수 있는 반면, txt는 더 많은 데이터를 다룰 수 있다
### txt파일 저장할때, 맨 마지막에 enter치기! 그래야 warning mesage가 안나옴

### (1) 구분자(Separator) : 공백 하나(blank, white space)
### 데이터명 = read.table(file   = "파일위치/파일명.txt",
###                       header = TRUE,
###                       seq    = " ")

hope = read.table(file   = "C:/R/hope.txt",
                  header = TRUE,  # file에 있는 변수명을 그대로 쓰겠다
                                  # = False : v1, v2, v3 (value) 변수명을 쓰겠다
                  sep    = " ")
hope

### (2) 구분자(Separator) : ,(comma)
### 데이터명 = read.table(file   = "파일위치/파일명.txt",
###                       header = TRUE,
###                       seq    = ",")
reading = read.table(file   = "C:/R/reading.txt",
                     header = TRUE,
                     sep    = ",")
reading

### (3) 구분자(Separator) : 탭(tab)
### 데이터명 = read.table(file   = "파일위치/파일명.txt",
###                       header = TRUE,
###                       seq    = "\t")
body = read.table(file   = "C:/R/body.txt",
                  header = TRUE,
                  sep    = "\t")
body


### 2. CSV(Comma Separated Value)
###  excel의 특수한 형태
###  데이터명 = read.csv((file  = "파일위치/파일명.csv",
###                      header = TRUE)


wish = read.csv(file   = "C:/R/wish.csv",
                header = TRUE)
wish


### 3. EXCEL : xls, xlsx
### R의 기본 기능에서는 못 읽어옴 ★
###  -> Package를 추가로 설치해야함

### Package명 : readxl
### Package 설치하기 : install.packages("Pachage명")
  # Internet만 연결되있으면됨
  # 컴퓨터 하나당 Package는 한번만 설치하면됨!

### Package error 안나게 하기 위해 환경설정하기
options(repos = "https://cran.rstudio.com")

### Package 설치
install.packages("readxl")

### Package loading = Package 구동하기 : R과 Package를 연결하는 기능
  # 다음에 또 실행할 때에는 이 단계부터 실행해주면ㄷ
library(readxl)

### " Package명::function이름 " 자꾸 이렇게 쓰려고 노력하기
### 데이터명 = readxl::read_excel(path = "파일위치/파일명.",
###                               sheet = index or "시트명",
###                               col_names = TRUE)

time2 = readxl::read_excel(path = "C:/R/time.xlsx",
                           sheet = 1,
                           col_names = TRUE)
time2



