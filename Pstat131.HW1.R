install.packages("tidyverse")
install.packages("tidymodels")
install.packages("ISLR")
library(tidyverse)
library(tidymodels)
library(ISLR)
x=2+2
print(x)

# Machine Learning Main Ideas
#1 Supervised learning is learning with supervior and you can see the answer key,
# but Unsupervised learning is learning without supervior and you can not see the answer key(from lecture note)
#2 The Y og regression model is quantitative, but the Y of classification qualitative.
# The test of regression model is for mean squared error(MSE), but the test of classification is for error rate.

# Exploratory Data Analysis
#1 
hist(mpg$hwy)
# More cars are between 25-30 mpg, while less cars are between 35-40.
#2
plot(mpg$hwy, mpg$cty)
# It is linear, so if hwy is being higher, cty will be higer too, if hwy is being lower, then cty will be lower too. 
#3
barplot(mpg$manufacturer, hroiz=true)
#4
boxplot(hwy ~ cyl, data = mpg)
# The more cylinder the car has, the more gas it will use.

#5
install.packages("corrplot")
head(mpg)
M<-cor(mpg)
head(round(M,2))
corrplot(M, type="lower")