# ==========================================================
# LAB 8b: TASK 1 - TITANIC DATA VISUALIZATION & REPORT
# ==========================================================
library(dplyr)

# 1. Load and Clean Data
# Replace with your actual file path if needed
titanic <- read.csv("titanic.csv")
titanic$Cabin <- NULL
titanic_cleaned <- na.omit(titanic)

# 2. Data Processing for Insights
# Insight A: Gender Survival Rates
females <- filter(titanic_cleaned, Sex == 'female')
males <- filter(titanic_cleaned, Sex == 'male')
surv_rate_f <- round((dim(filter(females, Survived == 1))[1] / dim(females)[1]) * 100)
surv_rate_m <- round((dim(filter(males, Survived == 1))[1] / dim(males)[1]) * 100)

# Insight B: Passenger Class Survival Rates
first_class <- filter(titanic_cleaned, Pclass == 1)
third_class <- filter(titanic_cleaned, Pclass == 3)
surv_rate_1st <- round((dim(filter(first_class, Survived == 1))[1] / dim(first_class)[1]) * 100)
surv_rate_3rd <- round((dim(filter(third_class, Survived == 1))[1] / dim(third_class)[1]) * 100)

# 3. Generate Visualizations (Pops up in the Plots pane)
# Plot 1: Bar Chart for Gender Survival
gender_rates <- c(surv_rate_f, surv_rate_m)
barplot(gender_rates, 
        names.arg = c("Female", "Male"), 
        main = "Titanic Survival Rate by Gender", 
        ylab = "Survival Rate (%)", 
        col = c("purple", "lightblue"), 
        ylim = c(0, 100))

# Plot 2: Pie Chart for Socioeconomic Class Survival
class_rates <- c(surv_rate_1st, surv_rate_3rd)
class_labels <- c(paste("1st Class: ", surv_rate_1st, "%", sep=""), 
                  paste("3rd Class: ", surv_rate_3rd, "%", sep=""))
pie(class_rates, 
    labels = class_labels, 
    main = "Survival Comparison: 1st vs 3rd Class", 
    col = c("green", "red"))

# 4. In-Console Report Output
cat("==========================================================\n")
cat("          LAB 8b: TITANIC DATA VISUALIZATION REPORT       \n")
cat("==========================================================\n\n")

cat("--- VISUALIZATION 1: BAR CHART (GENDER INSIGHT) ---\n")
cat("Observation: The generated Bar Chart clearly illustrates that\n")
cat("gender played a massive role in survival. Specifically, ", surv_rate_f, "% of\n")
cat("females survived, compared to a starkly lower ", surv_rate_m, "% of males.\n\n")

cat("--- VISUALIZATION 2: PIE CHART (CLASS INSIGHT) ---\n")
cat("Observation: The generated Pie Chart demonstrates how socioeconomic\n")
cat("status heavily influenced outcomes. First Class passengers had a\n")
cat("survival rate of ", surv_rate_1st, "%, vastly outperforming Third Class passengers\n")
cat("who only had a ", surv_rate_3rd, "% survival rate.\n\n")

cat("--- CONCLUSION ---\n")
cat("The visualizations confirm that survival on the Titanic was heavily\n")
cat("dictated by a passenger's gender and socioeconomic class.\n")
cat("==========================================================\n")