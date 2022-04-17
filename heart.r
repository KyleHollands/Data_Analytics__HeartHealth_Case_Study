# Load the required libraries and set options
library(tidyverse)
library(janitor)
library(readr)
library(tidyr)
library(chron)
library(dplyr)
library(readr)
library(lubridate)
library("ggridges")
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

# Investigate data further for bias, missing data, extreme outliers, etc.
table(heart_health_metrics$Sex) # Sampling bias found.
aggregate(heart_health_metrics$Age ~ heart_health_metrics$Sex, FUN = mean) # The average age appears to be relatively the same between Males and Females sampled.
sapply(heart_health_metrics, function(x) sum(is.na(x))) # There are no N/A's within the data.

heart_health_metrics %>%
  filter(Sex == "F", ) %>%
  summarize(min_age = min(Age),
            max_age = max(Age),
            min_resting_bp = min(RestingBP),
            max_resting_bp = max(RestingBP),
            min_chol = min(Cholesterol), # There are many rows with 0, indicating data was not collected for some individuals.
            max_chol = max(Cholesterol), # Possible error in max_chol.
            min_max_hr = min(MaxHR),
            max_max_hr = max(MaxHR))

heart_health_metrics %>%
  filter(Sex == "M", ) %>%
  summarize(min_age = min(Age),
            max_age = max(Age),
            min_resting_bp = min(RestingBP),
            max_resting_bp = max(RestingBP),
            min_chol = min(Cholesterol), # There are many rows with 0, indicating data was not collected for some individuals.
            max_chol = max(Cholesterol), # Possible error in max_chol.
            min_max_hr = min(MaxHR),
            max_max_hr = max(MaxHR))

# Start comparing variables for further insight.

heart_health_metrics %>%
  group_by(Sex) %>%
  summarize(AVG_Chol = mean(Cholesterol)) # Females appear to have higher Cholesterol on average.

heart_health_metrics %>%
  group_by(Sex) %>%
  summarize(AVG_RestingBP = mean(RestingBP)) # Females and Males seem to have similar average resting blood pressure.

heart_health_metrics %>%
  group_by(Sex) %>%
  summarize(AVG_MaxHR = mean(MaxHR)) # Female average max heart rate is higher.

table(heart_health_metrics$RestingECG,
heart_health_metrics$ChestPainType,
heart_health_metrics$Sex,
heart_health_metrics$FastingBS,
heart_health_metrics$HeartDisease) # Asymptomatic chest pain type with normal ECG readings in Males appears to show the highest rates of HeartDisease.

ggplot(heart_health_metrics,
       aes(x = Age,
           y = Cholesterol,
           colour = Sex,
           shape = ChestPainType,
           size = RestingECG,
           alpha = FastingBS)) +
  geom_point(size = 2.5) +
  facet_grid(. ~ HeartDisease) +
  labs(
    x = "Age",
    y = "Cholesterol (mm/dl)",
    title = "Heart Disease Factors")

# Initial plot to visualize correlations and trends.
ggplot(heart_health_metrics, aes(x = Age, y = Cholesterol)) +
  geom_point(aes(col = Sex, size = RestingECG, shape = ChestPainType, alpha = FastingBS)) +
  geom_smooth(method="loess", se=F) +
  ylim(c(50, 600)) +
  facet_grid(Sex ~ HeartDisease) +
  labs(
    x = "Age",
    y = "Cholesterol (mm/dl)",
    title = "Heart Disease Factors")
