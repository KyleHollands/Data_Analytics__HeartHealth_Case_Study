# Data_Analytics__HeartHealth_Case_Study

## Ask

> Guiding questions

- What topic are you exploring?
    - The topic of this analysis will focus on metrics that may contribute to heart disease.

- What is the problem you are trying to solve?
    - Can the metrics included in this analysis predict a greater chance of heart disease? And if so, how can that information be leveraged to offset it.

- What metrics will you use to measure your data to achieve your objective?
    - The primary metrics used in this analysis will be age, sex, resting bp,
    cholesterol, fasting bs, max hr and exercise angina. Another metric indicates whether a particular individual was already known to have heart
    disease before acquiring these metrics.

- Who are the stakeholders?
    - For this hypothetical scenario, the stakeholders are medical professionals or drug manufacturers that could benefit from the insights gained from this analysis. It could lead to earlier recommendations or treatments for individuals showing early signs of heart disease, such as a change in diet, exercise habits, etc.

- Who is your audience?
    - The potential audience could be numerous. On one side, it could include individuals, such as drugmakers and medical professionals, that can leverage the insights gained from this analysis to treat patients better. 
    - It could also be leveraged to provide more general recommendations and guidelines to the public on nutrition and exercise, such as improving diet to lower cholesterol or blood pressure.

- How can your insights help your client make decisions?
    - If the insights gained from this analysis provide a strong indication that these metrics in some way contribute to a greater chance of heart disease, the client can leverage it to provide better services or treatments for their patients.

> Key tasks

- Identify the business task **

- Determine key stakeholders **

- Choose a dataset **

- Establish metrics **

> Deliverable

- A clear statement of the business task you have selected to investigate **
## Prepare

> Guiding questions 

- Where is your data located?
    - The original data is stored within a CSV file located on OneDrive and locally. The modified dataset (after preliminary cleaning and organizing in Excel) is located in another folder dedicated to it.
    - The dataset is then imported into Visual Studio Code (R) for further cleaning, organization and analysis.

- How is the data organized? 
    - The data is organized into integers, doubles and characters. There are numerous rows containing data
    about individuals, such as age, sex, resting blood pressure, etc.

- Are there issues with bias or credibility in this data? Does your data ROCCC?
    - After completing an initial analysis of the data, it turns out that there may be sampling bias present within the dataset.
    - Although heart disease tends to affect males more on average, there are substantially more males represented in this data than women.

- How are you addressing licensing, privacy, security, and accessibility?
    - The dataset was acquired from Kaggle and is open to the public to be analyzed. The data itself is being stored on OneDrive, and locally so there is some redundancy present. 

- How did you verify the data's integrity?
    - One method to verify the data's integrity is to compare it to the source after it's been downloaded. Comparing the file size can provide an indication that something in the data has changed or been manipulated.

- How does it help you answer your question?

- Are there any problems with the data?
    - There do not appear to be any serious issues with the data. There are some minor issues, such as reformating a variable represented as True/False as 1/0 for more accessible analysis or the fact there are some outliers in the data that could be errors.

> Key Tasks

- Download data and store it appropriately. **

- Identify how it's organized. **

- Sort and filter the data. **

- Determine the credibility of the data. **

> Deliverable 

- A description of all data sources used **

## Process

> Guiding questions 

- What tools are you choosing and why?
    - After initially using Excel for some preliminary analysis, I'll primarily be using R for the rest of the analysis, visualizations and presentation. I might utilize Tableau for visualizations as well.

- Have you ensured your data's integrity?
    - After acquiring the dataset from the Kaggle website, the integrity of the data appears to be intact as the size of the dataset is the same as its source.
    - The formatting of the data is consistent, and although one column was modified to be analyzed easier, it does not change its representation of it.
    - No data has been removed or added to the dataset; therefore, the integrity is intact.
    - Another essential thing to consider is, depending on the analysis, is there bias within the data? In this case, there does appear to be a certain degree of sampling bias, as the overall sample consists of far more Males than Females.

- What steps have you taken to ensure that your data is clean?
    - I first inspected the CSV file, filtering the data, running a pivot table and sorting it to try and
    identify any errors or discrepancies from the outset. No initial manipulation of the data was necessary in Excel, however, I was able to discern preliminary trends in the data to focus on during primary analysis.
    - I then imported the data into Visual Studio Code (R) and started checking for NA's, missing values and extreme outliers that might indicate errors, biases, etc.
    - There was a sampling bias discovered between Males and Females, but it doesn't play a critical role in the outcome of this analysis, as this is looking at overall risk factors of Heart Disease.
    - Some columns were then renamed for readability.
    - Some rows exist where Resting Blood Pressure and Cholesterol were 0, which likely an error in the initial data acquisition. 


- How can you verify that your data is clean and ready to analyze?
    - I double-checked the data for NA's, extreme outliers that would skew the results and values that are 0 that are likely errors.

- Have you documented your cleaning process to review and share those results?
    - The cleaning process has been documented in a prior question.

> Key Tasks

- Check the data for errors. **
- Choose your tools. **
- Transform the data so you can work with it effectively. **
- Document the cleaning process. **

> Deliverable 

- Documentation of any cleaning or manipulation of data **

## Analyze

> Guiding Questions

- How should you organize your data to perform analysis on it?
    - The data being analyzed already came combined from multiple datasets. I imported it into Visual Studio Code (R) which allowed me to start analyzing it a lot more efficiently.
    - The original data is stored separate from the modified CSV.

- Has your data been properly formatted?
    - The data does appear to be properly formatted upon being imported into R.

- What surprises did you discover in the data?
    - There are some missing values for Resting Blood Pressure and Cholesterol. There also appear to be a few outliers in the data, such as high Cholesterol values.
    - A sampling bias appears to exist, as there are far more males represented in the data than females. For the purposes of this analysis, however, it does not impact the insights.
    - 

- What trends or relationships did you find in the data?
    - A higher Cholesterol may indicate a greater risk of Heart Disease.
    - There is a higher risk of Heart Disease, on average, around the ages of 50-55.
    - Pre-diabetes/diabetes appears to lead to a greater risk of heart disease.
    - Experiencing exercise angina is a substantial indicator of potential heart disease.
    - Abnormalities in ECG readings, such as an ST-T wave abnormality, may indicate a greater risk of heart disease.
    - Asymptomatic chest pain type appears to lead to a greater risk of heart disease. However, this just simply means that an individual who has not experienced chest pain, did not have that indicator as a early warning.
    - In contrast to what I had originally thought, it appears a lower max heart rate may be indicative of future heart disease. This could show a decreased capability of the heart due to underlying conditions.

- How will these insights help answer your business questions?
    - These insights will allow for individuals that experience them to take the necessary steps to help lessen their chance of heart disease.
    - For example, those that are in a pre-diabetic/diabetic (type 2) stage, can make fitness and dietary changes.
    - Those with high cholesterol or higher blood pressure can also make similar changes based on this information.

> Key tasks 

- Aggregate your data so it’s useful and accessible. **

- Organize and format your data. **

- Perform calculations. **

- Document your calculations to keep track of your analysis steps. **

- Identify trends and relationships. **

> Deliverable 

- A summary of your analysis **

## Share

> Guiding questions

- Were you able to answer the business question?
    - Yes. Based on the data analyzed, the metrics indicated do show a degree of correlation to Heart Disease.

- What story does your data tell?
    - The story behind this data, is that there are several key metrics that can help determine whether an individual has a greater chance of Heart Disease or not. With this information, physicians can make data-informed decisions on how to best mitigate their impact.

- How do your findings relate to your original question?
    - The original question revolved around what metrics may contribute to Heart Disease, and the findings directly relate by substantiating the connection between the two.

- Who is your audience? What is the best way to communicate with them?
    - The audience could be physicians or healthcare practitioners that need the data to make informed decisions when assisting their patients. Second to this, individuals themselves that are managing their health and trying to lessen the impact of these contributors would benefit from this knowledge.

- Can data visualization help you share your findings?
    - The data visualizations provide a more succinct and obvious correlation between the metrics analyzed and Heart Disease. 

- Is your presentation accessible to your audience?
    - The visualizations make the findings more presentable to any group as it makes the connections more clear.

> Key tasks

- Determine the best way to share your findings. **

- Create effective data visualizations. **

- Present your findings. **

- Ensure your work is accessible. **

> Deliverable

- Supporting visualizations and key findings **

## Act

> Guiding questions

- What is your final conclusion based on your analysis?
    - The common and more uncommon metrics outlined in this analysis do, to some degree, appear to contribute to a greater chance of Heart Disease. With this information individuals can speak with their physicians to make the necessary lifestyle changes to help mitigate some of them, and received required treatments for others.

- How could your team and business apply your insights?
    - The information acquired from these insights could be used to help mitigate heart disease by treating underlying risk factors, such as diabetes, high cholesterol, blood pressure, etc. 

- What next steps would you or your stakeholders take based on your findings?
    - Passing this information onto healthcare professionals to better identify early signs of Heart Disease in their patients would take priority. With that, steps to try and mitigate the impact of these metrics could be taken, such as dietary, physical and mental changes.

- Is there additional data you could use to expand on your findings?
    - 

> Key tasks

- Create your portfolio. **

- Add your case study. **

- Practice presenting your case study to a friend or family member. **

> Deliverable

- Your top high-level insights based on your analysis Based on what you discover, a list of additional deliverables you think would be helpful to include for further exploration
    - There is a clear connection between the more common contributors, such as high Cholesterol, Blood Pressure and Age and Heart Disease. Furthermore, the metrics analyzed in this study indicate there is a certain degree of correlation between them and developing Heart Disease later in life.
    - It would be interesting to now delve into what steps can be taken to help mitigate heart disease, such as exercise and diet, among others.
        - For diet, analysis could be completed on what types of foods are best for reversing diabetes, lowering cholesterol and blood pressure.
        - In terms of exercise, data could be collected and analyzed on which types of exercises are most beneficial for strengthening the heart, whether anaerobic or aerobic.