## Set working directory
getwd()
setwd("C:\\Users\\IT24103938\\Desktop\\IT24103938")
getwd()

## Import dataset
Delivery.Times <- read.table("Data.txt", header = TRUE)

## View and clean data
fix(Delivery.Times)
names(Delivery.Times) <- c("Time")  # Rename column to 'Time'

## Ensure 'Time' is numeric
Delivery.Times$Time <- as.numeric(as.character(Delivery.Times$Time))

## Part 2: Histogram with 9 right-open intervals from 20 to 70
histogram <- hist(Delivery.Times$Time, 
                  breaks = seq(20, 70, length.out = 10), 
                  right = FALSE, 
                  main = "Histogram of Delivery Times", 
                  xlab = "Delivery Time", 
                  col = "lightblue")

## Part 3: Frequency table with class intervals
breaks <- round(histogram$breaks)
freq <- histogram$counts
mids <- histogram$mids

classes <- c()
for (i in 1:(length(breaks) - 1)) {
  classes[i] <- paste0("[", breaks[i], ",", breaks[i + 1], ")")
}

class_table <- cbind(Classes = classes, Frequency = freq)
print(class_table)

## Part 4: Frequency polygon
plot(mids, freq, type = "o", 
     main = "Frequency Polygon of Delivery Times", 
     xlab = "Delivery Time", 
     ylab = "Frequency", 
     ylim = c(0, max(freq)))

## Part 5: Cumulative frequency polygon (Ogive)
cum.freq <- cumsum(freq)
ogive.x <- breaks
ogive.y <- c(0, cum.freq)

plot(ogive.x, ogive.y, type = "o", 
     main = "Cumulative Frequency Polygon (Ogive)", 
     xlab = "Delivery Time", 
     ylab = "Cumulative Frequency",
     ylim = c(0, max(cum.freq)))

ogive_table <- cbind(Upper = ogive.x, CumFreq = ogive.y)
print(ogive_table)
