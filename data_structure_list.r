#Lists
# '?list()'

#creating a list
person <- list(
    gender = 'M',
    city = 'Boston',
    age = 20
)

# print(person)

# #Accessing items in the list
# print(person[1]) #first attribute and value
# print(person[[1]]) #only the first value

#Editing values:
person[['age']] <- 22
# print(person)

#Deleting attributes in the list
# person[[age]] <- NULL
# print(person)

# #Applying Filters
# print(person[c('city', 'gender')])


#IMPORTANT!!
#Lists can receive vectors:


city <- c(
    'Chicago',
    'New York',
    'Los Angeles',
    'San Francisco',
    'Dallas'
)

temperature <- c(32, 22, 35, 17, 28)

region <- c(1, 2, 4, 4, 6)

cities <- list(
    city = city,
    temperature = temperature,
    region = region
)

print(cities)