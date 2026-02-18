# Function to check if a year is a leap year
check_leap_year <- function(year) {
  if ((year %% 4 == 0 && year %% 100 != 0) || (year %% 400 == 0)) {
    cat(year, "is a leap year.\n")
  } else {
    cat(year, "is not a leap year.\n")
  }
}

# Testing the program with your samples
check_leap_year(2004)
check_leap_year(1900)

# Optional: Taking user input
# input_year <- as.integer(readline(prompt="Input year: "))
# check_leap_year(input_year)