calculate_output <- function(theta, weights, x1, x2, x3, x4){  #Calculate the output for the given weights
  sum <- x1*weights[1] + x2*weights[2] + x3*weights[3] + x4*weights[4]
  if(sum >= theta){
    return (1)
  }
  else{
    return (-1)
  }
}

