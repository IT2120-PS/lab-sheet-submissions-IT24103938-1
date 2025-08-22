

setwd("C:\\Users\\IT24103938\\Desktop\\IT24103938_lab4")
branch_data <- read.csv("Exercise.txt", header=TRUE)


str(branch_data)
names(branch_data)

boxplot(branch_data$Sales, main="Boxplot of Sales", col="orange")


summary(branch_data$Advertising)
IQR(branch_data$Advertising)

# Outlier detection function
find_outliers <- function(x) {
  Q1 <- quantile(x, 0.25)
  Q3 <- quantile(x, 0.75)
  IQR_val <- IQR(x)
  
  lower <- Q1 - 1.5 * IQR_val
  upper <- Q3 + 1.5 * IQR_val
  
  outliers <- x[x < lower | x > upper]
  return(outliers)
}
find_outliers(branch_data$Years)