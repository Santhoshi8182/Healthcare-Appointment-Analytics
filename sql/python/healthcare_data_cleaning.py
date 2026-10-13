
import pandas as pd

# Load the original dataset
df = pd.read_csv("KaggleV2-May-2016.csv")

# Remove extra spaces from column names
df.columns = df.columns.str.strip()

# Convert date columns to datetime
df["ScheduledDay"] = pd.to_datetime(df["ScheduledDay"])
df["AppointmentDay"] = pd.to_datetime(df["AppointmentDay"])

# Remove duplicate records
df = df.drop_duplicates()

# Remove records with invalid negative ages
df = df[df["Age"] >= 0]

# Standardize no-show values
df["No-show"] = df["No-show"].str.strip().str.title()

# Display dataset information
print("Cleaned dataset shape:", df.shape)
print("\nMissing values:")
print(df.isnull().sum())

print("\nNo-show distribution:")
print(df["No-show"].value_counts())

# Export the cleaned dataset
df.to_csv("healthcare_cleaned_final.csv", index=False)

print("\nCleaned dataset saved successfully.")
