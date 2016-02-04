#Checking for 30-70
require(graphics)
for(i in 1:2500){
  weights_temp <- weights
  # print(weights_temp)
  e_in <- 0
  e_out <- 0
  for(j in 1:30){
    output <- calculate_output(theta, weights_temp, x_train[j,1], x_train[j,2], x_train[j,3], x_train[j,4])
    output_latest <- calculate_output(theta, weights, x_train[j,1], x_train[j,2], x_train[j,3], x_train[j,4])
    if(output == -1 && y[j] == 1){
      local_error <- 1
    }
    if(output == 1 && y[j] == -1){
      local_error <- -1
    }
    if(output == y[j]){
      local_error <- 0
    }
    e_in <- e_in + abs(local_error)
    if(output_latest != y[j]){
      if(output_latest == -1 && y[j] == 1){
        local_error <- 1
      }
      if(output_latest == 1 && y[j] == -1){
        local_error <- -1
      }
      weights[1] <- weights[1] + (0.02*local_error*x_train[j,1])
      weights[2] <- weights[2] + (0.02*local_error*x_train[j,2])
      weights[3] <- weights[3] + (0.02*local_error*x_train[j,3])
      weights[4] <- weights[4] + (0.02*local_error*x_train[j,4])
      weights[5] <- weights[5] + (0.02*local_error)
    }
  }
  e_temp_in <- c(e_temp_in, e_in)
  for(j in 1:70){
    output <- calculate_output(theta, weights_temp, x_test[j,1], x_test[j,2], x_test[j,3], x_test[j,4])
    if(output == -1 && y_test[j] == 1){
      local_error <- 1
    }
    if(output == 1 && y_test[j] == -1){
      local_error <- -1
    }
    if(output == y_test[j]){
      local_error <- 0
    }
    e_out <- e_out + abs(local_error)
  }
  e_temp_out <- c(e_temp_out, e_out)
  
}
# print(e_temp_in)
# print(".....\n")
# print(e_temp_out)
# plot(e_temp_out)
plot(e_temp_in)
lines(e_temp_in)