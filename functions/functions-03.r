#DPLYR
library(dplyr)

#?iris
# print(head(iris))
# print(glimpse(iris))

#Filtering data
versicolor <- filter(
    iris, Species =='versicolor'
)

# print(glimpse(versicolor))
# print(dim(versicolor))

#Slicing data
sliced <- slice(iris, 5:10)

# print(head(sliced))

#Selecting specific columns
selected1 <- select(iris, 2:4) # select only columns 2 - 4
selected2 <- select(iris, -Sepal.Width) # all columns except 'Sepal.Width'

# print(head(selected1))
# print(head(selected2))

#Creating a new column based in existing ones
iris2 <- mutate(
    iris,
    n.column = Sepal.Length + Sepal.Width
)

# print(head(iris2['n.column']))
# print(iris2[,c('Sepal.Length', 'Sepal.Width', 'n.column')])

#?arrange
# print(
#     select(iris, Sepal.Length) %>%
#     arrange(Sepal.Length)   # Sort the results according to the given parameter
# )

# ?group_by
print(
    iris %>% group_by(Species) %>%
        summarise(
            mean(
                Sepal.Length
            )
        )
)