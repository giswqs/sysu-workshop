## Correlation

x <- rnorm(20)
y <- rnorm(20)

cor(x,y)
cor.test(x,y)

cor.test(x,y,method="spearman")

df <- read.csv("data/ExamAnxiety.csv",header = TRUE)
df <- read.csv("data/ExamAnxiety.csv")

plot(df)

x <- seq(from=0,to = 1,length.out = 100)
y <- x + rnorm(100)
plot(x,y)

df <- mtcars
cor(df)
plot(df)

plot(df$hp,df$qsec)
abline(lm(df$qsec ~ df$hp))

mpg <- df$mpg
wt <- df$wt
plot(wt, mpg)

examData <- read.csv("data/ExamAnxiety.csv",header = TRUE)
cor(examData, use = "complete.obs", method = "pearson")
cor(examData$Exam, examData$Anxiety, use = "complete.obs", method = "pearson")
cor.test(examData$Exam, examData$Anxiety, method = "pearson")

