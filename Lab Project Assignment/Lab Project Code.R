# Load required libraries
library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)

# 1. CUSTOM INGESTION: Read raw text to handle the mixed delimiters
raw_lines <- readLines(file.choose())
header <- str_trim(str_split(raw_lines[1], ",")[[1]])

processed_rows <- list()
for (i in 2:length(raw_lines)) {
  line <- raw_lines[i]
  if (str_trim(line) == "") next # Skip empty lines
  
  # Handle pipe-separated logic versus comma-separated logic
  if (str_detect(line, "\\|")) {
    # Some lines have duplicated data separated by a comma (e.g., 'A|B,A|B')
    first_part <- str_split(line, ",")[[1]][1] 
    row_data <- str_split(first_part, "\\|")[[1]]
  } else {
    row_data <- str_split(line, ",")[[1]]
  }
  
  row_data <- str_trim(row_data)
  
  # Enforce strict column counts to match the header
  if (length(row_data) < length(header)) {
    row_data <- c(row_data, rep(NA, length(header) - length(row_data)))
  } else if (length(row_data) > length(header)) {
    row_data <- row_data[1:length(header)]
  }
  
  processed_rows[[length(processed_rows) + 1]] <- row_data
}

# 2. Convert raw matrix into a DataFrame
df <- as.data.frame(do.call(rbind, processed_rows), stringsAsFactors = FALSE)
colnames(df) <- header

# 3. DATA CLEANING & IMPUTATION
clean_df <- df %>%
  # Standardize all "NA" strings or empty spaces to logical NA
  mutate(across(everything(), ~na_if(str_trim(.), ""))) %>%
  mutate(across(everything(), ~na_if(., "NA"))) %>%
  
  # Primary Key: Drop rows missing Student_ID and remove duplicates
  filter(!is.na(Student_ID)) %>%
  mutate(Student_ID = as.integer(Student_ID)) %>%
  distinct(Student_ID, .keep_all = TRUE) %>%
  
  # Categorical Missing Values: Impute missing names
  mutate(
    First_Name = replace_na(First_Name, "Unknown"),
    Last_Name = replace_na(Last_Name, "Unknown")
  ) %>%
  
  # Clean Age: Strip asterisks (e.g. '78*') and impute missing with the Median
  mutate(Age = as.numeric(str_extract(Age, "\\d+"))) %>%
  mutate(Age = replace_na(Age, round(median(Age, na.rm = TRUE)))) %>%
  
  # Clean Gender: Extract first letter, make Uppercase, impute missing
  mutate(Gender = str_to_upper(str_extract(Gender, "[a-zA-Z]"))) %>%
  mutate(Gender = ifelse(!Gender %in% c("M", "F") | is.na(Gender), "Unknown", Gender)) %>%
  
  # Clean Course: Fix intense typos ("Develpment", "Analysi") using Regex
  mutate(Course = case_when(
    str_detect(Course, regex("Learn", ignore_case = TRUE)) ~ "Machine Learning",
    str_detect(Course, regex("Dev", ignore_case = TRUE)) ~ "Web Development",
    str_detect(Course, regex("Analy", ignore_case = TRUE)) ~ "Data Analytics",
    str_detect(Course, regex("Sci", ignore_case = TRUE)) ~ "Data Science",
    str_detect(Course, regex("Secur", ignore_case = TRUE)) ~ "Cyber Security",
    TRUE ~ "Undeclared"
  )) %>%
  
  # Clean Total Payments: Strip currencies ($/£/?) and commas, impute with Median
  mutate(Total_Payments = as.numeric(str_replace_all(Total_Payments, "[^0-9.]", ""))) %>%
  mutate(Total_Payments = replace_na(Total_Payments, median(Total_Payments, na.rm = TRUE))) %>%
  
  # Clean Dates: Standardize overlapping date formats natively using lubridate
  mutate(Enrollment_Date = suppressWarnings(
    parse_date_time(Enrollment_Date, orders = c("ymd", "dmy", "dby"))
  )) %>%
  mutate(Enrollment_Date = as.Date(Enrollment_Date))

# 4. EXPORT
write.csv(clean_df, "cleaned_dataset.csv", row.names = FALSE)
cat("Dataset successfully cleaned and saved to 'cleaned_dataset.csv'!\n")