data_train <- read.table("Iris_data_norm_train.txt", sep = ",")
x_train <- data.frame(data_train[[1]], data_train[[2]], data_train[[3]], data_train[[4]]) #Appends the 1st, 2nd, 3rd and 4th column of x in data
x_train <- data.matrix(x_train, rownames.force = NA) #converts data from a data frame to a numeric matrix
# ran_numbers <- rnorm(5) #generate 5 random numbers
# weights <- dnorm(ran_numbers)#Stores the random numbers for initial_weights
weights <- c(1000,1000,1000,1000,1000)
theta <- 0 #Threshold value to compare the equation with
data_test <- read.table("iris_data_norm_test.txt", sep = ",")
x_test <- data.frame(data_test[[1]], data_test[[2]], data_test[[3]], data_test[[4]]) #Appends the 1st, 2nd, 3rd and 4th column of x in data
x_test <- data.matrix(x_test, rownames.force = NA) #converts data from a data frame to a numeric matrix
y <- data.frame(data_train[[5]]) #loads the class column from the training dataset
y <- data.matrix(y, rownames.force = NA) 
y_test <- data.frame(data_test[[5]]) #The class column from the test dataset
y_test <- data.matrix(y_test,rownames.force = NA)
e_temp_in <- vector(mode='numeric',length = 0)
e_temp_out <- vector(mode='numeric', length = 0)
