# Load the packages
library(tidyverse)
library(NHANES)

#Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

NHANES %>% colnames()

# Standard R way of "chaining" functions together

glimpse(head(NHANES))

NHANES %>%
  head() %>%
  glimpse()

# Modify an existing variable
NHANES_changed <- NHANES %>%
  mutate(Height = Height / 100)

# create a new variable based on a condition
NHANES_changed <- NHANES_changed %>%
  mutate(HighlyActive = if_else(PhysActiveDays >= 5, "yes", "no"))

# create a new variable based on a condition
NHANES_changed <- NHANES_changed %>%
  mutate(HighlyActive2 = if_else(PhysActiveDays >= 5, 1, 2))

NHANES_changed <- NHANES_changed %>%
  mutate(new_column = "only one value",
         Height = Height / 100,
         UrineVolAverage = (UrineVol1 + UrineVol2)/2)

# Check the names of the variables
colnames(NHANES)

# Pipe the data into mutate function and:
NHANES_modified <- NHANES %>% # dataset
  mutate(
    # 1. Calculate average urine volume
  UrineVolAverage = ((UrineVol1 + UrineVol2)/2),
    # 2. Modify Pulse variable
  Pulse_High_low = if_else(Pulse >= 65, "High", "Low"),
    # 3. Create YoungChild variable using a condition
  YoungChild = if_else(Age >= 6 , TRUE, FALSE)
)

# Select columns/variables by name, without quotes
NHANES_characteristics <- NHANES %>%
  select(Age, Gender, BMI)

# To *not* select a variable, us minus (-)
NHANES %>%
  select(-HeadCirc)

# to selsct similar names, use "matching" functions
NHANES %>%
  select(starts_with("BP"), contains("Vol"))

?select_helpers

# rename(): Rename specific columns

# rename using the form: "newname = oldname"
NHANES %>%
  rename(Numberbabies = nBabies)

# rememmber to assign it to a dataset otherwise it is not saved
# NHANES %>%
# rename(Numberbabies = nBabies)

# filter(): Filtering/subsetting the data by row

# when gender is equal to
NHANES %>%
  filter(Gender == "female")

# Or opposite to
NHANES %>%
  filter(Gender != "female")

# when BMI is equal to
NHANES %>%
  filter(BMI == 25)

# BMI and gender
NHANES %>%
  filter(BMI == 25 & Gender == "female")

# ascending order by age
NHANES %>%
  arrange(Age) %>%
  select(Age)

# order by age and gender
NHANES %>%
  arrange(Age, Gender) %>%
  select(Age, Gender)

# Exercises
# To see values of categorical data
summary(NHANES)

# 1. BMI between 20 and 40 and who have diabetes
NHANES %>%
  # format: variable >= number
  filter(BMI >= 20 & BMI <= 40 & Diabetes == "Yes")

# 2. Working or renting, and not diabetes
NHANES %>%
  filter(Work == "Working" | HomeOwn == "Rent" & Diabetes == "No") %>%
  select(Work, HomeOwn, Diabetes)


# summarise() by itself (na=not available, rm=removed)
NHANES %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))
# combine with group_by()
NHANES %>%
  group_by(Gender) %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))

NHANES %>%
  group_by(Gender, Diabetes) %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))

# new section -> code -> new section

#  gather(): converting from wide to long ---------------------------------
# Original data
table4b

#Convert to long form by stacking population by each year
# Use minue to exclude a variable (country) from being "gathered"
table4b %>%
  gather(key = year, value = population, -country)

table4b %>%
  gather(key = year, value = population, '1999', '2000')

# keep only variables of interest
NHANES_char <- NHANES%>%
  select(SurveyYr, Gender, Age, Weight, Height, BMI, BPSysAve)

# convert to long form, excluding year and gender
NHANES_long <- NHANES_char %>%
  gather(Measure, Value, -SurveyYr, -Gender)
NHANES_long

# calculate mean on each measure
NHANES_long %>%
  group_by(SurveyYr, Gender, Measure) %>%
  summarise(MeanValues = mean(Value, na.rm = TRUE))

# from long to wide use spread()
