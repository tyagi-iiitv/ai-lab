data <- read.table("Iris_data_norm_train.txt", sep = ",")
x <- data.frame(data[[1]], data[[2]], data[[3]], data[[4]]) #Appends the 1st, 2nd, 3rd and 4th column of x in data
x <- data.matrix(x, rownames.force = NA) #converts data from a data frame to a numeric matrix
ones <- rep(1, nrow(x)) #first column of the x matrix which contains all ones
x <- cbind(ones, x) #Adding the first column to the matrix of data i.e. x
y <- data.frame(data[[5]])
y <- data.matrix(y, rownames.force = NA)
print ("The calculated weights are :")
weights <- solve(t(x)%*%x, t(x)%*%y) #Gives the weights with minimum error
cat("W0 :", weights[1],"\n")
cat("W1 :", weights[2],"\n")
cat("W2 :", weights[3],"\n")
cat("W3 :", weights[4],"\n")
cat("W4 :", weights[5],"\n")