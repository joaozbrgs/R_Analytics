# libraries
library(dplyr)
library(tidyr)

# Importing Data

df.p1 <- read.csv(
    fileEncoding = 'UTF-8',             # In some cases, use other encoding, like 'latin1'
    na.strings = c('NA', ''),           # Define empty string as NULL
    file = './datasets/person1.csv',    # Accessing the file
    sep = ',',                          # Defining the CSV separator
    dec = '.'                           # Defining the float separator
)

df.p2 <- read.csv(
    fileEncoding = 'UTF-8',
    na.strings = c('NA', ''),
    file = './datasets/person2.csv',
    sep = ',',
    dec = '.'
)

df.main <- full_join(df.p1, df.p2)
df.main <- df.main[-1]


# Exploratory Analysis

# print(dim(df.main))
# print(str(df.main))
# print(colSums(is.na(df.main)))

# Applying proper correcting measures

df.main$year_salary <- as.numeric(
    gsub(
        '\\$', '', df.main$year_salary
    )
)

df.main$date_of_birth <- as.Date(
    df.main$date_of_birth, '%d/%m/%Y'
)



split_mail <- setNames(
    do.call(rbind.data.frame, 
        strsplit(
            unlist(df.main$email), 
             '@')
            ),
    c("col2", "col3"))

split_mail2 <- df.main[3] %>%
    separate(email, into = c('col1', 'col2'), sep = '@')


print(head(df.main))