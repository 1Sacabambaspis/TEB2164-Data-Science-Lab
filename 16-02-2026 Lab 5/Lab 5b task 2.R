# Program to display the cube of numbers up to a given integer
display_cubes <- function() {
  # Taking user input
  n <- as.integer(readline(prompt = "Input an integer: "))
  
  for (i in 1:n) {
    cube <- i^3
    cat(sprintf("Number is: %d and cube of the %d is :%d\n", i, i, cube))
  }
}

# Run the function
display_cubes()