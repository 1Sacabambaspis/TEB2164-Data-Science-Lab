M <- matrix(c(1:24), nrow = 4, byrow = FALSE)

array1 <- array(c(M),dim = c(2,4,3))

print(array1)


M2 <- matrix(c(25:54), nrow = 2, byrow = FALSE)

array2 <- array(c(M2),dim = c(3,2,5))

print(array2)
result <-array1[2,,2]
element<-array2[3,2,1]
print(paste("The second row of the second matrix of the array:", paste(result, collapse=", ")))
print(paste("The element in the 2nd row and 3rd column of the 1st matrix:", element))
