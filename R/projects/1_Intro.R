1+1
1:1000
max(1,3,5)
q()

min(5:1, pi) #-> one number
pmin(5:1, pi) #->  5  numbers

help(max)
?max
example(max)
??max


pi
sqrt(2)
print(pi)
print(matrix(c(1,2,3,4),2,2))

X <- 44

x <- 1
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
c(1:100)
c("a","b","c")
c(TRUE,FALSE,TRUE)


v1 <- c(1,3,5)
v2 <- c(2,4,6)
v3 <- c(v1,v2)
v3

mode(v1)
mode("a")


num <- 1:10010
num
mean(num)
median(num)
sd(num)
var(num)


df <- cars
str(df)
summary(df)
fix(df)


df$speed
plot(df$speed,df$dist)

df$dist

df[1,1]
df[10,2]

df[5,]
df[,2]

df[c(1,3,5,7),]

df[seq(1,50,3),]

seq(from = 1, to = 999,by = 2)
seq(1,999,5)

seq(1,1000,2)
seq(1,1000,length.out = 300)
