calculate_output_multi <- function(theta, weights, x1, x2, x3, x4){  #Calculate the output for the given weights
  sum <- x1*weights[1] + x2*weights[2] + x3*weights[3] + x4*weights[4] + x1^2*weights[5] + x2^2*weights[6] + x3^2*weights[7] + x4^2*weights[8] + x1*x2*weights[9]+ x2*x3*weights[10] + x3*x4*weights[11] + x1*x3*weights[12] + x1*x4*weights[13] + x2*x4*weights[14] + weights[15]
  if(sum >= theta){
    return (1)
  }
  else{
    return (-1)
  }
}

