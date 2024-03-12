# #ggplot2
# #mtcars

cars <- mtcars[,c(1,2,9)]

# print(head(cars))
# hist(cars$mpg) # '$' is used to access a specific column or element in df
# plot(cars$mpg, cars$cyl)


#loading libraries
# To actually call the function from library, need to use 'print'
library(ggplot2)
print(ggplot(cars, aes(am)) +       
    geom_bar()) 
