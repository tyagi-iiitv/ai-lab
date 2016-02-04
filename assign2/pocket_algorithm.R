#Implementing Pocket algorithm for perceptron model
min_e_in <- 1000000000
min_weights <- vector(mode = 'numeric', length = 0)
for(i in 1:100){
  weights_temp <- weights
  # print(weights_temp)
  e_in <- 0
  # e_out <- 0
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
      weights[1] <- weights[1] + (local_error*x_train[j,1])
      weights[2] <- weights[2] + (local_error*x_train[j,2])
      weights[3] <- weights[3] + (local_error*x_train[j,3])
      weights[4] <- weights[4] + (local_error*x_train[j,4])
      weights[5] <- weights[5] + (local_error)
    }
  }
  print(e_in)
  if(e_in < min_e_in){
    min_e_in <- e_in
    min_weights <- weights_temp
  }
  # e_temp_in <- c(e_temp_in, e_in)
}
print("...")
print(min_weights)
print(min_e_in)
print(weights)

