# Data_Analytics__HeartHealth_Case_Study

## Ask

> Guiding questions

- What topic are you exploring?
    - The topic of this analysis will focus on metrics that may contribute to heart disease.

- What is the problem you are trying to solve?
    - Can the metrics included in this analysis predict a greater chance of heart disease? And if so, how can that information be leveraged to offset it.

- What metrics will you use to measure your data to achieve your objective?
    - The main metrics used in this analysis will be age, sex, resting bp,
    cholesterol, fasting bs, max hr and exercise angina. There is also another metric
    indicating whether a particular individual was already known to have heart
    disease prior to having these specific metrics acquired.

- Who are the stakeholders?
    - For this hypothetical scenario, the stakeholders are medical professionals or drug manufacturers that could benefit from the insights gained from this analysis. It could lead to earlier recommendations or treatments for individuals who are showing early signs of heart disease, such as a change in diet, exercise habits, etc.

- Who is your audience?
    - The potential audience could be numerous. On one side, it could include individuals, such as drug makers and medical professionals that can leverage the insights gained from this analysis to better treat patients. 
    - It could also be leveraged to provide more general recommendations and guidelines to the public on nutrition and exercise, such as improving diet to lower cholesterol or blood pressure.

- How can your insights help your client make decisions?
    - If the insights gained from this analysis provide a strong indication that these metrics in some way contribute to a greater chance of heart disease, the client can leverage it to provide better services or treatments for their patients.

> Key tasks

- Identify the business task **

- Determine key stakeholders **

- Choose a dataset **

- Establish metrics **

> Deliverable

A clear statement of the business task you have selected to investigate **
## Prepare

> Guiding questions 

- Where is your data located?
    - The original data is stored within a CSV file located on OneDrive and locally. The modified dataset (after preliminary cleaning and organizing in Excel) is located in another folder dedicated to it.
    - The dataset is then imported into Visual Studio Code (R) for further cleaning, organization and analysis.

- How is the data organized? 
    - The data is organized into integers, doubles and characters. There are numerous rows containing data
    pertaining to individuals, such as age, sex, resting blood pressure, etc.

- Are there issues with bias or credibility in this data? Does your data ROCCC?
    - After completing initial anaylsis on the data, it turns out that there may be sampling bias present within the dataset.
    - Although heart disease tends to effect males more on average, there are substantially more males represented in this data than women.

- How are you addressing licensing, privacy, security, and accessibility?
    - The dataset was acquired from Kaggle, and is open to the public to be analyzed. The data itself is being stored on OneDrive, and locally so there is some redundancy present. 

- How did you verify the data’s integrity?
    - One method to verify the data's integrity is to compare it to the source after it's been downloaded. Comparing the file size can provide an indication if something in the data has changed, or been manipulated.

- How does it help you answer your question?

- Are there any problems with the data?
    - There does not appear to be any serious issues with the data. There are some minor issues, such as reformating a variable represented as True/False as 1/0 for easier analysis, or the fact there are some outliers in the data that could be errors.

> Key Tasks

- Download data and store it appropriately. **

- Identify how it’s organized. **

- Sort and filter the data. **

- Determine the credibility of the data. **

> Deliverable 

A description of all data sources used **

## Process

Guiding questions 

- What tools are you choosing and why?
    - After initially using Excel for some preliminary analysis, I'll primarily be using R for the rest of the analysis, visualizations and presentation. I might utilize Tableau for visualizations as well.

- Have you ensured your data’s integrity?
    - After acquiring the dataset from the Kaggle website, the integrity of the data appears to be in tact as the size of the dataset is the same as its source.
    - The formatting of the data is consistent, and although one column was modified to be analyzed easier, it does not change the representation of it.
    - No data has been removed or added to the dataset, therefore the integrity is intact.
    - Another important thing to consider is, depending on the analysis, is there bias within the data? In this case, there does appear to be a certain degree of sampling bias, as the overall sample consists of far more Males than Females.

- What steps have you taken to ensure that your data is clean?
    - I first inspected the CSV file, filtering the data, running a pivot table, sorting it, etc to try and
    discern any errors or discrepancies from the outset.
    - I then imported the data into Visual Studio Code (R), and started checking for NA's, missing values and extreme outliers that might indicate errors, and so forth.
    - There was a sampling bias discovered between Males and Females, but for the purposes of this analysis, it doesn't play a critical role in the outcome.

- How can you verify that your data is clean and ready to analyze?
    - I double-checked the data for NA's, extreme outliers that would skew the results and values that are 0 that are likely errors.

- Have you documented your cleaning process so you can review and share those results?