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

# Convert 'year_salary' to numeric
df.main$year_salary <- as.numeric(gsub('\\$', '', df.main$year_salary))

# Data Visualization

# 1 - What genders make more money?
# Create a dataframe with only the top 15 genders (year_salary)
df1 <- df.main %>%
    group_by(gender) %>%
    summarise(n = sum(year_salary)) %>%
    arrange(desc(n)) %>%
    top_n(15)

#Renaming the columns
names(df1) <- c('gender', 'sum_of_salary')

# print(View(df1))

# Ploting some graphs PS.: This graph is mad crazy, need to understand more of this syntax to create a better one
# print(
#     ggplot(df1, aes(x = reorder(gender, sum_of_salary), y = sum_of_salary)) +
#         geom_bar(stat = 'identity') +
#         coord_flip() +
#         labs(x = 'Salary', y = 'Gender')
# )

# 2 - What is the total earn by country?
# Create a dataframe with top 15 countries
df2 <- df.main %>%
    group_by(country_of_birth) %>%
    summarise(n = sum(year_salary)) %>%
    arrange(desc(n)) %>%
    top_n(15)

names(df2) <- c('country', 'total_salary')

# print(View(df2))

#Criando o gráfico
print(
ggplot(df2, aes(x = reorder(country, total_salary), y = total_salary))+
  geom_bar(stat = "identity", fill = "#0ba791")+
  geom_text(aes(label = total_salary), vjust = 0.3, size = 3)+
  coord_flip()+
  labs(x = "Total Salary", y = "Country")
)
#options(scipen = 999)