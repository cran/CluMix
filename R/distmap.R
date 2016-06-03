distmap <-
function(data, what=c("subjects", "variables"), varweights, reorderdend, col, ...){
#function(data, what=c("subjects", "variables"), type=list(), col, ...){
  # !! to be done: allow also asymmetric binary variables

  # if data is original data.frame, calculate similarity matrix if missing
  if(data.class(data) == "data.frame"){
    what <- match.arg(what)
    if(what == "subjects")
      S <- similarity.subjects(data, weights=varweights)
    
    else if(what == "variables")
      S <- similarity.variables(data)
  }
  
  # else if data is similarity matrix
  else if(data.class(data) == "matrix" & isSymmetric(data))
    S <- data
  
  else
    stop("'data' has to be a data.frame with the original data or a similarity matrix")
  
  # corresponding dendrogram
  dendro <- as.dendrogram(hclust(as.dist(sqrt(1 - S))))
    
  # reorder dendrogram if wanted
  if(!missing(reorderdend))
    dendro <- stats::reorder(dendro, reorderdend)
  
  # graphical parameters
  if(missing(col))
    col <- marray::maPalette(low="#F7FBFF", mid="#6BAED6", high="#08306B", 30)

  # distogram
  gplots::heatmap.2(S, Rowv=dendro, Colv=dendro, trace="none", density.info="none", col=col, ...)
}
