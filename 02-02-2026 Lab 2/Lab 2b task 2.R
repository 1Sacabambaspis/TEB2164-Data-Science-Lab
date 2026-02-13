# Input
str1 <- readline(prompt = "Enter string 1: ")
str2 <- readline(prompt = "Enter string 2: ")

# Case-insensitive comparison
# Both strings are converted to lowercase to ensure 'test' matches 'TEST'
is_similar <- tolower(str1) == tolower(str2)

# Output
cat("This program compare 2 strings. Both inputs are similar:", is_similar, "\n")