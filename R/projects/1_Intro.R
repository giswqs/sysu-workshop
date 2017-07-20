1+1
max(1,3,5)
q()
help(max)
?max
example(max)
??max


pi
sqrt(2)
print(pi)
print(matrix(c(1,2,3,4),2,2))

# To insert the assignment operator <- use the following:
#   
#   Windows/Linux: "Alt" + "-"
# Mac: "Option" + "-"
x <- 3
y <- 4
z <- sqrt(x^2+y^2)
z

x <- "geography"
print(x)

ls()
ls.str()

rm(x)
ls()

c(1,3,5,7)
c("a","b","c")
c(TRUE,FALSE,TRUE)

v1 <- c(1,3,5)
v2 <- c(2,4,6)
v3 <- c(v1,v2)
v3

mode(v1)
mode("a")


num <- 1:10
num
mean(num)
median(num)
sd(num)
var(num)

df <- cars
str(df)
summary(df)
fix(df)

plot(df$speed,df$dist)
