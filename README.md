# jaccard_matrices_R

# Calculating jaccard index of two directed matrices within a function 

jaccard <- function(matrix1,matrix2){
  shared_ties <- matrix1 * matrix2
  diff_ties <- (matrix1 + matrix2) == 1
  
  sum_diff_ties = sum(diff_ties)
  sum_shared_ties = sum(shared_ties)
  divisor = sum_diff_ties + sum_shared_ties
  jaccard_index = ifelse(divisor == 0, 
                         1, 
                         sum_shared_ties/divisor)
  return(jaccard_index)
}
