############################################################
### 수업내용 : 상관분석 (Correlation Analysis)
### 작성자 : yunju hwang
### 작성일자 : 2017.07.31 (월)
############################################################

install.packages("DT")
install.packages("psych")
install.packages("Hmisc")

library(DT)
library(psych)
library(Hmisc)

# 언제 : 두개의 양적자료 간의 관련성이 있는지를 통계적으로 검정하는 방법
# 관련성 : 직선의 관계 = 선형의 관계9

# 예제 데이터 : cars
# 변수명      : speed(속도), dist(제동거리) : distance

# 귀무가설 : speed와 dist 간에는 관련성(직선=선형의 관계)이 없다.
# 대립가설 : speed와 dist 간에는 관련성(직선=선형의 관계)이 있다.

# 1단계 : 산점도(Scatter plot)
# plot(데이터명$변수명, 데이터명$변수명)
#   plot(x축에, y축에) -> 더 중요한 변수를 y로 보내자! (x에 따라 y가 어떻게 변하는지)
plot(cars$speed, cars$dist)

# 2단계 : 상관계수(Coefficient of Correlation) = r (-1 < r < 1)
# cor(데이터명$변수명, 데이터명$변수명)
#   cor(x축에, y축에)
cor(cars$speed, cars$dist) # 0.807 

cor(cars$speed, cars$dist)                      # 기본 : Pearson (r)   0.807
cor(cars$speed, cars$dist, method = "kendall")  # Kendall (tau)        0.669  
cor(cars$speed, cars$dist, method = "spearman") # Spearman (rho)       0.830


# < 상관계수 해석의 가이드 >
# 0.0 이상 ~ 0.2 미만 : 관련성이 없음
# 0.2 이상 ~ 0.4 미만 : 약한 관련성이 있음
# 0.4 이상 ~ 0.6 미만 : 보통의 곤련성이 있음
# 0.6 이상 ~ 0.8 미만 : 높은 관련성이 있음
# 0.8 이상 ~ 1.0 이하 : 매우 높은 관련성이 있음

# 3단계 : 상관분석
# cor.test(데이터명$변수명, 데이터명$변수명)
cor.test(cars$speed, cars$dist)
  # t = 0.807 / sqrt((1-0.807^2)/48)

cor.test(cars$speed, cars$dist)                      # 기본 : Pearson (r) 
cor.test(cars$speed, cars$dist, method = "kendall")  # Kendall (tau)     
cor.test(cars$speed, cars$dist, method = "spearman") # Spearman (rho) 

# 결론 : 스피드와 제동거리 간에 통계적으로 유의한 양의 상관관계를 보인다. 그 정도는 매우 높다. (대립가설 채택)




### 

# 예제 데이터 : attitude
View(attitude)
str(attitude)

# 1단계 : 산점행렬도, 행렬산점도
# Scatter plot matrix, matrix scatter plot
# plot(데이터명[ , index]) # 모든 변수가 양적자료일때 plot(데이터명)
plot(attitude)



# 2단계 : 상관계수 행렬, 행렬 상관계수
# cor(데이터명[ , index])
cor(attitude)
round(cor(attitude), digits = 3)

library(DT)
DT::datatable(round(cor(attitude), digits = 3)) # 표로 보기(보고서쓸때 엑셀에 복사)



# 3단계 : 상관분석
cor.test(attitude)  # 안된다! 

  # 방법1 )
library(psych)
# psych::corr.test(데이터명[ , index])
psych::corr.test(attitude)

  # 방법2 )
library(Hmisc)
# Hmisc::rcorr(as.matrix(데이터명[ , index]))
  # matrix의 형식 : 한가지의 데이터 유형만 갖는다
Hmisc::rcorr(as.matrix(attitude))
