library(ggplot2)
library(dplyr)
data("mtcars")
summary(mtcars)

mtcars$vs=as.factor(mtcars$vs)
mtcars$am=as.factor(mtcars$am)
summary(mtcars)

mtcars$vs=sub("0","V",mtcars$vs)
mtcars$vs=sub("1","S",mtcars$vs)

mtcars$am=sub("0","automatic",mtcars$am)
mtcars$am=sub("1","manual",mtcars$am)

mtcars$vs=factor(mtcars$vs,levels=c("V","S"))
mtcars$am=factor(mtcars$am,levels = c("automatic","manual"))

# correlations
mtcars$vs=as.numeric(mtcars$vs)
mtcars$am=as.numeric(mtcars$am)
cor(mtcars)

#plot a/m
amformpg=ggplot(aes(x=am,y=mpg),data=mtcars)+
  geom_boxplot(aes(fill=am))+
  xlab("automatic/manual")
amformpg

# models
lm(mpg ~ am, data=mtcars)

initialmodel <- lm(mpg ~ ., data = mtcars)
bestmodel <- step(initialmodel, direction = "both")
