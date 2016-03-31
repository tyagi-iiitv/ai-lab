data_train <- read.table("Iris_data_norm_train.txt", sep = ",")
x_train <- data.frame(data_train[[1]], data_train[[2]], data_train[[3]], data_train[[4]]) #Appends the 1st, 2nd, 3rd and 4th column of x in data
x_train <- data.matrix(x_train, rownames.force = NA) #converts data from a data frame to a numeric matrix
ran_numbers <- rnorm(15) #generate 15 random numbers
weights <- dnorm(ran_numbers)#Stores the random numbers for initial_weights
theta <- 0 #Threshold value to compare the equation with
# data_test <- read.table("iris_data_norm_test.txt", sep = ",")
# x_test <- data.frame(data_test[[1]], data_test[[2]], data_test[[3]], data_test[[4]]) #Appends the 1st, 2nd, 3rd and 4th column of x in data
# x_test <- data.matrix(x_test, rownames.force = NA) #converts data from a data frame to a numeric matrix
y <- data.frame(data_train[[5]]) #loads the class column from the training dataset
y <- data.matrix(y, rownames.force = NA) 
# y_test <- data.frame(data_test[[5]]) #The class column from the test dataset
# y_test <- data.matrix(y_test,rownames.force = NA)
# e_temp_in <- vector(mode='numeric',length = 0)
# e_temp_out <- vector(mode='numeric', length = 0)
for(i in 1:10){
  # weights_temp <- weights
  # print(weights_temp)
  # e_in <- 0
  # e_out <- 0
  for(j in 1:110){
    output <- calculate_output_multi(theta, weights, x_train[j,1], x_train[j,2], x_train[j,3], x_train[j,4])
    # output_latest <- calculate_output(theta, weights, x_train[j,1], x_train[j,2], x_train[j,3], x_train[j,4])
    if(output == -1 && y[j] == 1){
      local_error <- 1
    }
    if(output == 1 && y[j] == -1){
      local_error <- -1
    }
    if(output == y[j]){
      local_error <- 0
    }
#     e_in <- e_in + abs(local_error)
#     if(output_latest != y[j]){
#       if(output_latest == -1 && y[j] == 1){
#         local_error <- 1
#       }
#       if(output_latest == 1 && y[j] == -1){
#         local_error <- -1
#       }
      weights[1] <- weights[1] + (local_error*x_train[j,1])
      weights[2] <- weights[2] + (local_error*x_train[j,2])
      weights[3] <- weights[3] + (local_error*x_train[j,3])
      weights[4] <- weights[4] + (local_error*x_train[j,4])
      weights[5] <- weights[5] + (local_error*x_train[j,1]^2)
      weights[6] <- weights[6] + (local_error*x_train[j,2]^2)
      weights[7] <- weights[7] + (local_error*x_train[j,3]^2)
      weights[8] <- weights[8] + (local_error*x_train[j,4]^2)
      weights[9] <- weights[9] + (local_error*x_train[j,1]*x_train[j,2])
      weights[10] <- weights[10] + (local_error*x_train[j,2]*x_train[j,3])
      weights[11] <- weights[11] + (local_error*x_train[j,3]*x_train[j,4])
      weights[12] <- weights[12] + (local_error*x_train[j,1]*x_train[j,3])
      weights[13] <- weights[13] + (local_error*x_train[j,1]*x_train[j,4])
      weights[14] <- weights[14] + (local_error*x_train[j,2]*x_train[j,4])
      weights[15] <- weights[15] + (local_error)
    # }
  }
  print(weights)
  # e_temp_in <- c(e_temp_in, e_in)
}