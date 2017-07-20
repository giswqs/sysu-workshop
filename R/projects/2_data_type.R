### Geog533 - Lecture W02 - R Programming

x <- 1
print(x)
x
msg <- "Hello World!"


x <- 1:100
x

# R has five basic or “atomic” classes of objects:
# • character
# • numeric (real numbers)
# • integer
# • complex
# • logical (True/False)


#Object name
# Object names cannot contain `strange' symbols like !, +, -, #.
# A dot (.) and an underscore ( ) are allowed, also a name starting with a dot.
# Object names can contain a number but cannot start with a number.
# R is case sensitive, X and x are two different objects, as well as temp and temP.


ls()
x <- 1
y <- 2
x2 <- 45
y2 <- 90
ls(pattern = "x")
rm(x,x2)
rm(list = ls())


x <- c(0.5, 0.6) ## numeric
x <- c(TRUE, FALSE) ## logical
x <- c(T, F) ## logical
x <- c("a", "b", "c") ## character
x <- 9:29 ## integer
x <- c(1+0i, 2+4i) ## complex

x <- vector("numeric", length = 10)
x


y <- c(1.7, "a") ## character
y <- c(TRUE, 2) ## numeric
y <- c("a", TRUE) ## character


#----- new

x <- 0:6
class(x)
mode(x)
as.numeric(x)
as.logical(x)
as.character(x)

x <- c("a","b","c")
as.numeric(x)
as.logical(x)
as.complex(x)


m <- matrix(nrow = 2,ncol = 3)
m
attributes(m)
m <- matrix(1:6, nrow = 3, ncol = 3)
m

num <- sample(1:10,9)
m <- matrix(num,3,3)
m
m[2,]
m[,3]
m[2,2]
m[1:2,2:3]


m <- 1:10
m
dim(m) <- c(2,5)
m

x <- 1:3
y <- 10:12
z <- cbind(x,y)
z
z <- rbind(x,y)
z


x <- list(1, "a", TRUE, 1 + 4i)
x
x <- vector("list", length = 5)
x


x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
unclass(x)


x <- factor(c("yes", "yes", "no", "yes", "no"))
x ## Levels are put in alphabetical order
x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x


x <- c(0,1,2,3,NA)
mean(x)
sd(x)
mean(x,na.rm = TRUE)
sd(x,na.rm = TRUE)
is.na(x)
x[!is.na(x)]


id <- c(10,20,30,40)
name <- c("Curz","Trump","Clinton","Sanders")
party <- c("Republican","Republican","Democratic","Democratic")
candidate <- data.frame(id,name,party)
str(candidate)

candidate <- data.frame(id,name,party)
str(candidate)
candidate$name <- as.character(candidate$name)


df <- data.frame()
edit(df)
fix(df)


w <- list(name="Trump", party="Republican",age="50")
w
w$name
w[1]
w[[1]]
class(w[1])
class(w[[1]])

w[[2]]


write.csv(candidate,file = "candidate.csv")
write.csv(candidate,file = "candidate.csv",row.names = FALSE)

my.data <- read.csv("candidate.csv",header = TRUE,stringsAsFactors = FALSE)
str(my.data)
fix(my.data)


list.files()
list.files(recursive = TRUE)

