similarity.subjects <- function(data, weights){
  D <- dist.subjects(data, weights=weights)
  S <- 1 - D^2
  return(as.matrix(S))
}