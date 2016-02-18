calculate_output <- function(theta, weights, x1, x2){  #Calculate the output for the given weights
  sum <- x1*weights[1] + x2*weights[2] + weights[3]
  if(sum >= theta){
    return (1)
  }
  else{
    return (0)
  }
}
