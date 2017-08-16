############################################################
### 수업내용 : 반복문, 조건문, 사용자 함수
### 작성자 : yunju hwang
### 작성일자 : 2017.07.20 (목)
############################################################

### 1. 반복문 for

### 동일한 일을 여러번 하거나, 비슷한 일을 여러번 할때
### but, 하지만 R은 vectorization 기능이 있기 때문에 최대한 사용을 줄이기!

student
print(student)    # i와 같은 변수는 못들어감! # 자동 \n # debuging의 방법!

for(i in 1:10){   # 반드시 1:10이 아니어도 됨! 10개만 되면 된다!
  print("Hello, world!")
}

cat("메세지1","메세지2", ... , "메세지k")    # \n이 안된다

for(i in 1:10){
  cat("Hello,", i, "!", "\n")     # carriage return (\n)
}

### 구구단 작성하기
for(i in 2:9){
  cat(
    for(j in 2:9){
      cat(j,"x", i,"=",i*j,"\t")
    } , "\n"
  )
}


### 2. 조건문 if

###   if, if ~ else, if ~ else if ~ else
###   ifelse

###   if(조건문){
###       조건이 참일때 실행문     -> ex) 막대그래프
###   }else문{
###       조건이 거짓일때 실행문   -> ex) 원그래프
###   }

x = c(100,30,60)

# x가 vector일 경우, 첫번째 원소에서만 적용
if(x > 50){       
  cat(x, "이(가) 50보다 큰 수 입니다","\n")
}

for(i in 1:length(x)){
  if(x[i] > 50){
    cat(x[i],"은 50보다 큰 수입니다.","\n")
  }
  else{
    cat(x[i],"은 50보다 작은 수입니다.","\n")
  }
}


### if(조건문1){
###   실행문1
### }else if(조건문2){
###   실행문2
### }else{
###   실행문3
### }

z = 20
if(z > 10){
  print("large")
}else if(z > 5){
  print("medium")
}else{
  print("small")
}


### 3. 사용자 함수
###   함수명 = function(){
###     return 실행문
###   }

hello = function(){
  print("Hello, world!")
  return("안녕")
}

hello()

# return 없을 때 : x
x <- hello()   # 변수에 함수가 저장이 된다! 변수 호출시, 함수 자동호출
x

# return 넣을 때 : y
y <- hello()   # "Hello, world!"
y              # "안녕"


triple = function(x){
  if(is.numeric(x)){
    tmp = 3 * x
    return(tmp)
  }else if(is.character(x)){
    print("숫자가 아닙니다.")
    return(x)
  }
}

triple(10)    # 30
triple("아")  # 아

### 숫자넣어주면 그 구구단 출력
gugudan = function(x){
  if(is.numeric(x)){
    for(i in 2:9){
      cat(x, "X", i,"=",x*i,"\n")
    }
  }else{
    print("숫자를 입력해주세요")
  }
}

gugudan(2)
gugudan(9)
gugudan("나")


### 숫자를 입력하면 그 숫자의 층에 맞는 *탑을 만들기
star = function(x){
  if(is.numeric(x)){
    for(i in 1:x){
      cat( for(j in 1:i){
        cat("*")
      } ,"\n")
    }
  }else{
    print("숫자를 입력해주세요")
  }
}

star(6)
star("1")
