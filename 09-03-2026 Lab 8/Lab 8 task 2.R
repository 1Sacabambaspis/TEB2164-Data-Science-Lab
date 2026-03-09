# ==========================================================
# LAB 8b: TASK 2 - STORYTELLING WITH BJsales DATASET
# ==========================================================

# 1. Load the built-in dataset
data(BJsales)

# 2. Generate Visualization (Line Chart)
plot(BJsales, 
     type = "o", 
     col = "blue", 
     xlab = "Time Period", 
     ylab = "Sales Volume", 
     main = "Company Sales Performance Review")

# Add a trendline
abline(lm(BJsales ~ time(BJsales)), col="red", lwd=2)

# 3. In-Console Manager Presentation Report
cat("==========================================================\n")
cat("       SALES PERFORMANCE REPORT TO MANAGER                \n")
cat("==========================================================\n\n")

cat("Good morning, Manager.\n\n")
cat("Please refer to the generated Line Chart in the Plots tab.\n")
cat("I have plotted our historical sales data to visualize our recent performance.\n\n")

cat("OBSERVATIONS:\n")
cat("1. The blue line tracks our actual sales volume per period. As you can see,\n")
cat("   we have experienced significant volatility with frequent, sharp dips.\n")
cat("2. However, I have overlaid a red trendline on the graph. This reveals that\n")
cat("   despite the short-term fluctuations, our overall baseline trajectory is \n")
cat("   steadily increasing over time.\n\n")

cat("RECOMMENDATION:\n")
cat("While the upward trend is positive, we should investigate what caused the \n")
cat("sharpest drops (the lowest points on the blue line) to implement better \n")
cat("safeguards and prevent future revenue loss.\n")
cat("==========================================================\n")