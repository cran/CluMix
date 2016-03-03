\name{dendro.subjects}
\alias{dendro.subjects}
\title{Subjects dendrogram}

\description{Get dendrogram for subjects (observations) based on variables of mixed data types}

\usage{
dendro.subjects(data)
}

\arguments{
  \item{data}{data frame}
}

\details{Distances between subjects are based on Gower's general similarity coefficient with an extension of Podani for ordinal variables, see \code{\link[FD]{gowdis}}. In the case that all variables are quantitative, Euclidean distances are used. Then a dendrogram is derived by standard hierarchical clustering (\code{\link[stats]{hclust}} with default options).}

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
}
\keyword{ cluster }