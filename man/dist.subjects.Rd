\name{dist.subjects}
\alias{dist.subjects}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Distance matrix for subjects}
\description{Get distance matrix for subjects (observations) based on variables of mixed data types}

\usage{
dist.subjects(data)
}

\arguments{
  \item{data}{data frame}
}

\details{Distances between subjects are based on Gower's general similarity coefficient with an extension of Podani for ordinal variables, see \code{\link[FD]{gowdis}}. In the case that all variables are quantitative, Euclidean distances are used.}

\value{An object of class \code{\link[stats]{dist}}}

\references{
Gower J (1971). A general coefficient of similarity and some of its properties. Biometrics, 27:857-871.

Podani J (1999). Extending Gower's general coefficient of similarity to ordinal characters. Taxon, 48(2):331-340.
}

\author{Manuela Hummel}

%\note{
%%  ~~further notes~~
%}

\seealso{\code{\link{dendro.subjects}}, \code{\link{dist.variables}}, \code{\link{mix.heatmap}}}

\examples{
data(mixdata)

D <- dist.subjects(mixdata)
}

\keyword{ math }
\keyword{ cluster }
