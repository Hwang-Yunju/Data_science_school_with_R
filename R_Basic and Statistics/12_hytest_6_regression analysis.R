############################################################
### 수업내용 : 회귀분석 (regression analysis)
### 작성자 : yunju hwang
### 작성일자 : 2017.08.07 (월)
############################################################

install.packages("car")
install.packages("lm.beta")
library(car)
library(lm.beta)

# ------------------
Anaconda
# Anaconda가 설치된 상태에서 RStudio나 RGui에서 아래의 명령어를 실행한다.
1.
install.packages(c("pbdZMQ","repr","devtools"))
2. 
install.packages("stringr")
3.
devtools::install_github("IRkernel/IRkernel")
4.
IRkernel::installspec()
# #
# 회귀모형, AIC, BIC(베이지안)
# AIC, BIC의 값이 가장 작은 것, adjusted R^2값이 가장 큰 것을 선택!
#
# 질적자료 1개 : 표, 그래프(막대, 원그래프)
# 양적자료 1개 : 표, 그래프(히스토그램, 상자그림), 기술통계량
# 
# 가설검정
# 양적자료 1개 : 일표본 검정
#                - one sample t-test
#                - Wicoxon's signed rank test
# 양적자료 1개 & 질적자료 1개 (값이 2가지인 경우) : 독립 2표본 검정
#                                              - 독림 2표본 T검정
#                                              - Wilcoxon's rank sum test = Mann-Whitney U test
# 양적자료 1개 & 양적자료 1개 : 동일한 대상자에게 사전의 양적 자료, 사후의 양적 자료
# 동일한 대상자에게 x의 양적자료, y의 양적자료 : 대응 2표본 검정
#                                              - 대응 2표본 T검정
#                                              - Wilcoxon's signedrank test
# 양적자료 1개, 질적자료 1개(값이 3개 이상으로 이루어짐)
#                                              - 분산분석
#                                              - Kruskal-Wallis rank sum test
# 양적자료 1개 & 양적자료 1개 : 관련성
#                 - 상관분석
# 질적자료 1개 & 질적자료 1개 : 관련성
#                 - 교차분석 = 카이제곱검정 = Chi-Square test 
#                                              (순서/명목형에 따라서 방법이 더욱 세분화됨)
# 양적자료 1개(종속변수), 양적자료 1개(독립변수) : 인과관계
#                                               - 단순선형 회귀분석
# 양적자료 1개(종속변수),
# 양적자료 1개 이상, 질적자료 1개 이상(독립변수) : 인과관계
#                                               - 다중선형 회귀분석
# 값이 2가지인 질적자료 1개(종속변수),
# 양적자료 1개 이상, 질적자료 1개 이상(독립변수)
#                                               - 이분형 로지스틱 회귀분석
#                                                -> sigmoid function 
# 값이 3가지 이상인 질적자료 1개(종속변수),
# 양적자료 1개 이상, 질적자료 1개 이상(독립변수)
#                                               - 다분형 로지스틱 회귀분석
#                                                -> softmax function
# 이외에도..
# 시계열분석, 판별분석, 의사결정나무 ...


# 언제 : 인과관계 (원인과 결과)
#        예측(Prediction), 분류(Classification)

# 종속변수 = 반응변수 ****
# 독립변수 = 설명변수

# 단순선형회귀분석 : 종속변수(양적자료) 1개, 독립변수 1개
# 다중선형회귀분석 : 종속변수(양적자료) 1개, 독립변수 1개

# 1. 단순선형회귀분석
# 예제 데이터 : cars
# 변수명 : speed, dist

# 종속변수 : dist
# 독립변수 : speed

# 회귀모형 : dist = beta0 + beta1 * speed + error

# 회귀분석결과물 = lm(종속변수 ~ 독립변수, data = 데이터명)
# summary(회귀분석 결과물)
cars.lm = lm(dist ~ speed, data = cars)
summary(cars.lm)

# Call:
#   lm(formula = dist ~ speed, data = cars)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -29.069  -9.525  -2.272   9.215  43.201 
# 
# Coefficients:
#           Estimate Std.   Error    t value   Pr(>|t|)    
# (Intercept) -17.5791     6.7584    -2.601     0.0123 *  
#   speed       3.9324     0.4155     9.464   1.49e-12 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 15.38 on 48 degrees of freedom
# Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
# F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12


#  < 회귀분석의 결과를 해석하는 방법 >
# 1단계 : 회귀모형은 통계적으로 타당한가?
  # 귀무가설 : 회귀모형은 타당하지 않다.
  # 대립가설 : 회귀모형은 타당하다.

  # F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12
  # 1단계의 결론 : 대립가설(회귀모형은 타당하다)
  
  # 만약, 1단계의 결론이 귀무가설이면 회귀분석은 1단계에서 끝!


# 2단계 : (1단계의 결론이 대립가설일때) 독립변수는 종속변수에게 영향을 주는가?
  # 귀무가설 : 독립변수는 종속변수에게 영향을 주지 않는다.
  # 대립가설 : 독립변수는 종속변수에게 영향을 준다.

  #           Estimate Std.   Error    t value   Pr(>|t|)    
  #   speed       3.9324     0.4155      9.464   1.49e-12 ***
  # 2단계의 결론 : 유의확률이 0.000이므로 유의수준 0.05에서 독립변수는 종속변수에게 (통계적으로 유의한) 영향을 준다.


# 3단계 : 독립변수는 종속변수에 어떠한 영향을 주는가?
  #           Estimate Std.
  #   speed       3.9324

  # 독립변수의 회귀계수(coefficient of Regression) : 3.932
  # speed가 1mph(시간당 1마일) 증가하면 dist는 약 3.932 feet 증가한다. (단위 꼭 적어주기)


# 4단계 : 예측(Prediction)
  # dist = -17.5791 + 3.9324 * speed
  # predict(회귀분석결과, newdata = data.frame(speed = ))  # 여러개면 c()
predict(cars.lm, newdata = data.frame(speed = 200), interval = "predict") # 점추정?

# 5단계 : 회귀모형의 설명령 = 독립변수의 설명력
  # R-squared = 설명계수
  # Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
  # 0.651 * 100 = 65.1%
  # speed가 dist의 다름을 약 65.1% 설명한다.





# 2. 다중선형 회귀문석
# 종속변수 1개      : 양적 자료
# 독립변수 2개 이상 : 양적 자료, 질적 자료
                        # factor면 더미변수해주지 않아도된다
                            # 기본 : 처음을 기준으로 본다
# 예제 데이터 : attitude
# 종속변수 : rating
# 독립변수 : 6개(양적자료)

# 회귀모형 : rating = beta0 + beta1 * complaints + ... + beta6 * advance + error

# 회귀분석 결과물 = lm(rating ~ complaints + ... + advance, data = 데이터명)
# 회귀분석 결과물 = lm(rating ~ ., data = 데이터명
# summary(회귀분석 결과물)

attitude.lm = lm(rating ~ ., data = attitude)
summary(attitude.lm)

  # Call:
  #   lm(formula = rating ~ ., data = attitude)
  # 
  # Residuals:
  #   Min       1Q   Median       3Q      Max 
  # -10.9418  -4.3555   0.3158   5.5425  11.5990 
  # 
  # Coefficients:
  #         Estimate Std.   Error t   value Pr(>|t|)    
  # (Intercept) 10.78708   11.58926   0.931 0.361634    
  # complaints   0.61319    0.16098   3.809 0.000903 ***
  # privileges  -0.07305    0.13572  -0.538 0.595594    
  # learning     0.32033    0.16852   1.901 0.069925 .  
  # raises       0.08173    0.22148   0.369 0.715480    
  # critical     0.03838    0.14700   0.261 0.796334    
  # advance     -0.21706    0.17821  -1.218 0.235577    
  # ---
  #   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
  # 
  # Residual standard error: 7.068 on 23 degrees of freedom
  # Multiple R-squared:  0.7326,	Adjusted R-squared:  0.6628 
  # F-statistic:  10.5 on 6 and 23 DF,  p-value: 1.24e-05


#  < 회귀분석의 결과를 해석하는 방법 >

# 1단계 : 회귀모형은 통계적으로 타당한가?
  # 귀무가설 : 회귀모형은 타당하지 않다.
  # 대립가설 : 회귀모형은 타당하다.

  # F-statistic:  10.5 on 6 and 23 DF,  p-value: 1.24e-05
  # 1단계의 결론 : 대립가설(회귀모형은 타당하다)


# 2단계 : (1단계의 결론이 대립가설일때) 독립변수 각각은 종속변수에게 영향을 주는가?
  # 귀무가설 : 독립변수는 종속변수에게 영향을 주지 않는다.
  # 대립가설 : 독립변수는 종속변수에게 영향을 준다.
  
  # Coefficients:
  #         Estimate Std.   Error t   value Pr(>|t|)    
  # (Intercept) 10.78708   11.58926   0.931 0.361634    
  # complaints   0.61319    0.16098   3.809 0.000903 ***
  # privileges  -0.07305    0.13572  -0.538 0.595594    
  # learning     0.32033    0.16852   1.901 0.069925 .  
  # raises       0.08173    0.22148   0.369 0.715480    
  # critical     0.03838    0.14700   0.261 0.796334    
  # advance     -0.21706    0.17821  -1.218 0.235577  

  # 2단계의 결론 : 유의확률이 0.000이므로 유의수준 0.05에서 독립변수는 종속변수에게 (통계적으로 유의한) 영향을 준다.


  #  < 변수선택 방법 >  "각각 다 해보고 AIC, BIC가 작고, adjusted R^2가 큰애를 선택"
  # 1. 전진선택법(Forward Selection)    : 관련있는 것을 넣기(들어가면 다시 못나옴)
  # 2. 후진제거법(Backward Elimination) : 다 넣고 관련없는거 제거(나오면 다시 못들어옴)
  # 3. 단계 선택법(Stepwise Selection)  : 나갔던애 다시 들어오고 들어왔던애 다시 나가고
  # 4. 전체 선택

# step(회귀분석 결과물, direction = c("forward", "backward", "both"))
model.forward  = step(attitude.lm, direction = "forward")   # AIC = 123.36
model.backward = step(attitude.lm, direction = "backward")  # AIC = 118
model.stepwise = step(attitude.lm, direction = "both")      # AIC = 118

summary(model.backward)
 # learning은 영향을 안주는데에 포함되었다! 그러면 다시
model.final = lm(rating ~ complaints, data = attitude)
summary(model.final)

# 3단계 : 독립변수는 종속변수에 어떠한 영향을 주는가?
  #             Estimate
  # complaints   0.75461  

# 독립변수의 회귀계수(coefficient of Regression) : 0.755
# complaints가 1점 증가하면 rating은 약 0.755 점 증가한다. (단위 꼭 적어주기)


# 4단계 : 예측(Prediction)
# dist = -17.5791 + 3.9324 * speed
# predict(회귀분석결과, newdata = data.frame(complaints = ))  # 여러개면 c()
predict(cars.lm, newdata = data.frame(complaints = 200), interval = "predict") # 점추정?

# 5단계 : 회귀모형의 설명령 = 독립변수의 설명력
# R-squared = 설명계수
# Multiple R-squared:  0.6813
# 0.6813 * 100 = 68.1%
# complaints가 rating의 다름을 약 68.1% 설명한다.


# 고려해야할점
# 최종 회귀모형에 독립변수가 2개 이상 포함이 되면,
# 1. 회귀계수의 해석
  # 독립변수1은 나머지 독립변수들이 고정되어 있을 때에(통제)
  # 독립변수1의 기본단위가 1 증가하면 종속변수는 약 얼마 증가/감소 한다.

# 2. 다중공선성(Multicollinearity)을 확인
  # 독립변수들 간의 선형의 관계는 없어야 한다.
  # VIF(Varaince Inflation Factor) : 10 이상이면 다중공선성이 존재한다고 판단
  #       -> 독립벼수들 간에 선형의 관계가 존재한다.
  #       -> 이 결과가 나온다면 독립변수들 주에 빼는 것을 검토하기
  # car::vif(회귀분석결과)
library(car)
car::vif(attitude.lm)

# 3. 회귀모형의 설명력 : Adjusted R-Square (그냥 R-Square랑 이거랑 둘다 써줘야한다)
                        # 2개의 독립변수가 있을때 

# 4. 독립변수들의 영향력 크기 비교
  # 표준화된 회귀계수
  # lm.beta::lm.beta(회귀분석 결과물)
library(lm.beta)
lm.beta::lm.beta(attitude.lm)
