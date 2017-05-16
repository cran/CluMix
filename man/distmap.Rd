\name{distmap}
\alias{distmap}
\title{Display similarity matrix}

\description{Calculates and visualizes a similarity matrix for subjects or variables in an image plot}

\usage{
distmap(data, what = c("subjects", "variables"), variables.method = 
c("associationMeasures", "distcor"), varweights, linkage = "ward.D2", 
reorderdend, col, ...)
}

\arguments{
  \item{data}{\code{data.frame} with original data or similarity \code{matrix}}
  \item{what}{Shall similarity matrix of subjects or variables be visualized?; ignored if \code{data} is a similarity matrix}
    \item{variables.method}{method to calculate similarities if \code{what = "variables"}: combination of association measures (\code{"associationMeasures"}) or distance correlation (\code{"distcor"})}
  \item{varweights}{optional vector of variable weights, used for calculating Gower's distances between subjects; ignored if \code{what = "associationMeasures"}}
  \item{linkage}{agglomeration method used for hierarchical clustering; corresponds to parameter \code{method} of \code{\link[stats]{hclust}}}
  \item{reorderdend}{optional numeric values for reordering the dendrogram (maintaining the constraints on the dendrogram), see \code{wts} option of \code{\link[stats]{reorder.dendrogram}}}
  \item{col}{Color palette; defaults to blue-scale palette, where darker blue indicates higher similarity}
  \item{\dots}{graphical parameters passed to \code{\link[gplots]{heatmap.2}}}
}

\details{
If \code{data} is a \code{data.frame}, the similarity matrix is calculated for subjects (if \code{what = "subjects"}) or variables (if \code{what = "variables"}).
Similarities for subjects are calculated by \code{\link{similarity.subjects}}. \\
Similarities for variables are derived by \code{\link{similarity.variables}}. 
Alternatively, \code{data} can also be a previously calculated similarity matrix. 
}

\value{Image plots and dendrograms}

%\references{
%}

\author{Manuela Hummel}

%\note{
%}

\seealso{\code{\link{similarity.variables}}, \code{\link{dist.variables}}, \code{\link{similarity.subjects}}, \code{\link{dist.subjects}}, \code{\link{mix.heatmap}}}

\examples{
data(mixdata)

## subjects
distmap(mixdata, what="subjects")

# example with variable weights
w <- rep(1:2, each=5)
distmap(mixdata, what="subjects", varweights=w)

## variables
distmap(mixdata, what="variables", method="association")
distmap(mixdata, what="variables", method="distcor")
}

\keyword{ hplot }
