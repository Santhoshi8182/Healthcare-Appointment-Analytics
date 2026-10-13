# Healthcare Appointment Analytics

## Project Overview
This project analyzes hospital appointment data to identify patterns associated with missed appointments and understand how attendance varies across patient demographics, waiting times, and SMS reminder status.

## Business Objective
- Measure the overall appointment no-show rate.
- Analyze missed appointments by gender and age group.
- Examine the relationship between waiting time and appointment attendance.
- Compare no-show rates for appointments with and without SMS reminders.
- Present findings through an interactive Power BI dashboard.

## Tools and Technologies
- Python
- Pandas
- MySQL
- Power BI
- DAX

## Dataset
Medical Appointment No Shows dataset from Kaggle.

The cleaned dataset contains 110,526 appointment records.

## Data Cleaning
- Standardized column names.
- Converted appointment date columns to datetime in Python.
- Removed duplicate records.
- Removed records with invalid negative ages.
- Standardized the `No-show` values.

## Key Performance Indicators
- Total appointments: 110,526
- Attended appointments: 88,207
- Missed appointments: 22,319
- Overall no-show rate: 20.19%

## Dashboard Analysis
The Power BI dashboard includes:
1. Missed Appointments by Waiting Time
2. Missed Appointments by Gender
3. Missed Appointments by Age Group
4. No-Show Rate by SMS Reminder Status

## Key Findings
- Approximately 20.19% of appointments were missed.
- No-show rates differed across waiting-time and age groups.
- Female and male appointment no-show rates were similar.
- The SMS groups showed different no-show rates. This is an association and does not establish that SMS reminders cause missed appointments.

## Business Value
The analysis helps healthcare providers understand appointment attendance patterns and identify areas for further investigation and improvement.

## Future Improvements
- Add attendance-rate analysis by weekday.
- Explore interactive filters for demographics and appointment dates.
- Investigate additional factors associated with missed appointments.


## Power BI Dashboard

![Healthcare Appointment Analytics Dashboard](dashboard.png)
## Author
Santhoshi
 
