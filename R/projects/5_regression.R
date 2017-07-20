
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


# Multiple Linear Regression Example 
fit <- lm(y ~ x1 + x2 + x3, data=mydata)
summary(fit) # show results

m <- lm(dist~speed+0,data = df)
summary(m)

lm(y~u*v)
y~u*v*w

#y ~ u + v + w + u:v:w


full.model <- lm(y ~ x1 + x2 + x3 + x4)


spent <- c(120,68,35,60,100,91,44,71,89,113)
income <- c(65,35,30,44,80,77,32,39,44,77)
m <- lm(spent~income)
summary(m)
fitted(m)
resid(m)
plot(m)



x <- c(65,35,30,44,80,77,32,39,44,77)
y <- c(120,68,35,60,100,91,44,71,89,113)
plot(x,y)

n <- length(x)
mx <- mean(x)
my <- mean(y)
sx <- sd(x)
sy <- sd(y)

numerator <- sum((x-mx)*(y-my))
numerator
denominator <- sum((x-mx)*(x-mx))
denominator

slope <- numerator / denominator
slope
intercept <- my - slope * mx
intercept

m <- lm(y~x)
summary(m)

MSS <- sum((fitted(m) - my)^2)
MSS
RSS <- sum((y - fitted(m))^2)
RSS
TSS <- RSS + MSS
TSS

df1 <- 1
df2 <- n-2 

msq1 <- MSS / df1
msq2 <- RSS / df2
F.value <- msq1 / msq2 

F.critical <- qf(0.95,df1 = 1,df2 = n-2)

rsq <- MSS / TSS

df <- data.frame(y,x)
