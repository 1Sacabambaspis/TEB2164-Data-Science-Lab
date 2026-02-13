# 1. Update the list to include Physics
student_list$physics <- c(89, 86, 65, 52, 60, 67, 40, 77, 90, 61)
# Renaming scores to chemistry for clarity
names(student_list)[2] <- "chemistry"

# 2. Logic: Count students who failed BOTH subjects (<= 49)
failed_both <- sum(student_list$chemistry <= 49 & student_list$physics <= 49)

# 3. Logic: Find who got the highest/best score for BOTH (Total Score)
total_scores <- student_list$chemistry + student_list$physics
best_index <- which.max(total_scores)
best_student <- student_list$names[best_index]

# 4. Output
cat("Number of students who failed both Chemistry and Physics:", failed_both, "\n")
cat("Student with the highest combined score:", best_student, "(", total_scores[best_index], ")\n")