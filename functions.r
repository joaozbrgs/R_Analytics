#Function Structure: help.function()

#Creating Functions
odd.even <- function(num){
    if((num %% 2)==0){
        return('Even')
    }else{
        return('Odd')
       }
}

num = 2.4 * 10
print(odd.even(num))


#Apply functions: ?apply()

x <- seq(1:9)
m <- matrix(x,ncol=3)
print(m)

#Apply: First argument - matrix
#Second Argument: 1 for line, 2 for column
#Third Argument: operation
result1 <- apply(m, 1, sum) 
print(result1) #Will return the total of each line


#function lapply (for vectors and lists)

v1 <- c(2,4,6,8,10)
v2 <- c(1,3,5,7,9)

array <- list(v1, v2)

print(lapply(array, mean))
print(sapply(array, mean))
