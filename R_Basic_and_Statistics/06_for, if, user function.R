############################################################
### �������� : �ݺ���, ���ǹ�, ����� �Լ�
### �ۼ��� : yunju hwang
### �ۼ����� : 2017.07.20 (��)
############################################################

### 1. �ݺ��� for

### ������ ���� ������ �ϰų�, ����� ���� ������ �Ҷ�
### but, ������ R�� vectorization ����� �ֱ� ������ �ִ��� ����� ���̱�!

student
print(student)    # i�� ���� ������ ����! # �ڵ� \n # debuging�� ���!

for(i in 1:10){   # �ݵ�� 1:10�� �ƴϾ ��! 10���� �Ǹ� �ȴ�!
  print("Hello, world!")
}

cat("�޼���1","�޼���2", ... , "�޼���k")    # \n�� �ȵȴ�

for(i in 1:10){
  cat("Hello,", i, "!", "\n")     # carriage return (\n)
}

### ������ �ۼ��ϱ�
for(i in 2:9){
  cat(
    for(j in 2:9){
      cat(j,"x", i,"=",i*j,"\t")
    } , "\n"
  )
}


### 2. ���ǹ� if

###   if, if ~ else, if ~ else if ~ else
###   ifelse

###   if(���ǹ�){
###       ������ ���϶� ���๮     -> ex) ����׷���
###   }else��{
###       ������ �����϶� ���๮   -> ex) ���׷���
###   }

x = c(100,30,60)

# x�� vector�� ���, ù��° ���ҿ����� ����
if(x > 50){       
  cat(x, "��(��) 50���� ū �� �Դϴ�","\n")
}

for(i in 1:length(x)){
  if(x[i] > 50){
    cat(x[i],"�� 50���� ū ���Դϴ�.","\n")
  }
  else{
    cat(x[i],"�� 50���� ���� ���Դϴ�.","\n")
  }
}


### if(���ǹ�1){
###   ���๮1
### }else if(���ǹ�2){
###   ���๮2
### }else{
###   ���๮3
### }

z = 20
if(z > 10){
  print("large")
}else if(z > 5){
  print("medium")
}else{
  print("small")
}


### 3. ����� �Լ�
###   �Լ��� = function(){
###     return ���๮
###   }

hello = function(){
  print("Hello, world!")
  return("�ȳ�")
}

hello()

# return ���� �� : x
x <- hello()   # ������ �Լ��� ������ �ȴ�! ���� ȣ���, �Լ� �ڵ�ȣ��
x

# return ���� �� : y
y <- hello()   # "Hello, world!"
y              # "�ȳ�"


triple = function(x){
  if(is.numeric(x)){
    tmp = 3 * x
    return(tmp)
  }else if(is.character(x)){
    print("���ڰ� �ƴմϴ�.")
    return(x)
  }
}

triple(10)    # 30
triple("��")  # ��

### ���ڳ־��ָ� �� ������ ���
gugudan = function(x){
  if(is.numeric(x)){
    for(i in 2:9){
      cat(x, "X", i,"=",x*i,"\n")
    }
  }else{
    print("���ڸ� �Է����ּ���")
  }
}

gugudan(2)
gugudan(9)
gugudan("��")


### ���ڸ� �Է��ϸ� �� ������ ���� �´� *ž�� �����
star = function(x){
  if(is.numeric(x)){
    for(i in 1:x){
      cat( for(j in 1:i){
        cat("*")
      } ,"\n")
    }
  }else{
    print("���ڸ� �Է����ּ���")
  }
}

star(6)
star("1")