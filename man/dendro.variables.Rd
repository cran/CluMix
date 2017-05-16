\name{dendro.variables}
\alias{dendro.variables}
\title{Variables dendrogram}

\description{Get dendrogram for variables of mixed types}
\usage{
dendro.variables(data, method = c("associationMeasures", "distcor", "ClustOfVar"), 
  linkage="ward.D2", associationFun = association, check.psd = TRUE)
}

\arguments{
  \item{data}{data frame with variables of interest}
  \item{method}{If \code{"associationMeasures"}, similarities between variables are assessed by combination of appropriate measures of association for different pairs of data types. If \code{"distcor"}, distances between variables are calculated based on distance correlation. In both cases, then a dendrogram is derived by standard hierarchical clustering (\code{\link[stats]{hclust}}). If \code{"ClustOfVar"}, variables are clustered by the \code{\link{ClustOfVar}{ClustOfVar}} approach.}
  \item{linkage}{agglomeration method used for hierarchical clustering when \code{dist.variables.method = "associationMeasures"}; corresponds to parameter \code{method} of \code{\link[stats]{hclust}}}
  \item{associationFun}{By default, appropriate association measures are chosen for each pair of variables, see \code{\link{association}} for details. But the user can also define a function that for any two variables calculates a similarity measure. Ignored if \code{dist.variables.method = "ClustOfVar"}}
  \item{check.psd}{If \code{TRUE}, it is checked if the variable's similarity matrix S is positive semi-definite (p.s.d.), and if not it is transformed to a p.s.d. one by \code{\link[Matrix]{nearPD}}, see \code{\link{dist.variables}} for details. Ignored if \code{dist.variables.method = "ClustOfVar"}}
}

\details{Clustering of variables can either be done i) similarity-based using measures of association, ii) similarity-based using distance correlation, or iii) by the ClustOfVar approach, which uses principal components analysis for mixed data.}

\value{An object of class \code{\link[stats]{dendrogram}}}

\references{
Hummel M, Edelmann D, Kopp-Schneider A. Clustering of samples and variables with mixed-type data. Submitted.

Chavent M, Kuentz-Simonet V, Liquet B, Saracco J (2012). ClustOfVar: An R Package for the Clustering of Variables. Journal of Statistical Software, 50:1-16.
}

\author{Manuela Hummel}

%\note{
%%  ~~further notes~~
%}

\seealso{\code{\link{association}}, \code{\link{similarity.variables}}, \code{\link{dist.variables}}, \code{\link{dendro.subjects}}, \code{\link{mix.heatmap}}}

\examples{
data(mixdata)

dend1 <- dendro.variables(mixdata, method="associationMeasures")
plot(dend1)

dend2 <- dendro.variables(mixdata, method="distcor")
plot(dend2)

dend3 <- dendro.variables(mixdata, method="ClustOfVar")
plot(dend3)
}
\keyword{ cluster }
