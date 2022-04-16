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

# Complete initial analysis for bias and discrepancies.
table(heart_health_metrics$Sex)
aggregate(heart_health_metrics$Age ~ heart_health_metrics$Sex, FUN = mean)

max(heart_health_metrics$Age)
max(heart_health_metrics$RestingBP)
max(heart_health_metrics$Cholesterol)
max(heart_health_metrics$MaxHR)
max(heart_health_metrics$)


