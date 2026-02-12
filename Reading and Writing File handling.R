setwd(getwd())
id <- 1:10
name <- c("A","B","C","D","E","F","G","H","I","J")
marks1 <- c(78,85,67,90,88,76,69,95,80,84)
marks2 <- c(72,81,65,92,86,74,70,93,82,85)
student <- data.frame(id, name, marks1, marks2)
write.csv(student, "students.csv", row.names = FALSE)
data <- read.csv("students.csv")
print(data)
data$total <- data$marks1 + data$marks2
data$average <- data$total / 2
data$grade <- ifelse(data$average >= 85, "A",
                     ifelse(data$average >= 70, "B", "C"))
data[is.na(data)] <- 0
data_sorted <- data[order(-data$total), ]
write.csv(data_sorted, "students_sorted.csv", row.names = FALSE)
write.table(data_sorted, "students.txt", sep = "	", row.names = FALSE)
text_data <- read.table("students.txt", header = TRUE)
str(text_data)
summary(text_data)
saveRDS(text_data, "students.rds")
rds_data <- readRDS("students.rds")
print(rds_data)
