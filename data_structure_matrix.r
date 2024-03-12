#Matrixes
#?matrix()

m <- matrix(seq(1:9), nrow = 3)

print(m)


#specifying amount of columns and column name:

m2 <- matrix(
    seq(
        1:25
    ),
    ncol = 5,
    byrow = TRUE,
    dimnames = 
        list(
            c(
                seq(
                    1:5
                )),
                c(
                    'A',
                    'B',
                    'C',
                    'D',
                    'E'
                )
            
        )
)

print(m2)

#Filter data in Matrix

print(m2[c(1:2), c('B', 'C')])
