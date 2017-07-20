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
csv.path = "http://spatial.binghamton.edu/geog533/data/students.csv"
df <- read.csv(csv.path)
df <- read.csv("students.csv")
str(df)
df$Last.Name <- as.character(df$Last.Name)
df$First.Name <- as.character(df$First.Name)
str(df)
df <- read.csv("students.csv",header = TRUE,as.is = TRUE)
str(df)


### read Excel file
install.packages("readxl")
library(readxl)
### http://spatial.binghamton.edu/geog533/data/students.xls"
df.xls <- read_excel("students.xls")
View(df.xls)


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










df.txt <- read.table("students.txt")
df.txt <- read.table("students.txt",header = TRUE,sep = ",")
str(df.txt)
df.txt <- read.table("students.txt",header = TRUE,sep = ",",stringsAsFactors = FALSE)
str(df.txt)
df.txt$City <- factor(df.txt$City)
str(df.txt)
df.txt <- read.table("students.txt",header = TRUE,sep = ",",stringsAsFactors = FALSE,na.strings = "NA")
str(df.txt)


df.csv <- read.csv("students.csv")
str(df.csv)
df.csv <- read.csv("students.csv",header = TRUE)
str(df.csv)
df.csv <- read.csv("students.csv",as.is = TRUE)
str(df.csv)

SAT <- df.csv$SAT
summary(SAT)
hist(SAT)


install.packages("fBasics")
library(fBasics)
df <- read.csv("students.csv")
SAT <- df$SAT
basicStats(SAT)
summary(SAT)
hist(SAT)


library(Rcmdr)

str(df.csv)


df <- read.csv("students.csv")
df2 <- df[,1:5]
write.csv(df,file = "stu.csv",row.names = FALSE)


### using the Hmisc package
install.packages("Hmisc")
library(Hmisc)
df <- read.csv("students.csv")
describe(df)
# n, nmiss, unique, mean, 5,10,25,50,75,90,95th percentiles 
# 5 lowest and 5 highest scores


### using the psych package
install.packages("psych")
library(psych)
df <- read.csv("students.csv")
describe(df)


library(psych)
df <- read.csv("students.csv")
describe.by(df$SAT,df$Gender)




install.packages("pastecs")
library(pastecs)
df <- read.csv("students.csv")
stat.desc(df)
desc <- stat.desc(df[,c("Age","SAT")])
desc
desc$Age <- as.integer(desc$Age)
desc$SAT <- as.integer(desc$SAT)




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


df <- read.csv("students.csv")
hist(df$SAT)
hist(df$SAT,col="green")
with(df,hist(SAT))
hist(df$SAT,col="green")

with(df,hist(SAT, breaks = "FD", col = "green"))


df$score <- scale(df$SAT)



library(datasets)
df <- cars
boxplot(df$speed)
summary(df$speed)
hist(df$speed)


# https://stat.ethz.ch/R-manual/R-devel/library/stats/html/dist.html
# distance method: 	the distance measure to be used. This must be one of "euclidean", "maximum", "manhattan", "canberra", "binary" or "minkowski". Any unambiguous substring can be given.


x <- matrix(rnorm(100), nrow = 5)
x
dist(x)
dist(x, diag = TRUE)
dist(x, upper = TRUE)

factorial(8)


# read data from txt, csv, xls




df <- read.table("students.txt",header = TRUE,sep = ",")
summary(df)

summary(Dataset)

objects()
ls()
dir()
library()



library(car)
mydata <- Prestige


library(datasets)
mydata <- airquality

### Exploring data
summary(mydata) # Provides basic descriptive statistics and frequencies.
edit(mydata) # Open data editor
str(mydata) # Provides the structure of the dataset
names(mydata) # Lists variables in the dataset
head(mydata) # First 6 rows of dataset
head(mydata, n=10)# First 10 rows of dataset
head(mydata, n= -10) # All rows but the last 10
tail(mydata) # Last 6 rows
tail(mydata, n=10) # Last 10 rows
tail(mydata, n= -10) # All rows but the first 10
mydata[1:10, ] # First 10 rows
mydata[1:10,1:3] # First 10 rows of data of the first 3 variables


### exploring the workspace

objects() # Lists the objects in the workspace
ls() # Same as objects()
remove() # Remove objects from the workspace
rm(list=ls()) #clearing memory space
detach(package:ABC) # Detached packages when no longer need them
search() # Shows the loaded packages
library() # Shows the installed packages
dir() # show files in the working directory


### missing data
rowSums(is.na(mydata)) # Number of missing per row
colSums(is.na(mydata)) # Number of missing per column/variable
rowMeans(is.na(mydata))*length(mydata) # No. of missing per row (another way)
# length = num. of variables/elements in an object
# Convert to missing data
mydata[mydata$age=="& ","age"] <- NA # NOTE: Notice hidden spaces.
mydata[mydata$age==999,"age"] <- NA
# The function complete.cases() returns a logical vector indicating which cases are complete.
# list rows of data that have missing values
mydata[!complete.cases(mydata),]
# The function na.omit() returns the object with listwise deletion of missing values.
# Creating a new dataset without missing data
mydata1 <- na.omit(mydata)



### Renaming variables
# Using base commands
fix(mydata) # Rename interactively.
names(mydata)[3] <- "First"
# Using library ¨C-reshape--
library(reshape)
mydata <- rename(mydata, c(Last.Name="Last"))
mydata <- rename(mydata, c(First.Name="First"))
mydata <- rename(mydata, c(Student.Status="Status"))
mydata <- rename(mydata, c(Average.score..grade.="Score"))
mydata <- rename(mydata, c(Height..in.="Height"))
mydata <- rename(mydata, c(Newspaper.readership..times.wk.="Read"))




