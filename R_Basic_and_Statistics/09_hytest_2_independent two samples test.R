############################################################
### 수업내용 : 독립 2표본 검정 (Independent two samples test)
### 작성자 : yunju hwang
### 작성일자 : 2017.07.31 (월)
############################################################

# 두 모집단의 평균이 어느 한쪽이 큰지, 작은지, 같지 않은지를 통계적으로 검정하는 방법

# 귀무가설 : 성별에 따라 용돈의 차이가 없다 (mu1  = mu2)
# 대립가설 : 성별에 따라 용돈의 차이가 있다 (mu1 != mu2)


id = 1:13
gender = c("m","f","f","f","m","m","m","f","m","m","m","m","m")
money = c(30, 50, 50, 60, 70, 30, 70, 40, 50, 70, 60, 40, 50)
st2 = data.frame(id, gender, money)
View(st2)

# 1단계 : 각 집단별 정규성 검정
  # by(데이터명$변수명, 데이터명$변수명, shapiro.test)
  # by(양적 자료, 질적 자료, shapiro.test)
by(st2$money, st2$gender, shapiro.test)
  # 결론 : 정규성 가정을 만족한다

# 2단계 : 등분산성 검정(Equality of Variance Test)
  # 귀무가설 : 등분산이다. (여자집단의 용돈의 분산과 남자집단의 용돈의 분산은 같다.)
  # 대립가설 : 이분산이다.

  # var.test(데이터명$변수명 ~ 데이터명$변수명)
  # var.test(양적 자료 ~ 질적 자료)
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

# 결론 : 등분산이다.

# 3단계 : 등분산이 가정된 독립 2표본 T검정
# t.test(데이터명$변수명 ~ 데이터명$변수명, alternative = , var.equal = TRUE)
                                                            # 등분산
                                                            # 이분산인 경우 : var.equal = FALSE
t.test(st2$money ~ st2$gender, alternative = "two.sided", var.equal = TRUE)

# 결론 : 유의 확률이 0.805이므로 유의수준 0.05에서 "성별에 따라 용돈에 차이가 없다"는 귀무가설을 기각할 수 없다.
# 성별에 따라 용돈에 통계적으로 유의한 차이는 없는 것으로 나타났다.


# 만약, 정규성 가정이 만족되고 이분산이라면,
# t.test(데이터명$변수명 ~ 데이터명$변수명, alternative = , var.equal = FALSE)
t.test(st2$money ~ st2$gender, alternative = "two.sided", var.equal = FALSE)

t.result = t.test(st2$money ~ st2$gender, alternative = "two.sided", var.equal = FALSE)
str(t.result)

# 모든 변수들 중에서 유의한 변수들만 뽑아내기!
#   -> money부분을 바꾸고 gender부분은 바꾸지 말고 for문을 돌려서, if p-value값<0.05면 뽑아내기


# 만약, 정규성 가정을 만족하지 않는다면,
# 2단계 : 윌콕슨의 순위합 검정(Wilcoxon's rank sum test)
# wilcox.test(데이터명$변수명 ~ 데이터명$변수명, alternative = )
wilcox.test(st2$money ~ st2$gender, alternative = "two.sided")

# 결론 : 귀무가설을 채택한다


# Wilcoxon's rank sum test (W통계량)  -> R은 이것을 채택
#      = Mann-Whitney test (U통계량)

