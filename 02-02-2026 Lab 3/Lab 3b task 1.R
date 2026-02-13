# 1. Create the input vector
scores <- c(33, 24, 54, 94, 16, 89, 60, 6, 77, 61, 13, 44, 26, 24, 73, 73, 90, 39, 90, 54)

# 2. Categorize grades using logical conditions
grade_A <- sum(scores >= 90 & scores <= 100)
grade_B <- sum(scores >= 80 & scores <= 89)
grade_C <- sum(scores >= 70 & scores <= 79)
grade_D <- sum(scores >= 60 & scores <= 69)
grade_E <- sum(scores >= 50 & scores <= 59)
grade_F <- sum(scores <= 49)

# 3. Check passing status (score > 49)
pass_status <- scores > 49

# 4. Display Results
cat("Grade Distribution:\n")
cat("A (90-100):", grade_A, "\nB (80-89): ", grade_B, "\nC (70-79): ", grade_C, 
    "\nD (60-69): ", grade_D, "\nE (50-59): ", grade_E, "\nF (<=49):  ", grade_F, "\n")

cat("\nPass Status (TRUE = Pass, FALSE = Fail):\n")
print(pass_status)