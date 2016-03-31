rm(list=ls(all=TRUE))
source("calculate_output.R")
source("calculate_ein.R")
data_train <- read.table("ex2data2.txt", sep = ",")
x_train <- data.frame(data_train[[1]], data_train[[2]]) 
x_train <- data.matrix(x_train, rownames.force = NA) #converts data from a data frame to a numeric matrix
ran_numbers <- rnorm(3) #generate 5 random numbers
weights <- dnorm(ran_numbers)#Stores the random numbers for initial_weights
theta <- 1
y <- data.frame(data_train[[3]]) #loads the class column from the training dataset
y <- data.matrix(y, rownames.force = NA) 
learning_rate <- 0.1
max_iter <- 500
epsilon <- 1
e_temp_in <- vector(mode='numeric',length = 0)
for(i in 1:max_iter){
  # error_count <- matrix(data = [0 0], nrow = 1, ncol = 2)
  error_count_1 <- 0
  error_count_2 <- 0
  error_count <- 0
  j_theta_1_plus <- 0
  j_theta_1_minus <- 0
  j_theta_2_plus <- 0
  j_theta_2_minus <- 0
  j_theta_3_plus <- 0
  j_theta_3_minus <- 0
  weights_temp_1_plus <- weights
  weights_temp_1_plus[1] <- weights_temp_1_plus[1] + epsilon
  weights_temp_1_minus <- weights
  weights_temp_1_minus[1] <- weights_temp_1_minus[1] - epsilon
  weights_temp_2_plus <- weights
  weights_temp_2_plus[2] <- weights_temp_2_plus[2] + epsilon
  weights_temp_2_minus <- weights
  weights_temp_2_minus[2] <- weights_temp_2_minus[2] - epsilon
  weights_temp_3_plus <- weights
  weights_temp_3_plus[3] <- weights_temp_3_plus[3] + epsilon
  weights_temp_3_minus <- weights
  weights_temp_3_minus[3] <- weights_temp_3_minus[3] - epsilon
  for(j in 1:118){
    hyp_output <- calculate_output(theta, weights, x_train[j,1], x_train[j,2])
    error_count_1 <- error_count_1 + (hyp_output - y[j]) * x_train[j,1]
    error_count_2 <- error_count_2 + (hyp_output - y[j]) * x_train[j,2]
    error_count <- error_count + (hyp_output - y[j])
    j_theta_1_plus <- j_theta_1_plus + ((calculate_output(theta, weights_temp_1_plus, x_train[j,1], x_train[j,2])) - y[j])^2
    j_theta_1_minus <- j_theta_1_minus + ((calculate_output(theta, weights_temp_1_minus, x_train[j,1], x_train[j,2])) - y[j])^2 
    j_theta_2_plus <- j_theta_2_plus + ((calculate_output(theta, weights_temp_2_plus, x_train[j,1], x_train[j,2])) - y[j])^2
    j_theta_2_minus <- j_theta_2_minus + ((calculate_output(theta, weights_temp_2_minus, x_train[j,1], x_train[j,2])) - y[j])^2
    j_theta_3_plus <- j_theta_3_plus + ((calculate_output(theta, weights_temp_3_plus, x_train[j,1], x_train[j,2])) - y[j])^2
    j_theta_3_minus <- j_theta_3_minus + ((calculate_output(theta, weights_temp_3_minus, x_train[j,1], x_train[j,2])) - y[j])^2
  }
#   print(error_count_1)
#   print(error_count_2)
  weights[1] <- weights[1] - learning_rate * error_count / 118
  weights[2] <- weights[2] - learning_rate * error_count_1 / 118
  weights[3] <- weights[3] - learning_rate * error_count_2 / 118
  # print(weights)
  #Calculating g_thetas
  g_theta_1 <- error_count/118
  g_theta_2 <- error_count_1/118
  g_theta_3 <- error_count_2/118
  print(g_theta_1, g_theta_2, g_theta_3)
  print("...")
  #Calculating j_thetas
  j_theta_1_plus <- j_theta_1_plus/236
  j_theta_1_minus <- j_theta_1_minus/236
  j_theta_2_plus <- j_theta_2_plus/236
  j_theta_2_minus <- j_theta_2_minus/236
  j_theta_3_plus <- j_theta_3_plus/236
  j_theta_3_minus <- j_theta_3_minus/236
  
  j_theta_1 <- (j_theta_1_plus - j_theta_1_minus)/(2*epsilon)
  j_theta_2 <- (j_theta_2_plus - j_theta_2_minus)/(2*epsilon)
  j_theta_3 <- (j_theta_3_plus - j_theta_3_minus)/(2*epsilon)
  e_temp_in <- c(e_temp_in,calculate_ein(weights,x_train, y, theta))
  print(j_theta_1, j_theta_2, j_theta_3)
  }
# print(e_temp_in)
plot(e_temp_in)