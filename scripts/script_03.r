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

# Fix 'date_of_birth' 
df.main$date_of_birth <- as.Date(
    df.main$date_of_birth, '%d/%m/%Y'
)

# Fix 'year_salary'
df.main$year_salary <- as.numeric(
    gsub(
        '\\$', '', df.main$year_salary
    )
)

# Create 'MM/YYYY'
df.main$n.bdate <- format(
    df.main$date_of_birth, '%m/%Y'
)

df1 <- df.main %>%
    group_by(n.bdate) %>%
    summarise(qtd = n_distinct(id)) %>%
    arrange(desc(qtd)) %>%
    top_n(10)
names(df1) <- c('date', 'quantity')
# print(View(df1))

## Exploratory

print(sd(df.main$year_salary))
print(View(df.main[5:9]))
print(colSums(is.na(df.main[2:4])))

print(str(df.main$gender))
print(table(df.main$gender))
print(prop.table(table(df.main$gender)) * 100)


hist(df.main$year_salary)
boxplot(df.main$year_salary)
print(
    ggplot(df1, aes(x = date, y = quantity, group = 1)) +
        geom_line() +
        geom_point()
    
)