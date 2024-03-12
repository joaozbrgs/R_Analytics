library(dplyr)
# ??dplyr
# ?data.frame

#Joins
df1 <- data.frame(
    product = c(
        1,
        2,
        3,
        5
    ),
    price = c(
        15,
        10,
        25,
        20
    )
)

# print(head(df1))

df2 <- data.frame(
    product = c(
        1,
        2,
        3,
        4
    ),
    name = c(
        'A',
        'B',
        'C',
        'D'
    )
)

# print(head(df2))

df3 <- left_join(df1, df2, 'product')   # this is a function from 'dplyr'
df4 <- right_join(df1, df2, 'product')
df5 <- inner_join(df1, df2, 'product')
df6 <- full_join(df1, df2, 'product')

print(head(df3))
print(head(df4))
print(head(df5))
print(head(df6))