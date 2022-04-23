# Load the required libraries and set options
library(tidyverse)
library(janitor)
library(readr)
library(tidyr)
library(chron)
library(dplyr)
library(readr)
library(lubridate)
library(ggridges)
library(directlabels)
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

# Remove any rows where Cholesterol equates to 0.
heart_health_metrics <- heart_health_metrics[!(heart_health_metrics$Cholesterol <= 0),]

# Rename some of the columns.
heart_health_metrics <- rename(heart_health_metrics,
  RestingBloodPressure = RestingBP,
  FastingBloodSugar = FastingBS,
  MaxHeartRate = MaxHR)

heart_health_metrics %>%
  filter(Sex == "F", ) %>%
  summarize(min_age = min(Age),
            max_age = max(Age),
            min_resting_bp = min(RestingBloodPressure),
            max_resting_bp = max(RestingBloodPressure),
            min_chol = min(Cholesterol), # There are many rows with 0, indicating data was not collected for some individuals.
            max_chol = max(Cholesterol), # Possible error in max_chol.
            min_max_hr = min(MaxHeartRate),
            max_max_hr = max(MaxHeartRate))

heart_health_metrics %>%
  filter(Sex == "M", ) %>%
  summarize(min_age = min(Age),
            max_age = max(Age),
            min_resting_bp = min(RestingBloodPressure),
            max_resting_bp = max(RestingBloodPressure),
            min_chol = min(Cholesterol), # There are many rows with 0, indicating data was not collected for some individuals.
            max_chol = max(Cholesterol), # Possible error in max_chol.
            min_max_hr = min(MaxHeartRate),
            max_max_hr = max(MaxHeartRate))

# Start comparing variables for further insight.

heart_health_metrics %>%
  group_by(Sex) %>%
  summarize(AVG_Chol = mean(Cholesterol)) # Females appear to have higher Cholesterol on average.

heart_health_metrics %>%
  group_by(Sex) %>%
  summarize(AVG_RestingBloodPressure = mean(RestingBloodPressure)) # Females and Males seem to have similar average resting blood pressure.

heart_health_metrics %>%
  group_by(Sex) %>%
  summarize(AVG_MaxHeartRate = mean(MaxHeartRate)) # Female average max heart rate is higher.

# Comparing average Age for those with and without Heart Disease.
aggregate(heart_health_metrics$Age ~ heart_health_metrics$HeartDisease, FUN = mean) # Around the age of 55 appears to be the peak of Heart Disease.

# Comparing average RestingBloodPressure for those with and without Heart Disease.
aggregate(heart_health_metrics$RestingBloodPressure ~ heart_health_metrics$HeartDisease, FUN = mean) # Although the difference between blood pressure for those with and without Heart Disease appears to be # nolint
# negligible, this indicates that a higher blood pressure is somewhat associated with a higher risk of Heart Disease. Blood Pressure of under 120 is considered normal.

# Comparing average Cholesterol for those with and without Heart Disease.
aggregate(heart_health_metrics$Cholesterol ~ heart_health_metrics$HeartDisease, FUN = mean)

# Comparing FastingBloodSugar (diabetic or not) for those with and without Heart Disease.
aggregate(heart_health_metrics$FastingBloodSugar ~ heart_health_metrics$HeartDisease, FUN = sum) # This indicates that pre-diabetics and diabetics are at a higher risk of Heart Disease.

# Comparing MaxHeartRate for those with and without Heart Disease.
aggregate(heart_health_metrics$MaxHeartRate ~ heart_health_metrics$HeartDisease, FUN = mean)

# Comparing ExerciseAngina for those with and without Heart Disease.
aggregate(heart_health_metrics$ExerciseAngina ~ heart_health_metrics$HeartDisease, FUN = mean) # Those with exercise angina appear to be a greater risk of Heart Disease.

# Comparing Oldpeak (ST-T wave abnormality) for those with and without Heart Disease.
aggregate(heart_health_metrics$Oldpeak ~ heart_health_metrics$HeartDisease, FUN = mean) # Those with ST-T wave abnormalities in their ECG readings are at a higher risk of Heart Disease.

# Comparing ST_Slope (ST-T wave abnormality) of peak exercise for those with and without Heart Disease. # An ST Slope of either flat or down is associated with a higher risk of Heart Disease.
aggregate(heart_health_metrics$HeartDisease ~ heart_health_metrics$ST_Slope, FUN = mean)

# Comparing ChestPainType for those with and without Heart Disease.
aggregate(heart_health_metrics$HeartDisease ~ heart_health_metrics$ChestPainType, FUN = mean) # Those with asymptomatic chest pain appear to be at the highest risk. This likely indicates
# that the absense of an indicator, such as chest pain, causes a delay in testing and treatment.

# Comparing Resting ECG for those with and without Heart Disease.
aggregate(heart_health_metrics$HeartDisease ~ heart_health_metrics$RestingECG, FUN = mean) # ST-T wave abnormalities appear to be associated with a higher risk of Heart Disease.

table(heart_health_metrics$RestingECG,
heart_health_metrics$ChestPainType,
heart_health_metrics$Sex,
heart_health_metrics$FastingBloodSugar,
heart_health_metrics$HeartDisease) # Asymptomatic chest pain type with normal ECG readings in Males appears to show the highest rates of HeartDisease.

heart_disease_labels <- c(
                    `0` = "Confirmed Heart Disease",
                    `1` = "Unconfirmed Heart Disease",
                    )

# Comparing the three basic metrics for Heart Disease (Age, Cholesterol and Blood Pressure)
# to diabetes and confirmed Heart Disease.

ggplot(heart_health_metrics, aes(x = Age, y = Cholesterol)) +
  geom_point(aes(color = FastingBloodSugar)) +
  geom_smooth(method="loess", se=F, aes(x = Age, y = RestingBloodPressure)) +
  facet_grid(Sex ~ HeartDisease) +
  ylim(100,600) +
  scale_color_viridis_b() +
  guides(color = FALSE) +
  labs(
    x = "Age", y = "Cholesterol (mm/dl)",
    color = NULL,
    title = "Does Diabetes contribute to Heart Disease?",
    subtitle = "Light Green = Pre-Diabetic / Diabetic",
    caption = "Source: Kaggle - Heart Failure Prediction Dataset"
  )

# Comparing the three basic metrics for Heart Disease (Age, Cholesterol and Blood Pressure)
# to Oldpeak (ST-T wave abnormality) and confirmed Heart Disease.

ggplot(heart_health_metrics, aes(x = Age, y = Cholesterol)) +
  geom_point(aes(color = Oldpeak)) +
  geom_smooth(method="loess", se=F, aes(x = Age, y = RestingBloodPressure)) +
  facet_grid(Sex ~ HeartDisease) +
  ylim(100,600) +
  scale_color_viridis_b() +
  guides(color = FALSE) +
  labs(
    x = "Age", y = "Cholesterol (mm/dl)",
    color = NULL,
    title = "Does an ST-T wave abnormality contribute to Heart Disease?",
    subtitle = "Green -> Yellow = increased abnormality",
    caption = "Source: Kaggle - Heart Failure Prediction Dataset"
  )

# Comparing the three basic metrics for Heart Disease (Age, Cholesterol and Blood Pressure)
# to ST_Slope (ECG Wave types) and confirmed Heart Disease.

ggplot(heart_health_metrics, aes(x = Age, y = Cholesterol)) +
  geom_point(aes(alpha = ST_Slope)) +
  geom_smooth(method="loess", se=F, aes(x = Age, y = RestingBloodPressure)) +
  facet_grid(Sex ~ HeartDisease) +
  ylim(100,600) +
  labs(
    x = "Age", y = "Cholesterol (mm/dl)",
    color = NULL,
    title = "What ECG wave types contribute to a higher risk of Heart Disease?",
    subtitle = "Lighter Grey = higher risk ECG type",
    caption = "Source: Kaggle - Heart Failure Prediction Dataset"
  )

# Comparing the three basic metrics for Heart Disease (Age, Cholesterol and Blood Pressure)
# to Exercise Angina and confirmed Heart Disease.

ggplot(heart_health_metrics, aes(x = Age, y = Cholesterol)) +
  geom_point(aes(color = ExerciseAngina)) +
  geom_smooth(method="loess", se=F, aes(x = Age, y = RestingBloodPressure)) +
  facet_grid(Sex ~ HeartDisease) +
  labs(
    x = "Age", y = "Cholesterol (mm/dl)",
    color = NULL,
    title = "Does Exercise Angina contribute to Heart Disease?",
    subtitle = "Light blue = Exercise Angina",
    caption = "Source: Kaggle - Heart Failure Prediction Dataset"
  )
