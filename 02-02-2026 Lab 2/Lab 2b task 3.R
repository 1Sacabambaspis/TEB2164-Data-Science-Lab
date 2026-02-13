# Input
name <- readline(prompt = "Enter your name: ")
phone <- readline(prompt = "Enter your phone number: ")

# Process name to uppercase
formatted_name <- toupper(name)

# Extract first 3 and last 4 digits of phone number
# nchar(phone) helps find the end of the string dynamically
first_three <- substr(phone, 1, 3)
last_four   <- substr(phone, nchar(phone) - 3, nchar(phone))

# Output
cat("Hi,", formatted_name, ". A verification code has been sent to ", 
    first_three, "-xxxxx", last_four, "\n")