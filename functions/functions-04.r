#Tidyr
library(tidyr)
library(dplyr)

# Defining a DataFrame - product per year
dfDate <- data.frame(
    product = c('A', 'B', 'C'),
    A.2015 = c(10,12,20),
    A.2016 = c(20,25,35),
    A.2017 = c(15,20,30)
)

# print(head(dfDate))

# ?gather
# columns to rows - gather(1: original DataFrame, 2: column to receive data from column, 3: column to receive data from row, 4: interval)
dfDate2 <- gather(
    dfDate, 'year', 'amount', 2:4       
)

# print(glimpse(dfDate2))

#?separate
dfDate3 <- separate(
    dfDate2, year, c("A", "n.year") # Separating the original 'year' into 'A' and 'n.year'
)
dfDate3 <- dfDate3[-2]      # Deleting Column 'A'

# print(dfDate3)

# ?unite
dfDate3$month <- c('01', '02', '03')
dfDate4 <- dfDate3 %>%
    unite(date, month, n.year, sep='/')

print(dfDate3)
print(dfDate4)