library(tidyr)
library(dplyr)
library(ggplot2)

# Import data from CSV
df.main <- read.csv(
    fileEncoding = 'UTF-8',             # In some cases, use other encoding, like 'latin1'
    na.strings = c('NA', ''),           # Define empty string as NULL
    file = './datasets/person2.csv',    # Accessing the file
    sep = ',',                          # Defining the CSV separator
    dec = '.'                           # Defining the float separator
)

print(head(df.main))      # Return the top rows of the dataframe
print(dim(df.main))       # List amount of rows and columns respectively
print(colnames(df.main))  # List the name of the columns
print(str(df.main))       # List the data types of each field (column)
print(glimpse(df.main))   # Return a more complete description of the dataframe
print(View(df.main))      # list all the dataframe information

# Removing ($) from year_salary and converting to numeric
df.main$year_salary <- as.numeric(
    gsub(
        '\\$', '', df.main$year_salary
    )
)      
print(head(df.main$year_salary))


# ?summary
print(summary(df.main$year_salary))

# Transforming Data
# Currently, the field 'date_of_birth' is set as 'chr'. We will convert it to date
# ?as.Date
df.main$date_of_birth <- as.Date(df.main$date_of_birth, '%d/%m/%Y')
print(str(df.main)) # Check if it worked

# Create a new column with only Year and Month
# ?format
df.main$short.date_of_birth <- format(
    df.main$date_of_birth, '%Y/%m'
)
print(head(df.main))
print(glimpse(df.main$gender))


# Filtering only values within the range
# ?dplyr::select
# ?dplyr::filter
df1 <- df.main %>%
    select(year_salary) %>%
    filter(year_salary >= 40000 & year_salary <= 100000)

print(glimpse(df1))

# Calculate Standard Deviation
print(sd(df.main$year_salary))

# Find NULL values
# ?is.na
# ?colSums
print(colSums(is.na(df.main)))

# Find amount of categories in column 'n'
df.main$gender <- factor(df.main$gender)
print(str(df.main$gender))

# Verifying amount of registers in each field
print(table(df.main$gender))

# Verifying percentage of registers in each field
print(
    prop.table(
        table(df.main$gender)) * 100
)
print(str(df.main))


# Creating a Histogram
hist(df.main$year_salary)

# Creating a Boxplot
boxplot(df1$year_salary)