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
person[['age']] <- NULL
print(person)


