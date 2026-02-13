V1 = c(2,3,1,5,4,6,8,7,9)
column.names <- c("COL1","COL2","COL3")
row.names <- c("ROW1","ROW2","ROW3")

array1 <- array(c(V1),dim = c(3,3) , dimnames = list(row.names,column.names))
array2<-t(array1)

plus<- array1+array2
subtraction<- array1-array2
multiplication <- array1 * array2
divide <- array1/array2

print(plus)
print(subtraction)
print(multiplication)
print(divide)