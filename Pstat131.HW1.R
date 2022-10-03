install.packages("tidyverse")
install.packages("tidymodels")
install.packages("ISLR")
library(tidyverse)
library(tidymodels)
library(ISLR)
library(ggplot2)

# Machine Learning Main Ideas
#1 Supervised learning is learning with supervior and you can see the answer key,
# but Unsupervised learning is learning without supervior and you can not see the answer key(from lecture note)

#2 The Y og regression model is quantitative, but the Y of classification qualitative.
# The test of regression model is for mean squared error(MSE), but the test of classification is for error rate.

#3 metrics for regression ML problems-Mean Squared Error (MSE) & Mean Absolute Error (MAE)
# metrics for classification ML problems-Accuracy, log-loss

#4 Descriptive models:Choose model to best visually emphasize a trend in data
# PREDICTIVE:Aim is to predict Y with minimum reducible error & Not focused on hypothesis tests 
# INFERENTIAL:Aim is to test theories & (Possibly) causal claims & State relationship between outcome & predictor(s)
#(From lecture note)

#5
#i) mechanistic - Assume a parametric form for f
# &Won’t match true unknown f
# &Can add parameters = more flexibility
# &Too many = overfitting
# empirically-driven- No assumptions about f 
# & Require a larger # of observations 
# & Much more flexible by default 
# & Overfitting

#ii) I think empirically-driven model is easier to understand because we can easily make a prediction out of that, but not mechanistic model.

#iii)Bias and variance are complements to each other. The increase of one will result in the decrease of the other and vice versa. 
# Therefore, finding the right balance of values is known as the Bias Variance Tradeoff. An ideal algorithm never underfit or overfit the data.

#6
#i) predictive because it is the event about the future.
#ii) inferential because the theory is built around implicit analysis supported by data.

# Exploratory Data Analysis
#1
hist(mpg$hwy)
# More cars are between 25-30 mpg, while less cars are between 35-40.
#2
plot(mpg$hwy, mpg$cty)
# It is linear, so if hwy is being higher, cty will be higer too, if hwy is being lower, then cty will be lower too. 
#3
barplot(mpg$manufacturer)
mpg_sum <- mpg %>% 
  dplyr::mutate(
    manufacturer = stringr::str_to_title(manufacturer),
    manufacturer = forcats::fct_lump(manufacturer, n = 10)
  ) %>% 
  dplyr::count(manufacturer, sort = TRUE) %>% 
  dplyr::mutate(
    manufacturer = forcats::fct_rev(forcats::fct_inorder(manufacturer)),
    manufacturer = forcats::fct_relevel(manufacturer, "Other", after = 0)
  )

ggplot(mpg_sum, aes(x = n, y = manufacturer)) +
  geom_col(fill = "gray") +
  theme_minimal()
# According to the bar plot, Dodge produced the most cars, Honda produced the least car. 
# However, I think the manufacturer that produced the least cars is in the "Other".

#4
boxplot(hwy ~ cyl, data = mpg)
# The more cylinder the car has, the more gas it will use.

#5
install.packages("corrplot")
head(mpg)
M<-cor(mpg)
head(round(M,2)) 
corrplot(M, type="lower")

# cyl and cty or hwy are positively correlated because the more the cylinder, the higer gas it will use on highway or city.
# I think it makes sense to me, so nothing really suprised me.


