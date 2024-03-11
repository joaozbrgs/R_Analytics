#Vectors

city <- c(
    'Chicago',
    'New York',
    'Los Angeles',
    'San Francisco',
    'Dallas'
)

city

temperature <- c(32, 22, 35, 17, 28)

region <- c(1, 2, 4, 4, 6)

#Use '?c()' to learn more about this function

#Accessing first element:
print(city[1]) #note that the list starts with 1, unlike python, that starts with 0

#Accessing an interval:
print(temperature[2:4])

#copying a vector:
city2 <- city
print(city2)

#Deleting the second element from the list
temperature[-2]
print(temperature)

#Transform a vector:
city[3] <- 'Miami'
print(city)

#Add elements:
city[6] <- 'Boston'
print(city)

#Deleting a vector
city2 <- NULL
print(city2)



