# libraries:
library(dplyr)

# Gathering data
df.cisgender <- read.csv(
    file = './datasets/person1.csv'
)

df.lgbt <- read.csv(
    file = './datasets/person2.csv'
)

# Joining to create a main dataframe with all data
df.main <- full_join(df.cisgender, df.lgbt)

# Create a dim_Gender with unique values
dim_Gender <- df.main$gender %>%
    summarise(gender = n_distinct(gender)) %>%
    arrange(asc(gender))
# names(dim_Gender)

# print(View(df.main))
print(dim_Gender)