# Load the required libraries and set options
library(tidyverse)
library(janitor)
library(readr)
library(tidyr)
library(chron)
library(dplyr)
library(readr)
library(lubridate)
options("scipen"=10)

# Import the dataset
heart_health_metrics <- read.csv("./Datasets/Modified CSV/heart.csv")

# Inspect the dataset
colnames(heart_health_metrics)
glimpse(heart_health_metrics)
nrow(heart_health_metrics)
dim(heart_health_metrics)
head(heart_health_metrics)
tail(heart_health_metrics)
summary(heart_health_metrics)
str(heart_health_metrics)
View(heart_health_metrics)

# Complete initial analysis for bias, errors and discrepancies.
table(heart_health_metrics$Sex) # Sampling bias found.
aggregate(heart_health_metrics$Age ~ heart_health_metrics$Sex, FUN = mean)

heart_health_metrics %>%
  filter(Sex == "F", ) %>%
  summarize(min_age = min(Age),
            max_age = max(Age),
            min_resting_bp = min(RestingBP),
            max_resting_bp = max(RestingBP),
            min_chol = min(Cholesterol),
            max_chol = max(Cholesterol), # Possible error in max_chol.
            min_max_hr = min(MaxHR),
            max_max_hr = max(MaxHR))

heart_health_metrics %>%
  filter(Sex == "M", ) %>%
  summarize(min_age = min(Age),
            max_age = max(Age),
            min_resting_bp = min(RestingBP),
            max_resting_bp = max(RestingBP),
            min_chol = min(Cholesterol),
            max_chol = max(Cholesterol), # Possible error in max_chol.
            min_max_hr = min(MaxHR),
            max_max_hr = max(MaxHR))
