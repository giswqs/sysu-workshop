
df <- read.csv("data/AlbumSales1.csv",header = TRUE)
plot(df)

m <- lm(df$sales ~ df$adverts)
m
m <- lm(sales ~ adverts, data = df)
summary(m)
abline(m,col="red",lwd=2)
attributes(m)
plot(m)


df <- cars
plot(df)
x <- cars$speed
y <- cars$dist
plot(y ~ x)
m <- lm(y~x)
summary(m)

abline(m,col="red",lwd=2)
segments(x,fitted(m),x,y,col="blue",lty = "dashed")

m


lm(y~x,data = dfrm)
m <- lm(dist~speed,data = df)
summary(m)
attributes(m)
plot(m,which = 1)
plot(m)

plot(dist~speed,data = df)
abline(m,col="red",lwd=2)



library(car)
outlier.test(m)

acf(m)

lm(y ~ u + v + w)
anova(m)
coefficients(m)
coef(m)
confint(m)
deviance(m)
effects(m)
fitted(m)
residuals(m)
resid(m)
summary(m)
