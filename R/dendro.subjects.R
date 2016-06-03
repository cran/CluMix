dendro.subjects <-
function(data, weights){  
#function(data, type=list()){  
# !! to be done: allow also asymmetric binary variables
  
  D.subjects <- dist.subjects(data, weights=weights)
  #D.subjects <- dist.subjects(data, weights=weights, type=type)
  as.dendrogram(hclust(D.subjects))
}
