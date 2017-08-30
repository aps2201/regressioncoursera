library(ggplot2)
library(dplyr)
data("mtcars")

mtcars_factor = mtcars %>%
  mutate(vs = ifelse(vs == "0","V","S"),am = ifelse(am == "0","automatic","manual")) %>%
  mutate(vs = factor(vs,levels=c("V","S")),am = factor(am,levels = c("automatic","manual")))

#plot a/m
amformpg=ggplot(aes(x=am,y=mpg),data=mtcars_factor)+
  geom_boxplot(aes(fill=am))+
  xlab("automatic/manual")

# correlations
mtcars$vs=as.numeric(mtcars$vs)
mtcars$am=as.numeric(mtcars$am)
cor_num = cor(mtcars)


# models
initialmodel = lm(mpg ~ ., data = mtcars)
bestmodel = step(initialmodel, direction = "both")
basemodel = lm(mpg ~ am, data = mtcars)
