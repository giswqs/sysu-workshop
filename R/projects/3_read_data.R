### central tendency

v <- c(1,2,2,3,4,7,9)
mean(v)
median(v)
mode(v)
class(v)
table(v)
sort(table(v))
rev(sort(table(v)))
names(rev(sort(table(v))))[1]
v <- c(1,2,2,3,4,7,9,NA)
mean(v,na.rm = TRUE)



library(moments)
install.packages("moments")
v <- c(1,2,2,3,4,7,9)
min(v)
max(v)
range(v)
var(v)
sd(v)
skewness(v)
kurtosis(v)
quantile(v)
length(v)
which.max(v)
which.min(v)


####  read CSV file
df <- read.csv("students.csv")
str(df)
df$Last.Name <- as.character(df$Last.Name)
df$First.Name <- as.character(df$First.Name)
str(df)
df <- read.csv("students.csv",header = TRUE,as.is = TRUE)
str(df)


### write csv file
df <- read.csv("students.csv")
df2 <- df[,1:5]
write.csv(df2,file = "stu.csv")
write.csv(df2,file = "stu2.csv",row.names = FALSE)


#### exploring data
summary(df)
fix(df)
str(df)
names(df)
head(df)
head(df,n=10)
tail(df)
tail(df,n=10)
tail(df,n=-10)
df[1:10,]
df[1:10,1:3]
df[c("Last.Name","First.Name","City","State")]


### descriptive statistics
install.packages("fBasics")
library(fBasics)
df <- read.csv("students.csv")
SAT <- df$SAT
basicStats(SAT)
summary(SAT)
hist(SAT)
hist(df$SAT,main = "Histogram of SAT Score",xlab = "SAT Score",ylab = "Frequency",col="green")


### descriptive statistics by groups
df <- read.csv("students.csv")
SAT.mean <- tapply(df$SAT, df$Gender, mean)
print(SAT.mean)

SAT.median <- tapply(df$SAT, df$Gender, median)
print(SAT.median)

SAT.sd <- tapply(df$SAT, df$Gender, sd)
print(SAT.sd)

SAT.max <- tapply(df$SAT, df$Gender, max)
print(SAT.max)


round(cbind(SAT.mean,SAT.median,SAT.sd,SAT.max),digits = 1)
t1 <- round(cbind(SAT.mean,SAT.median,SAT.sd,SAT.max),digits = 1)



df <- read.csv("students.csv")
aggregate(df[c("Age","SAT")], df["Gender"],mean,na.rm=TRUE)
aggregate(df[c("Age","SAT")],by=list(sex=df$Gender,major=df$Major,status=df$Student.Status),mean)


### load built-in dataset
library(datasets)
df <- cars
boxplot(df$speed)
summary(df$speed)
hist(df$speed)