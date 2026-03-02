library(dplyr)

titanic <- read.csv("/Users/jiazechong/Downloads/TEB2164 Data Science Lab/02-03-2026 Lab 7/titanic.csv")
sum(is.na(titanic))
which(is.na(titanic))
print(sapply(titanic, function(x) sum(is.na(x))))

raw_rows <- dim(titanic)[1]

dim(titanic)
titanic$Cabin <- NULL
titanic_cleaned = na.omit(titanic)
dim(titanic_cleaned)
clean_rows <- dim(titanic_cleaned)[1]
colnames(titanic_cleaned)

cherbourg_passengers = titanic_cleaned %>% filter(Embarked == 'C')
total_cherbourg = dim(cherbourg_passengers)[1]

cherbourg_survived = cherbourg_passengers %>% filter(Survived == 1)
total_survived = dim(cherbourg_survived)[1]

cherbourg_third = cherbourg_passengers %>% filter(Pclass == 3)
total_third = dim(cherbourg_third)[1]

survival_rate_percentage = (total_survived / total_cherbourg) * 100
third_class_percentage = (total_third / total_cherbourg) * 100

females <- filter(titanic_cleaned, Sex == 'female')
males <- filter(titanic_cleaned, Sex == 'male')

surv_rate_f <- round((dim(filter(females, Survived == 1))[1] / dim(females)[1]) * 100)
surv_rate_m <- round((dim(filter(males, Survived == 1))[1] / dim(males)[1]) * 100)

first_class <- filter(titanic_cleaned, Pclass == 1)
third_class <- filter(titanic_cleaned, Pclass == 3)

surv_rate_1st <- round((dim(filter(first_class, Survived == 1))[1] / dim(first_class)[1]) * 100)
surv_rate_3rd <- round((dim(filter(third_class, Survived == 1))[1] / dim(third_class)[1]) * 100)

female_survival_rate = (total_females_survived / total_females) * 100

report_table <- data.frame(
  Observation_Category = c(
    "Cherbourg Passengers", 
    "Cherbourg Passengers", 
    "Female Passengers", 
    "Male Passengers", 
    "First Class Passengers", 
    "Third Class Passengers"
  ),
  Insight_Description = c(
    "Survival Rate", 
    "Proportion in Third Class", 
    "Survival Rate", 
    "Survival Rate", 
    "Survival Rate", 
    "Survival Rate"
  ),
  Percentage_Value = c(
    paste0(survival_rate_percentage, "%"),
    paste0(third_class_percentage, "%"),
    paste0(surv_rate_f, "%"),
    paste0(surv_rate_m, "%"),
    paste0(surv_rate_1st, "%"),
    paste0(surv_rate_3rd, "%")
  )
)


cat("==========================================================\n")
cat("           LAB 7B: TITANIC DATA SCIENCE REPORT            \n")
cat("==========================================================\n\n")

cat("--- 1. DATA PREPARATION ---\n")
cat("Dataset imported successfully. To ensure maximum data retention, \n")
cat("the highly sparse 'Cabin' column was dropped prior to omitting NAs.\n")
cat("Rows before cleaning: ", raw_rows, "\n")
cat("Rows after cleaning:  ", clean_rows, "\n\n")

cat("--- 2. KEY INSIGHTS & OBSERVATIONS ---\n")
cat("i.   ", survival_rate_percentage, "% who embark from Cherbourg survived and ", third_class_percentage, "% are from Third Class.\n")
cat("ii.  Gender played a massive role in survival: ", surv_rate_f, "% of females \n")
cat("     survived, compared to only ", surv_rate_m, "% of males.\n")
cat("iii. Socioeconomic status influenced outcomes heavily: ", surv_rate_1st, "% of \n")
cat("     First Class passengers survived, versus ", surv_rate_3rd, "% of Third Class.\n\n")
print(report_table)

cat("\n--- 3. CONCLUSION ---\n")
cat("Based on the data frame filtering, it is clear that survival\n")
cat("rates on the Titanic were not random; they were heavily dictated\n")
cat("by socioeconomic class, gender, and point of embarkation.\n")
cat("==========================================================\n")