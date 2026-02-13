# 1. Store records in a named list
student_list <- list(
  names = c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt", "Larson", "Holland", "Paul", "Simu", "Renner"),
  scores = c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59)
)

# 2. Calculations
highest_score <- max(student_list$scores)
lowest_score  <- min(student_list$scores)
avg_score     <- mean(student_list$scores)

# Find indices for names
top_students <- student_list$names[student_list$scores == highest_score]
bottom_students <- student_list$names[student_list$scores == lowest_score]

# 3. Output
cat("Highest Score:", highest_score, "\n")
cat("Lowest Score: ", lowest_score, "\n")
cat("Average Score:", avg_score, "\n")
cat("Student with highest score:", paste(top_students, collapse=", "), "\n")
cat("Student with lowest score: ", paste(bottom_students, collapse=", "), "\n")