age = (c(55,57,56,52,51,59,58,53,59,55,60,60,60,60,52,55,56,51,60,52,54,56,52,57,54,56,58,53,53,50,55,51,57,60,57,55,51,50,57,58))
age_factor <- factor(age)
counts<- table(age_factor)

unique_ages <- levels(age_factor)
staff_counts <- as.vector(counts)

column.names <- c("Staff Age","Total_number_of_staff")
matrix1<- array(c(unique_ages,staff_counts),dim = c(11,2),dimnames =list(NULL,column.names) )
print(matrix1)


age_range <- cut(age, breaks = c(50, 52, 54, 56, 58, 60), right = FALSE, labels = c("50-52", "52-54", "54-56", "56-58", "58-60"))
range_counts <- table(age_range)
ranges <- names(range_counts)
range_staff_count <- as.vector(range_counts)

column.names <- c("Age Range","Total_number_of_staff")
matrix2<- array(c(ranges,range_staff_count),dim = c(5,2),dimnames =list(NULL,column.names) )
print(matrix2)