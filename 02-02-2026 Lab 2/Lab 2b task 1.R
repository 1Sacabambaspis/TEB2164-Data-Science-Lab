# 1. Get user input
# Note: readline() captures input as a string, so we convert to numeric
weight <- as.numeric(readline(prompt = "Enter weight in kg: "))
height <- as.numeric(readline(prompt = "Enter height in meters: "))

# 2. Calculate BMI
bmi <- weight / (height^2)

# 3. Determine status using logical comparisons
# This matches the sample output format where each category is evaluated
underweight <- bmi <= 18.4
normal <- bmi >= 18.5 & bmi <= 24.9
overweight <- bmi >= 25.0 & bmi <= 39.9
obese <- bmi >= 40.0

# 4. Display the results
cat("Underweight:", underweight, "\n")
cat("Normal:", normal, "\n")
cat("Overweight:", overweight, "\n")
cat("Obese:", obese, "\n")