# task3.R
df <- data.frame(
  name = c("Anastasia", "Dima", "Michael", "Matthew", "Laura", "Kevin", "Jonas"),
  score = c(12.5, 9.0, 16.5, 12.0, 9.0, 8.0, 19.0),
  attempts = c(1, 3, 2, 3, 2, 1, 2),
  qualify = c("yes", "no", "yes", "no", "no", "no", "yes")
)

# Create a second data frame with the same structure for the new row
new_row <- data.frame(
  name = "Emily",
  score = 14.5,
  attempts = 1,
  qualify = "yes"
)

# Bind the two data frames
df <- rbind(df, new_row)

print(df)