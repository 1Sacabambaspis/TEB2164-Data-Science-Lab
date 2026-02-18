# Program to check if a number is an Armstrong number
is_armstrong <- function() {
  cat("Check whether an n digits number is Armstrong or not:\n")
  cat("-------------------------------------------------------\n")
  
  num <- as.integer(readline(prompt = "Input an integer: "))
  
  # Convert to string to separate digits and find the number of digits (n)
  digits <- as.numeric(unlist(strsplit(as.character(num), "")))
  n <- length(digits)
  
  # Calculate the sum of digits raised to the power of n
  sum_pow <- sum(digits^n)
  
  # Check if the sum equals the original number
  if (sum_pow == num) {
    cat(num, "is an Armstrong number.\n")
  } else {
    cat(num, "is not an Armstrong number.\n")
  }
}

# Run the function
is_armstrong()