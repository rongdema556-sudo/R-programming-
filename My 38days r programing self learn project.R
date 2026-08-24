#Day one 
#######################################################################################################
gdp_growth <- 3.5 
inflation_rate <- 2.1 
total_indicator <- gdp_growth + inflation_rate 
print(total_indicator)

country_name <- "Malaysia"       # Character (string)
population_millions <- 33.5      # Numeric
is_developed <- FALSE            # Logical (Boolean)

# Check the data type of a variable using class()
class(country_name)        # Returns "character"
class(population_millions) # Returns "numeric"
class(is_developed)        # Returns "logical"
#######################################################################################################

#Day two
#######################################################################################################
#Creating Vector
# Numeric vector (e.g., quarterly GDP growth rates)
gdp_growth <- c(2.1, 2.5, 1.8, 3.0)

# Character vector (e.g., country names)
countries <- c("Malaysia", "Indonesia", "Thailand")

# Logical vector
is_growing <- c(TRUE, TRUE, FALSE, TRUE)

#Vector indexing 
# R is 1-indexed (the first element is at position 1, not 0)
gdp_growth[1]     # Returns the first element: 2.1
gdp_growth[c(1, 3)] # Returns the 1st and 3rd elements: 2.1, 1.8

# Filtering vector elements using conditions
gdp_growth[gdp_growth > 2.0] # Returns values greater than 2.0

#Vectro recycling in math 
prices <- c(100, 200, 300)
tax_rate <- 0.05

# Multiplying every element by a single number
total_tax <- prices * tax_rate 
print(total_tax) # Returns 5, 10, 15

# Create a 3x2 matrix (3 rows, 2 columns) filled with numbers 1 to 6
# byrow = TRUE fills the matrix row by row instead of column by column
economic_matrix <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, ncol = 2, byrow = TRUE)
print(economic_matrix)

# bycol = TRUE fills the matrix column by column instead of row by row
economic_matrix <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, ncol = 2, byrow = FALSE)
print(economic_matrix)

# Extracting elements from a matrix: matrix_name[row, column]
economic_matrix[1, 2]   # Extracts element at Row 1, Column 2
economic_matrix[2, ]    # Extracts the entire Row 2
economic_matrix[, 1]    # Extracts the entire Column 1
#########################################################################################

#Day 3 
#########################################################################################
# Lists can store completely different objects together
# CREATING AND ACCESSING LISTS
country_info <- list(
  country = "Malaysia",
  gdp_growth = c(2.1, 2.5, 3.0),
  is_developed = FALSE
)

print(country_info)

# Accessing list elements using double square brackets [[]] or $
country_info$country         # Returns "Malaysia"
country_info[[2]]           # Returns the gdp_growth vector


# Building a structured economic dataset manually
macro_data <- data.frame(
  Country = c("Malaysia", "Indonesia", "Thailand", "Singapore"),
  Year = c(2023, 2023, 2023, 2023),
  GDP_Growth = c(3.7, 5.0, 1.9, 1.1),
  Inflation = c(2.5, 3.7, 1.2, 0.5)
)

print(macro_data)

# INSPECTING DATA FRAMES
head(macro_data)       # View the first few rows
str(macro_data)        # Check structure and data types of each column
summary(macro_data)    # Get quick descriptive statistics for each column

# ACCESSING COLUMNS IN A DATA FRAME
# Use the $ operator to extract a specific column as a vector
macro_data$GDP_Growth  # Returns just the numeric growth column

# Calculate the mean GDP growth across these countries
mean(macro_data$GDP_Growth)

macro_data$Inflation 
mean(macro_data$Inflation)
######################################################################################

#Day 4
######################################################################################
# 0. SETUP: Create a sample economic dataset

macro_data <- data.frame(
  Country = c("Malaysia", "Indonesia", "Thailand", "Singapore", "Vietnam"),
  Year = c(2023, 2023, 2023, 2023, 2023),
  GDP_Growth = c(3.7, 5.0, 1.9, 1.1, 5.05),
  Inflation = c(2.5, 3.7, 1.2, 0.5, 3.2)
)
print(macro_data)

# 1. INDEXING BY POSITION [row, column]
macro_data[1, 3]        # Row 1, Column 3 (Malaysia's GDP Growth: 3.7)
macro_data[1:3, ]       # Rows 1 through 3, all columns
macro_data[, c(1, 3)]   # All rows, but only Column 1 and Column 3


# 2. INDEXING BY COLUMN NAME ($)
macro_data$Country      # Extracts the 'Country' column as a vector
macro_data[, "Inflation"] # Alternative way to extract by column name

# 3. CONDITIONAL FILTERING (ROWS)
# Method A: Using logical indexing inside brackets
high_growth <- macro_data[macro_data$GDP_Growth > 3.0, ]
print(high_growth)      # Shows countries with GDP growth greater than 3.0

# Method B: Using the subset() function (often cleaner for econometrics)
indonesia_data <- subset(macro_data, Country == "Indonesia")
print(indonesia_data)

malaysia_data <- subset(macro_data, Country == "Malaysia")
print(malaysia_data)

#Filtering with multiple conditions (AND operator '&')
filtered_data <- subset(macro_data, GDP_Growth > 2.0 & Inflation < 3.0)
print(filtered_data)
##########################################################
#Day 5 
# If-Else Statements
gdp_growth <- 3.5
if (gdp_growth > 4.0) {
  print("High Economic Growth")
} else if (gdp_growth >= 2.0 & gdp_growth <= 4.0) {
  print("Moderate Economic Growth")
} else {
  print("Low Growth / Recession Risk")
}

# Vectorized ifelse
inflation_rates <- c(1.2, 4.5, 2.1, 6.0)
inflation_status <- ifelse(inflation_rates > 3.0, "High Inflation", "Stable")
print(inflation_status)

# For Loops
years <- c(2021, 2022, 2023)
for (y in years) {
  print(paste("Analyzing macroeconomic data for year:", y))
}

# While Loops
capital <- 100
target_capital <- 150
years_passed <- 0
while (capital < target_capital) {
  capital <- capital * 1.05
  years_passed <- years_passed + 1
}
print(paste("Target reached in", years_passed, "years.")
##########################################################
#Day 6 
 calculate_growth <- function(initial_value, final_value) {
  growth_rate <- ((final_value - initial_value) / initial_value) * 100
  return(growth_rate)
}
calculate_growth(1000, 1050)       # Returns 5

# Functions with Default Arguments
calculate_tax <- function(income, tax_rate = 0.15) {
  tax_amount <- income * tax_rate
  return(tax_amount)
}
calculate_tax(50000)               # Uses default 0.15
calculate_tax(50000, 0.20)         # Overrides default

# Scope
multiplier <- 2                    # Global variable
my_calculation <- function(x) {
  multiplier <- 10                 # Local variable
  result <- x * multiplier
  return(result)
}
my_calculation(5)                  # Returns 50
print(multiplier)                  # Returns 2 (global unchanged)
#############################################################
#DAY 7 
# Working Directory
getwd()
# setwd("C:/Your/Path/Here")

# Importing CSV
# economic_data <- read.csv("macro_data.csv", header = TRUE)
# head(economic_data)

# Exporting CSV
cleaned_data <- data.frame(
  Country = c("Malaysia", "Indonesia"),
  Growth = c(4.0, 5.1)
)
write.csv(cleaned_data, file = "cleaned_macro_data.csv", row.names = FALSE)

# Reading Excel
# install.packages("readxl")
library(readxl)
# excel_data <- read_excel("economic_indicators.xlsx", sheet = "Sheet1")
############################################################
#Day 8 
# Install and Load
# install.packages("tidyverse")
library(tidyverse)

# Tibbles
base_df <- data.frame(
  country = c("Malaysia", "Indonesia", "Thailand"),
  gdp_growth = c(3.7, 5.0, 1.9),
  year = c(2023, 2023, 2023)
)
macro_tbl <- as_tibble(base_df)

# Pipe Operator
inflation <- c(2.5, 3.1, 1.8, 4.2)
result_piped <- inflation |> 
  mean() |> 
  round(digits = 1)

# Piping with Data Frames
macro_tbl |> summary()
########################################################
#Day 9
library(tidyverse)

macro_df <- data.frame(
  Country = c("Malaysia", "Indonesia", "Thailand", "Singapore", "Vietnam"),
  Year = c(2023, 2023, 2023, 2023, 2023),
  GDP_Growth = c(3.7, 5.0, 1.9, 1.1, 5.05),
  Inflation = c(2.5, 3.7, 1.2, 0.5, 3.2)
)

print(macro_df)

# select() - Column Selection
macro_df |> select(Country, GDP_Growth)
macro_df |> select(-Year)          # Drop column

# filter() - Row Filtering
macro_df |> filter(GDP_Growth > 3.0)
macro_df |> filter(Country == "Malaysia")
macro_df |> filter(GDP_Growth > 3.0 & Inflation < 3.0)

# arrange() - Sorting
macro_df |> arrange(GDP_Growth)    # Ascending
macro_df |> arrange(desc(GDP_Growth)) # Descending

##############################################################
#Day 10 
library(tidyverse)

macro_df <- data.frame(
  Country = c("Malaysia", "Indonesia", "Thailand", "Singapore"),
  GDP = c(400, 1300, 500, 450),
  Population = c(33.5, 275.5, 71.7, 5.6)
)

# mutate() - Create New Columns
macro_mutated <- macro_df |> 
  mutate(GDP_per_capita = GDP / Population)

macro_transformed <- macro_df |> 
  mutate(Log_GDP = log(GDP))        # Natural log transformation

# case_when() - Conditional Mutations
macro_categorized <- macro_mutated |> 
  mutate(Economic_Tier = case_when(
    GDP_per_capita > 50 ~ "High Income",
    GDP_per_capita > 10 ~ "Middle Income",
    TRUE ~ "Developing"            # Catch-all else
  ))
###########################################################
#Day 11
library(tidyverse)

panel_df <- data.frame(
  Region = c("Asia", "Asia", "Asia", "Europe", "Europe", "Europe"),
  Country = c("Malaysia", "Indonesia", "Thailand", "Germany", "France", "Italy"),
  Year = c(2023, 2023, 2023, 2023, 2023, 2023),
  Inflation = c(2.5, 3.7, 1.2, 5.2, 4.8, 5.9)
)
print(panel_df)
# Group and Summarize
region_summary <- panel_df |> 
  group_by(Region) |> 
  summarize(
    Avg_Inflation = mean(Inflation),
    Max_Inflation = max(Inflation),
    Country_Count = n()
  ) |> 
  ungroup()
print(region_summary)

##########################################################
#Day 12
library(tidyverse)

gdp_data <- data.frame(
  Country = c("Malaysia", "Indonesia", "Thailand", "Singapore"),
  GDP_Growth = c(3.7, 5.0, 1.9, 1.1)
)

pop_data <- data.frame(
  Country = c("Malaysia", "Indonesia", "Thailand", "Vietnam"),
  Population_Mil = c(33.5, 275.5, 71.7, 98.2)
)

# left_join - Keep all rows from left table
left_merged <- gdp_data |> left_join(pop_data, by = "Country")

# inner_join - Keep only rows in both tables
inner_merged <- gdp_data |> inner_join(pop_data, by = "Country")

# full_join - Keep all rows from both tables
full_merged <- gdp_data |> full_join(pop_data, by = "Country")

library(tidyverse)

gdp_data <- data.frame(
  Country = c("Malaysia", "Indonesia", "Thailand", "Singapore"),
  GDP_Growth = c(3.7, 5.0, 1.9, 1.1)
)

print(gdp_data)

pop_data <- data.frame(
  Country = c("Malaysia", "Indonesia", "Thailand", "Vietnam"),
  Population_Mil = c(33.5, 275.5, 71.7, 98.2)
)

print(pop_data)

# left_join - Keep all rows from left table
left_merged <- gdp_data |> left_join(pop_data, by = "Country")

print(left_merged)

# inner_join - Keep only rows in both tables
inner_merged <- gdp_data |> inner_join(pop_data, by = "Country")

print(inner_merged)
# full_join - Keep all rows from both tables
full_merged <- gdp_data |> full_join(pop_data, by = "Country")

print(full_merged)
############################################################
#Day 13 
library(tidyverse)

# Wide Format
wide_macro <- data.frame(
  Country = c("Malaysia", "Indonesia"),
  Y2021 = c(3.1, 3.7),
  Y2022 = c(8.7, 5.3),
  Y2023 = c(3.7, 5.0)
)

# Wide to Long
long_macro <- wide_macro |> 
  pivot_longer(
    cols = starts_with("Y"),
    names_to = "Year",
    values_to = "GDP_Growth"
  )

# Long to Wide
back_to_wide <- long_macro |> 
  pivot_wider(
    names_from = Year,
    values_from = GDP_Growth
  )
##############################################################
#DAY 15
library(tidyverse)

economic_trend <- data.frame(
  Year = c(2019, 2020, 2021, 2022, 2023),
  GDP_Growth = c(4.3, -5.5, 3.1, 8.7, 3.7)
)

# Canvas
ggplot(data = economic_trend, mapping = aes(x = Year, y = GDP_Growth))

# Points
ggplot(economic_trend, aes(x = Year, y = GDP_Growth)) + geom_point()

# Lines
ggplot(economic_trend, aes(x = Year, y = GDP_Growth)) + geom_line()

# Combined
ggplot(economic_trend, aes(x = Year, y = GDP_Growth)) + 
  geom_line(color = "blue", linewidth = 1) + 
  geom_point(color = "darkblue", size = 3)
############################################################
#DAY 16
library(tidyverse)

macro_panel <- data.frame(
  Country = rep(c("Malaysia", "Indonesia", "Thailand"), each = 4),
  Year = rep(2020:2023, times = 3),
  GDP_Growth = c(-5.5, 3.1, 8.7, 3.7, -2.1, 3.7, 5.3, 5.0, -6.1, 1.5, 2.6, 1.9)
)
print(macro_panel)

# Single Country Line
macro_panel |> 
  filter(Country == "Malaysia") |> 
  ggplot(aes(x = Year, y = GDP_Growth)) + 
  geom_line(color = "blue", linewidth = 1.2) + 
  geom_point(color = "darkblue", size = 2)

# Multi-Country Lines
ggplot(macro_panel, aes(x = Year, y = GDP_Growth, color = Country)) + 
  geom_line(linewidth = 1) + 
  geom_point(size = 2)

# Customized
ggplot(macro_panel, aes(x = Year, y = GDP_Growth, color = Country, linetype = Country)) + 
  geom_line(linewidth = 1) + 
  geom_point(size = 2) + 
  labs(title = "GDP Growth Trajectories by Country (2020-2023)",
       x = "Year", y = "Annual GDP Growth (%)")
#################################################################
#Day 17 
library(tidyverse)
data(mtcars)

# Scatter Plot
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point(color = "darkred", size = 3) + 
  labs(title = "Fuel Economy vs. Weight", x = "Weight (1000 lbs)", y = "MPG")

# Scatter with OLS Line
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point(aes(color = as.factor(cyl))) + 
  geom_smooth(method = "lm", se = TRUE, color = "black", linetype = "dashed")

# Histogram
ggplot(mtcars, aes(x = mpg)) + 
  geom_histogram(bins = 8, fill = "steelblue", color = "white") + 
  labs(title = "Histogram of MPG", x = "MPG", y = "Frequency")

# Box Plot
ggplot(mtcars, aes(x = as.factor(cyl), y = mpg, fill = as.factor(cyl))) + 
  geom_boxplot() + 
  labs(title = "MPG by Cylinder Count", x = "Cylinders", y = "MPG")

print(mtcars)
#####################################################################
#Day 18
library(tidyverse)
data(mtcars)
mtcars$cyl_factor <- as.factor(mtcars$cyl)

# Base Plot with Labels
base_plot <- ggplot(mtcars, aes(x = wt, y = mpg, color = cyl_factor)) + 
  geom_point(size = 3) + 
  labs(
    title = "Vehicle Fuel Economy vs. Weight",
    subtitle = "Analysis of 1974 Motor Trend US Magazine",
    x = "Vehicle Weight (1,000 lbs)",
    y = "Miles Per Gallon (MPG)",
    color = "Cylinders",
    caption = "Source: Built-in R dataset (mtcars)"
  )

# Themes
base_plot + theme_bw()              # Black and white theme
base_plot + theme_minimal()         # Minimal theme

# Full Customization
ggplot(mtcars, aes(x = wt, y = mpg, color = cyl_factor)) + 
  geom_point(size = 3, alpha = 0.8) + 
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed") + 
  labs(title = "Econometric Relationship: Weight vs. MPG",
       subtitle = "Controlled by Cylinder Sub-groups",
       x = "Weight (1,000 lbs)", y = "Miles Per Gallon", color = "Cylinders") + 
  scale_color_manual(values = c("#E41A1C", "#377EB8", "#4DAF4A")) + 
  theme_minimal(base_size = 12) + 
  theme(
    plot.title = element_text(face = "bold", size = 14, color = "darkslategrey"),
    legend.position = "bottom",
    panel.grid.minor = element_blank()
  )
###########################################################################
#dAY 19 
library(tidyverse)

set.seed(123)
panel_data <- data.frame(
  Country = rep(c("Malaysia", "Indonesia", "Thailand", "Vietnam"), each = 5),
  Year = rep(2019:2023, times = 4),
  Sector = rep(c("Manufacturing", "Services"), times = 10),
  GDP_Growth = rnorm(20, mean = 4.0, sd = 1.5)
)
print(panel_data)

# facet_wrap - One dimension
ggplot(panel_data, aes(x = Year, y = GDP_Growth, color = Country)) + 
  geom_line(linewidth = 1) + 
  geom_point(size = 2) + 
  facet_wrap(~ Country, ncol = 2) + 
  labs(title = "GDP Growth by Country", x = "Year", y = "Growth (%)") + 
  theme_bw() + 
  theme(legend.position = "none")

# facet_grid - Two dimensions (Country rows, Sector columns)
ggplot(panel_data, aes(x = Year, y = GDP_Growth)) + 
  geom_col(fill = "steelblue") + 
  facet_grid(Country ~ Sector) + 
  labs(title = "GDP Growth Matrix: Country vs. Sector", 
       x = "Year", y = "Growth (%)") + 
  theme_bw()

# Free Scales
ggplot(panel_data, aes(x = Year, y = GDP_Growth, color = Sector)) + 
  geom_line(linewidth = 1) + 
  facet_wrap(~ Country, scales = "free_y") + 
  labs(title = "Faceted Plot with Free Y-Scales", x = "Year", y = "Growth (%)") + 
  theme_minimal()
################################################################################################
#Day 20 
library(tidyverse)

# Setup with missing values
eda_df <- mtcars
eda_df$mpg[c(3, 12)] <- NA
eda_df$hp[c(5, 20)] <- NA

print(eda_df)

# Structure Overview
glimpse(eda_df)
summary(eda_df)

# Missing Values Audit
sum(is.na(eda_df))                  # Total missing
colSums(is.na(eda_df))              # Missing per column

# Correlation Analysis
numeric_vars <- eda_df |> select(mpg, cyl, disp, hp, wt)
cor_matrix <- cor(numeric_vars, use = "complete.obs")
round(cor_matrix, 2)

# Drop Missing Values
clean_eda_df <- eda_df |> drop_na(mpg, hp)

print(clean_eda_df)
###############################################################################################
# Day 22
library(tidyverse)

# Descriptive Statistics Functions
data <- c(2.1, 2.5, 1.8, 3.0, 2.7, 2.3)

mean(data)
median(data)
sd(data)                            # Standard deviation
var(data)                           # Variance
min(data)
max(data)
quantile(data, probs = c(0.25, 0.75))
IQR(data)

# Quick Summary
summary(data)

# Using with Data Frames
summary(mtcars)
####################################################################
# Day 23
# Normal Distribution
rnorm(10, mean = 0, sd = 1)         # Generate random normal
dnorm(0, mean = 0, sd = 1)          # Density at x=0
pnorm(1.96, mean = 0, sd = 1)       # Cumulative probability
qnorm(0.975, mean = 0, sd = 1)      # Quantile

# Binomial Distribution
rbinom(10, size = 10, prob = 0.5)   # Generate random binomial
dbinom(5, size = 10, prob = 0.5)    # Probability of exactly 5 successes

#Set seed for reproducible random numbers
set.seed(42)

# POISSON DISTRIBUTION (Discrete Count Data)

# Models the number of events occurring in a fixed interval (e.g., website visits per hour)
# Lambda (lambda) = expected average rate of occurrence (e.g., 4 events per hour)

# Generate 1,000 random counts from a Poisson distribution
poisson_data <- rpois(n = 1000, lambda = 4)

# Quick summary of the generated counts
print("Poisson Data Summary:")
print(summary(poisson_data))

# Visualize the Poisson distribution
tibble(Count = poisson_data) |> 
  ggplot(aes(x = Count)) +
  geom_bar(fill = "steelblue", color = "black", alpha = 0.8) +
  labs(
    title = "Poisson Distribution (lambda = 4)",
    subtitle = "Discrete counts of events over a fixed interval",
    x = "Number of Events",
    y = "Frequency"
  ) +
  theme_minimal()

# UNIFORM DISTRIBUTION (Continuous & Equal Probability)

# Models a continuous range where every value between a minimum and maximum 
# has an equal chance of occurring (e.g., waiting times between 0 and 10 minutes)

# Generate 1,000 random values uniformly distributed between min = 0 and max = 10
uniform_data <- runif(n = 1000, min = 0, max = 10)

print("Uniform Data Summary:")
print(summary(uniform_data))

# Visualize the Uniform distribution (forms a flat horizontal rectangle)
tibble(Value = uniform_data) |> 
  ggplot(aes(x = Value)) +
  geom_histogram(bins = 30, fill = "darkorange", color = "white", alpha = 0.8) +
  labs(
    title = "Continuous Uniform Distribution (Min = 0, Max = 10)",
    subtitle = "Equal probability density across the entire range",
    x = "Value",
    y = "Count"
  ) +
  theme_minimal()

# NON-UNIFORM DISTRIBUTION (Custom Probabilities)

# Models a categorical or discrete variable where different outcomes 
# have unequal (custom) probabilities of being selected (e.g., market states: 
# Growth with 60% chance, Stagnation with 30%, Recession with 10%)

categories <- c("Growth", "Stagnation", "Recession")
custom_probabilities <- c(0.60, 0.30, 0.10)

# Sample 1,000 times from these categories using the specified weights
non_uniform_data <- sample(categories, size = 1000, replace = TRUE, prob = custom_probabilities)

# Calculate proportions to verify they match our weights
print("Non-Uniform Sample Proportions:")
print(prop.table(table(non_uniform_data)))

# Visualize the Non-Uniform distribution
tibble(State = non_uniform_data) |> 
  ggplot(aes(x = State, fill = State)) +
  geom_bar(alpha = 0.8) +
  labs(
    title = "Non-Uniform (Custom Probability) Distribution",
    subtitle = "Categories with unequal selection weights",
    x = "Economic State",
    y = "Count"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# EXPONENTIAL DISTRIBUTION (Time Between Events)

# Models the time between independent Poisson events 
# (e.g., time until the next customer arrives, or machine failure time)
# Rate (rate) = lambda parameter (e.g., an average rate of 0.5 events per minute)

# Generate 1,000 random values from an exponential distribution
exponential_data <- rexp(n = 1000, rate = 0.5)

print("Exponential Data Summary:")
print(summary(exponential_data))

# Visualize the Exponential distribution (skewed right, long tail)
tibble(Time = exponential_data) |> 
  ggplot(aes(x = Time)) +
  geom_histogram(bins = 40, fill = "forestgreen", color = "white", alpha = 0.8) +
  labs(
    title = "Exponential Distribution (Rate = 0.5)",
    subtitle = "Models time or distance between independent events",
    x = "Time Elapsed",
    y = "Count"
  ) +
  theme_minimal()

# Random Sampling
sample(1:100, 10)                   # Random sample of 10 from 1 to 100
set.seed(123)                       # For reproducibility
sample(c("A", "B", "C"), 10, replace = TRUE, prob = c(0.3, 0.5, 0.2))
##########################################################################
#Day 24
# One-Sample T-Test
data <- c(3.5, 3.8, 4.0, 3.9, 4.1, 3.7, 3.6, 4.2)
t.test(data, mu = 4.0)              # Test if mean = 4.0

# Two-Sample T-Test
group1 <- c(2.5, 2.8, 3.0, 2.7, 2.9)
group2 <- c(3.2, 3.5, 3.3, 3.8, 3.1)
t.test(group1, group2, var.equal = TRUE)

# Chi-Square Test
observed <- matrix(c(30, 10, 15, 25), nrow = 2, ncol = 2)
chisq.test(observed)
####################################################################
# Day 25 
# Simple Linear Regression
model <- lm(mpg ~ wt, data = mtcars)
summary(model)

# Extract Coefficients
coef(model)

# Confidence Intervals
confint(model, level = 0.95)

# Fitted Values and Residuals
model_results <- mtcars |> 
  mutate(
    Fitted_MPG = fitted(model),
    Residuals = residuals(model)
  )

# Model Diagnostics
plot(model)
<Return>
#####################################################################
Day 26 
# Multiple Linear Regression
model <- lm(mpg ~ wt + hp + cyl, data = mtcars)
summary(model)

# Add Interaction Term
model_interaction <- lm(mpg ~ wt * hp, data = mtcars)
summary(model_interaction)

# Model Comparison
anova(model, model_interaction)

# Diagnostic Plots
par(mfrow = c(2, 2))
plot(model)
par(mfrow = c(1, 1))

# Check Multicollinearity (VIF)
# install.packages("car")
library(car)
vif(model)
######################################################################
#Day 27 
# Load data
data(mtcars)

# Convert cylinder to a factor (categorical)
mtcars$cyl <- as.factor(mtcars$cyl)

# One-Way ANOVA: Is MPG significantly different across cylinder groups?
anova_one <- aov(mpg ~ cyl, data = mtcars)
summary(anova_one)  # Check the p-value (Pr(>F))

# Post-hoc test: Which specific groups are different?
tukey_result <- TukeyHSD(anova_one)
print(tukey_result)

# Visualize the differences
plot(tukey_result, las = 1)

# Assumption check: Homogeneity of variances (Levene's test)
# install.packages("car")
library(car)
leveneTest(mpg ~ cyl, data = mtcars)
#################################################################
#Day 28 
# Add transmission (am) as a second factor
mtcars$am <- as.factor(mtcars$am)  # 0 = automatic, 1 = manual

# Two-Way ANOVA with interaction (cyl * am)
anova_two <- aov(mpg ~ cyl * am, data = mtcars)
summary(anova_two)  # Check significance of cyl, am, and cyl:am interaction

# Alternative syntax (explicit main effects + interaction)
anova_two_alt <- aov(mpg ~ cyl + am + cyl:am, data = mtcars)
summary(anova_two_alt)

# Visualize interaction (Does the effect of cylinders depend on transmission?)
interaction.plot(x.factor = mtcars$cyl, 
                 trace.factor = mtcars$am, 
                 response = mtcars$mpg,
                 fun = mean,
                 type = "b",
                 col = c("blue", "red"),
                 xlab = "Cylinders",
                 ylab = "Mean MPG",
                 trace.label = "Transmission")
###################################################################
#Day 29
# Multiple Linear Regression
model <- lm(mpg ~ wt + hp + disp + cyl, data = mtcars)
summary(model)

# Heteroskedasticity Tests
# install.packages("lmtest")
library(lmtest)
bptest(model)                       # Breusch-Pagan test

# install.packages("car")
library(car)
ncvTest(model)                      # Non-constant variance test

# Multicollinearity
vif(model)

# Robust Standard Errors
# install.packages("sandwich")
library(sandwich)
coeftest(model, vcov = vcovHC(model, type = "HC1"))
###################################################################
#DAY 30
# install.packages("plm")
library(plm)

# Create Panel Data
panel_df <- data.frame(
  Country = rep(c("Malaysia", "Indonesia", "Thailand"), each = 5),
  Year = rep(2019:2023, times = 3),
  GDP_Growth = rnorm(15, mean = 4, sd = 1.5),
  Investment = rnorm(15, mean = 25, sd = 5),
  Inflation = rnorm(15, mean = 3, sd = 1)
)

# Declare Panel Data
pdata <- pdata.frame(panel_df, index = c("Country", "Year"))

# Pooled OLS
pooled_model <- plm(GDP_Growth ~ Investment + Inflation, 
                    data = pdata, model = "pooling")
summary(pooled_model)

# First-Differences
fd_model <- plm(GDP_Growth ~ Investment + Inflation, 
                data = pdata, model = "fd")
summary(fd_model)
#############################################################################
#Day 31

# ==========================================
# 1. LOAD LIBRARIES AND SETUP DATA
# ==========================================
library(tidyverse)
library(plm) # Essential for panel data econometrics

# Simulate a balanced panel dataset (e.g., 5 countries observed over 6 years)
set.seed(2026)
n_countries <- 5
n_years <- 6

panel_df <- data.frame(
  Country = rep(c("Malaysia", "Indonesia", "Thailand", "Vietnam", "Philippines"), each = n_years),
  Year = rep(2018:2023, times = n_countries),
  Investment = runif(n_countries * n_years, min = 15, max = 45),
  Trade_Openness = runif(n_countries * n_years, min = 60, max = 140)
)

# Create unobserved country-specific effects and generate dependent variable (GDP Growth)
country_effect <- rep(c(1.2, 2.0, 0.8, 2.5, 1.5), each = n_years)
panel_df$GDP_Growth <- 0.07 * panel_df$Investment + 0.03 * panel_df$Trade_Openness + country_effect + rnorm(30, mean = 0, sd = 0.5)

# Convert the standard data frame into a panel data object (pdata.frame)
# index = c("Entity/Group", "Time")
pdata <- pdata.frame(panel_df, index = c("Country", "Year"))


# ==========================================
# 2. ESTIMATING THE FIXED EFFECTS (FE) MODEL
# ==========================================
# model = "within" isolates within-entity variation and removes unobserved time-invariant bias
fe_model <- plm(GDP_Growth ~ Investment + Trade_Openness, 
                data = pdata, 
                model = "within")

print("--- Fixed Effects Model Summary ---")
summary(fe_model)

# Extract individual country-specific intercepts/fixed effects
print("Estimated Country Fixed Effects:")
print(fixef(fe_model))


# ==========================================
# 3. ESTIMATING THE RANDOM EFFECTS (RE) MODEL
# ==========================================
# model = "random" treats unobserved effects as random error components
re_model <- plm(GDP_Growth ~ Investment + Trade_Openness, 
                data = pdata, 
                model = "random")

print("--- Random Effects Model Summary ---")
summary(re_model)


# ==========================================
# 4. HAUSMAN SPECIFICATION TEST (FE vs. RE)
# ==========================================
# Tests whether individual effects are correlated with the regressors.
# H0: Random Effects is consistent and preferred (no correlation).
# H1: Random Effects is biased; must use Fixed Effects (correlation exists).

hausman_result <- phtest(fe_model, re_model)

print("--- Hausman Test Results ---")
print(hausman_result)

# Decision Rule Note:
# If p-value < 0.05, reject H0 -> Use Fixed Effects.
# If p-value > 0.05, fail to reject H0 -> Use Random Effects.
#######################################################
#DAY 32 
# install.packages("fixest")
library(fixest)

# Create dataset with entity and time FEs
panel_df <- data.frame(
  Country = rep(c("Malaysia", "Indonesia", "Thailand"), each = 10),
  Year = rep(2014:2023, times = 3),
  GDP_Growth = rnorm(30, mean = 4, sd = 1.5),
  Investment = rnorm(30, mean = 25, sd = 5),
  Inflation = rnorm(30, mean = 3, sd = 1)
)

# Fixed Effects with fixest (country and year fixed effects)
feols_model <- feols(GDP_Growth ~ Investment + Inflation | Country + Year, 
                     data = panel_df)
summary(feols_model)

# Multi-way clustering
feols_model_clustered <- feols(GDP_Growth ~ Investment + Inflation | Country + Year, 
                               data = panel_df, cluster = ~Country + Year)
summary(feols_model_clustered)

# Compare with plm
library(plm)
pdata <- pdata.frame(panel_df, index = c("Country", "Year"))
plm_model <- plm(GDP_Growth ~ Investment + Inflation, 
                 data = pdata, model = "within", effect = "twoways")
summary(plm_model)
################################################################
#Day 33
# ==========================================
# 1. LOAD LIBRARIES AND SETUP DATA
# ==========================================
library(tidyverse)

# Simulate a quasi-experimental dataset
# Scenario: Evaluating the impact of a minimum wage hike on local employment rates.
# Treatment Group: States that implemented the hike.
# Control Group: Neighboring states that did not.
set.seed(42)
n_obs <- 400

did_df <- data.frame(
  id = 1:n_obs,
  treated = rep(c(0, 1), each = n_obs / 2), # 0 = Control Group, 1 = Treatment Group
  post = rep(c(0, 1), times = n_obs / 2)    # 0 = Pre-Treatment Period, 1 = Post-Treatment Period
)

# Simulate the outcome (Employment Rate) with a TRUE causal effect of +4.2
# True Formula: Y = Baseline + GroupEffect + TimeTrend + (CausalEffect * Treated * Post) + Error
did_df$employment_rate <- 55.0 + 
  3.0 * did_df$treated + 
  1.5 * did_df$post + 
  4.2 * (did_df$treated * did_df$post) + # This interaction term is our Causal Estimator!
  rnorm(n_obs, mean = 0, sd = 2.0)


# ==========================================
# 2. ESTIMATING CAUSAL EFFECT VIA OLS (DiD REGRESSION)
# ==========================================
# By using an interaction term (treated * post), OLS automatically calculates 
# the Difference-in-Differences estimator.
causal_model <- lm(employment_rate ~ treated * post, data = did_df)

print("--- Causal Model Regression Summary ---")
summary(causal_model)

# Interpretation of coefficients:
# - treated: Baseline difference between groups before the policy.
# - post: General time trend affecting everyone.
# - treated:post -> THIS IS THE CAUSAL EFFECT of the policy.


# ==========================================
# 3. MANUAL CALCULATION OF DiD (TO SEE THE INTUITION)
# ==========================================
# Let's calculate the group-time means manually to see how DiD works under the hood
did_summary <- did_df |> 
  group_by(treated, post) |> 
  summarise(mean_y = mean(employment_rate), .groups = "drop")

print("--- Group-Time Means Table ---")
print(did_summary)

# Manual calculation steps:
# 1. Change over time for Treatment Group
treat_change <- did_summary$mean_y[did_summary$treated == 1 & did_summary$post == 1] - 
  did_summary$mean_y[did_summary$treated == 1 & did_summary$post == 0]

# 2. Change over time for Control Group (Macro trend)
control_change <- did_summary$mean_y[did_summary$treated == 0 & did_summary$post == 1] - 
  did_summary$mean_y[did_summary$treated == 0 & did_summary$post == 0]

# 3. Difference-in-Differences (Removes macro trend to isolate causality)
manual_did_effect <- treat_change - control_change
cat("\nManually Calculated DiD Causal Effect:", manual_did_effect, "\n")


# ==========================================
# 4. VISUALIZING PARALLEL TRENDS & CAUSAL IMPACT
# ==========================================
plot_data <- did_df |> 
  group_by(treated, post) |> 
  summarise(mean_employment = mean(employment_rate), .groups = "drop") |> 
  mutate(
    Group = if_else(treated == 1, "Treatment Group", "Control Group"),
    Period = if_else(post == 1, "Post-Treatment", "Pre-Treatment")
  )

ggplot(plot_data, aes(x = Period, y = mean_employment, color = Group, group = Group)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  labs(
    title = "Difference-in-Differences Causal Inference",
    subtitle = "Visualizing Parallel Trends and Policy Impact",
    x = "Time Period",
    y = "Average Employment Rate",
    color = "Cohort"
  ) +
  theme_minimal()
###########################################################################
#Day 34
library(pscl)
# Logistic Regression
# Create binary outcome
mtcars$high_mpg <- ifelse(mtcars$mpg > 20, 1, 0)

logit_model <- glm(high_mpg ~ wt + hp, data = mtcars, family = binomial)
summary(logit_model)

# Predicted probabilities
mtcars$pred_prob <- predict(logit_model, type = "response")

# Probit Model
probit_model <- glm(high_mpg ~ wt + hp, data = mtcars, family = binomial(link = "probit"))
summary(probit_model)

# Poisson Regression (for count data)
# install.packages("pscl")
library(pscl)
poisson_model <- glm(cyl ~ wt + hp, data = mtcars, family = poisson)
summary(poisson_model)
###########################################################
#Day 35
# install.packages("forecast")
library(forecast)

# Create time series object
ts_data <- ts(mtcars$mpg, frequency = 12, start = c(2020, 1))

# Basic time series plot
autoplot(ts_data)

# ARIMA Model
arima_model <- auto.arima(ts_data)
summary(arima_model)

# Forecast
forecast_result <- forecast(arima_model, h = 5)
autoplot(forecast_result)

# Alternative: ARIMA with specified order
arima_model2 <- Arima(ts_data, order = c(1, 0, 1))
summary(arima_model2)

# Ljung-Box Test for residual autocorrelation
Box.test(residuals(arima_model), type = "Ljung-Box")

#########################################################################
#Day 36 
# Install the missing dependency package
install.packages("strucchange")

# Now load vars successfully
library(vars)
# ==========================================
# 1. LOAD LIBRARIES AND SETUP DATA
# ==========================================
library(tidyverse)
library(vars) # Essential package for Vector Autoregression analysis

# Simulate two related stationary time series (e.g., GDP Growth and Inflation)
set.seed(2026)
n_periods <- 100

# Simulate base GDP growth series
gdp_growth <- rnorm(n_periods, mean = 3.0, sd = 1.5)

# Simulate an inflation series that responds to lagged GDP growth plus some noise
inflation <- numeric(n_periods)
inflation[1] <- 2.0
for(t in 2:n_periods) {
  inflation[t] <- 1.5 + 0.4 * gdp_growth[t-1] + rnorm(1, mean = 0, sd = 0.8)
}

# Combine the series into a multivariate time-series matrix (ts object)
macro_matrix <- ts(cbind(GDP_Growth = gdp_growth, Inflation = inflation), 
                   start = c(2001, 1), frequency = 4)


# ==========================================
# 2. SELECTING OPTIMAL LAG LENGTH (VARselect)
# ==========================================
# Before running a VAR, we must determine how many lags (p) to include.
# VARselect evaluates Akaike (AIC), Bayesian (BIC/SC), and Hannan-Quinn criteria.
lag_selection <- VARselect(macro_matrix, lag.max = 4, type = "const")

print("--- Optimal Lag Selection Criteria ---")
print(lag_selection$selection)


# ==========================================
# 3. ESTIMATING THE VAR MODEL
# ==========================================
# Estimate the VAR model using 2 lags (or the lag suggested by your VARselect output)
var_model <- VAR(macro_matrix, p = 2, type = "const")

print("--- VAR Model Summary ---")
summary(var_model)


# ==========================================
# 4. GENERATING IMPULSE RESPONSE FUNCTIONS (IRF)
# ==========================================
# IRFs answer the question: "If GDP growth experiences a sudden shock today, 
# how will it impact Inflation over the next 8 quarters?"

irf_gdp_to_inf <- irf(
  var_model, 
  impulse = "GDP_Growth",  # The variable receiving the shock
  response = "Inflation",  # The variable reacting to the shock
  n.ahead = 8,             # How many quarters forward to track
  boot = TRUE              # Compute bootstrap confidence intervals
)

# Plot the impulse response trajectory
plot(irf_gdp_to_inf, 
     main = "Impulse Response: Shock to GDP Growth",
     ylab = "Response of Inflation",
     xlab = "Quarters Ahead")
################################################################################################
#DAY 37 
# Option 1: Using the 'dynlm' package for simple ARDL
# install.packages("dynlm")
library(dynlm)

# Simulate data
set.seed(123)
time <- 1:100
x <- rnorm(100) + cumsum(rnorm(100))*0.1  # I(1) behavior
y <- 2 + 0.5*x + rnorm(100)               # Cointegrated relationship

# ARDL(1,1) model: y_t = c + a1*y_{t-1} + b0*x_t + b1*x_{t-1} + e_t
ardl_dynlm <- dynlm(y ~ L(y, 1) + x + L(x, 1))
summary(ardl_dynlm)

# ==========================================
# Corrected ARDL Workflow
# ==========================================
library(ARDL)

# 1. Create a data frame (ensure y and x are defined)
data_ardl <- data.frame(y, x)

# 2. Use auto_ardl() instead of ardl() for automated lag selection
auto_result <- auto_ardl(y ~ x, data = data_ardl, max_order = 4)

# 3. Extract the best model selected by the algorithm
ardl_model <- auto_result$best_model

# 4. View summary and bounds test
summary(ardl_model)

bounds_test <- bounds_f_test(ardl_model, case = 3) # Case 3: unrestricted intercept, no trend
print(bounds_test)

# 5. Extract long-run coefficients
long_run <- coef(ardl_model, type = "longrun")
print(long_run)
######################################################################
#Day 38
# install.packages("rugarch")
library(rugarch)

# Use built-in financial returns (S&P 500)
data(sp500ret)  # Available in rugarch

# Alternatively, simulate a returns series
set.seed(123)
returns <- rnorm(1000, mean = 0.001, sd = 0.02)  # Example returns

# Step 1: Specify the GARCH model
# sGARCH = Standard GARCH(1,1), ARMA(1,1) for the mean equation
spec <- ugarchspec(
  variance.model = list(model = "sGARCH", garchOrder = c(1, 1)),
  mean.model = list(armaOrder = c(1, 1), include.mean = TRUE),
  distribution.model = "norm"  # Normal distribution
)
print(spec)

# Step 2: Fit the model to the data
garch_fit <- ugarchfit(spec = spec, data = sp500ret)
garch_fit

# Show coefficients (omega, alpha, beta, ar, ma, mu)
coef(garch_fit)

# Step 3: Check residual diagnostics
plot(garch_fit, which = 8)  # QQ-plot
plot(garch_fit, which = 9)  # ACF of standardized residuals

# Step 4: Forecast volatility
garch_forecast <- ugarchforecast(garch_fit, n.ahead = 10)
garch_forecast

# Extract predicted sigma (volatility) for the next 10 days
sigma_forecast <- sigma(garch_forecast)
print(sigma_forecast)

# Step 5: Plot fitted vs actual volatility
plot(garch_fit, which = 3)  # Conditional SD / Volatility plot

