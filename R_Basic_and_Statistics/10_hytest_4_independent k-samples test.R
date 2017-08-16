############################################################
### 수업내용 : 독립 k표본 검정(Independent k-samples test)
### 작성자 : yunju hwang
### 작성일자 : 2017.07.31 (월)
############################################################

# 결과는 소수점 셋째까지 표현해주는 것에 관례이다!
#  0.000, 0.048 (반올림해서)

# 세개 이상의 모집단의 평균이 다른지를 통계적으로 검정하는 방법

# 귀무가설 : 살충제의 종류(6가지)에 따라 살충 효과는 없다. (mu1 = mu2 = mu3 = .. = mu6)
# 대립가설 : 살충제의 종류(6가지)에 따라 살충 효과가 있다. (not H0)

# 예제 데이터 : InsectSprays
#      변수명 : spray, count
InsectSprays$spray # 살충제 종류
InsectSprays$count # 몇마리가 죽었는지

# 정규성 검정
  # 귀무가설 : 정규성을 따른다.
  # 대립가설 : 정규성을 따르지 않는다.
by(InsectSprays$count, InsectSprays$spray, shapiro.test)

  # spray C,D : 정규성을 만족하지 않음
  #   -> 한개라도 정규성을 만족하지 않으면 전부다 Kruskal-Wallis 방법으로 해야
  # 정규성 가정이 깨짐

# 2단계 : Kruskal-Wallis test
  # kruskal.test(데이터명$변수명 ~ 데이터명$변수명)
  # kruskal.test(양적 자료 ~ 질적 자료)
kruskal.test(InsectSprays$count ~ InsectSprays$spray)

# 결론 : 유의확률이 0.000이므로 유의수준 0.05에서 살충제의 종류에 따라 통계적으로 유의한 살충효과가 있는 것으로 나타났다. (대립가설 채택)

# But, 누구와 차이가 있는지 모름! -> 이것을 알기 위해서 두개 두개씩 비교하는 다중비교를 실행함

# 3단계 : 다중비교 (Multiple Comparisons)
#       = 사후분석 (Post-Hoc)

# non-parametric comparison : 비모수에서 다중비교를 지원해주는 package
install.packages("nparcomp") 
library(nparcomp)

# nparcomp::nparcomp(양적자료 변수명 ~ 질적자료 변수명, type = "Tukey", data = 데이터명)
    # type = c("Tukey", "Dunnett" ->연구자들이 자주사용, "Sequen", "Williams", "Changepoint", "AVE", "McDermott", "Marcus", "UmbrellaWilliams", "UserDefined")
nparcomp::nparcomp(count ~ spray, type = "Tukey", data = InsectSprays)

# 차이가 없다 (A,B) ...
# 차이가 있다 (A,c) ...


### 만약, 정규성 가정이 만족되었다면

# 2단계 : 분산분석(ANOVA : Analysis of Variance)
# 분산분석결과 = aov(변수명 ~ 변수명, data = 데이터명)
# summary(분산분석결과) -> generic function

anova.result = aov(count ~ spray, data = InsectSprays)
summary(anova.result)

#             Df Sum Sq Mean Sq F value              Pr(>F)    
# spray        5   2669   533.8    34.7 <0.0000000000000002 ***
# Residuals   66   1015    15.4                                

# SSB = 2669,  SSE = 1015,  SST = 2669 + 1015
# df1 = k-1 = 6-1 = 5,  df2 = n-k = 72-6 = 66
# MSB = 2669/5  = 533.8
# MSE = 1015/66 = 15.4
# F = MSB/MSE = 533.8/15.4 = 34.7

# 결론 : 대립가설을 채택한다.



### 만약, 정규성 가정이 만족되고 집단 간에 차이가 있다고 결론이 나면

# 3단계 : 다중비교 = 사후비교

# TukeyHSD(분산분석결과)
TukeyHSD(anova.result)   # C보다 A 살충제가 효과가 좋다!







### 카이제곱분포 X^2

# H0 : 경제수준에 따른 용돈의 차이가 없다
# H1 : 경제수준에 따른 용돈의 차이가 있다

# 하 중 중 중 상 중 중 중 상 상 중 하
# 50 40 60 50 30 70 40 40 30 70 40 50

# 30  30  40  40  40  40  50  50  50  60  70  70
# 1.5 1.5 4.5 4.5 4.5 4.5 

# <평균순위합>
# 하 : 8+8=16 -> 16/2=8
# 중 : 4.5*   7
# 상 : 5

# 기대값    관측값   관측값-기대값   (관측값-기대값)^2 / 기대값
# 하 : 6.3    8        8 - 6.3
# 중 : 6.3    7        7 - 6.3
# 상 : 6.3    5        5 - 6.3
#                                        -> 합계 : 카이제곱

# 기대값과 관측값 사이에 차이가 거의 없을 경우 귀무가설 채택





