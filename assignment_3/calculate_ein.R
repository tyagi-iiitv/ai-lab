calculate_ein <- function(weights, x, y, theta){  #Calculate the output for the given weights
  e_in <- 0
  for(j in 1:118){
    hyp_output <- calculate_output(theta, weights, x[j,1], x[j,2])
    if(hyp_output != y[j]){
      e_in <- e_in + 1
    }
  }
  return (e_in)
}

