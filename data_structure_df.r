#Data Frame (df)

#create a data frame with vectors

city <- c(
    'Chicago',
    'New York',
    'Los Angeles',
    'San Francisco',
    'Dallas'
)

temperature <- c(32, 22, 35, 17, 28)

region <- c(1, 2, 4, 4, 6)

df <- data.frame(city, temperature)

print(df)

#create a data frame with lists:

cities <- list(
    city = city,
    temperature = temperature,
    region = region
)

df2 <- data.frame(cities)

print(df2)


#Operating DataFrame:

#Filtering values:
print(df2[5,3]) #it means, line 5, column 3

print(df2[,2]) #it means, all items from column 2

print(df2[3,]) #return line 3 only

print(df2['city']) #return only column 'city'

#more filtering

print(df2[c(2:4), c(1,3)]) #select only the lines 2, 3 and 4 from columns 1 and 3

#Dataframe details:

print(names(df2)) #return the name of each column

print(dim(df2)) #return the amount of rows and columns, respectively

print(str(df2)) #describe the dataframe in number of observations, columns and type of character