\name{dendro.subjects}
\alias{dendro.subjects}
\title{Subjects dendrogram}

\description{Get dendrogram for subjects (observations) based on variables of mixed data types}

\usage{
dendro.subjects(data, weights, linkage="ward.D2")
}

\arguments{
  \item{data}{data frame}
  \item{weights}{optional vector of weights for variables in \code{data}}
  \item{linkage}{agglomeration method used for hierarchical clustering; corresponds to parameter \code{method} of \code{\link[stats]{hclust}}}
}

\details{Distances between subjects are based on Gower's general similarity coefficient with an extension of Podani for ordinal variables, see \code{\link[FD]{gowdis}}. In the case that all variables are quantitative, Euclidean distances are used. Then a dendrogram is derived by standard hierarchical clustering (\code{\link[stats]{hclust}} with agglomeration \code{method = "ward.D2"} by default).}

\value{An object of class \code{\link[stats]{dendrogram}}}

\references{
Gower J (1971). A general coefficient of similarity and some of its properties. Biometrics, 27:857-871.

Podani J (1999). Extending Gower's general coefficient of similarity to ordinal characters. Taxon, 48(2):331-340.
}

\author{Manuela Hummel}

%\note{
%%  ~~further notes~~
%}

\seealso{\code{\link{dendro.variables}}, \code{\link{dist.subjects}}, \code{\link{mix.heatmap}}}

\examples{
data(mixdata)

dend <- dendro.subjects(mixdata)
plot(dend)

## example with weights
w <- rep(1:2, each=5)
dend <- dendro.subjects(mixdata, weights=w)
plot(dend)
}
\keyword{ cluster }
