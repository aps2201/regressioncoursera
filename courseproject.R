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

lm(mpg ~ am, data=mtcars)

