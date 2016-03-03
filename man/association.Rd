\name{association}
\alias{association}
\title{
Function to calculate a measure for association between two variables on arbitrary scales 
}

\description{Similarities between variables used for clustering are calculated by this function. For each combination of different data types, an appropriate measure for association is chosen, see details.}

\usage{
association(x, y)
}

\arguments{
  \item{x}{vector of class \code{numeric}, \code{factor}, \code{ordered}, or \code{logical}}
  \item{y}{vector of class \code{numeric}, \code{factor}, \code{ordered}, or \code{logical}}
}

\details{
The following association measures for respective types of variables are chosen:
\itemize{
  \item quantitative vs quantitative/ordinal: absolute Spearman correlation coefficient
  \item ordinal vs ordinal: absolute Goodman and Kruskal's gamma coefficient (Goodman and Kruskal, 1954)
  \item quantitative/ordinal vs binary: absolute Goodman and Kruskal's gamma coefficient
  \item quantitative vs categorical (>2 categories): The categories of the categorical variable are reordered with respect to average ranks of the quantitative variable within those categories. Then absolute Spearman correlation coefficient is calculated as if it was an ordered factor. To avoid over-optimism, the reordering is only applied if a Kruskal-Wallis pre-test of association yields a significant result (p<0.05).
  \item ordinal vs categorical (>2 categories): as for 'quantitative vs categorical', but instead of Spearman correlation the absolute Goodman and Kruskal's gamma coefficient is calculated
  \item categorical vs categorical: Also in this case the reordering strategy is applied by "diagonalizing" the cross-table between the two factors (see \code{\link[extracat]{optile}} from the \code{extracat} package). 
  Association is then measured by absolute Goodman and Kruskal's gamma coefficient. To avoid over-optimism, the reordering is only applied if a chi-square pre-test of association yields a significant result (p<0.05).
}
}

\value{Estimated value of association between \code{x} and \code{y}}

\references{
Goodman LA and Kruskal WH (1954). Measures of association for cross classifications.
Journal of the American Statistical Association, 49:732-764.
}

\author{Manuela Hummel}

%\note{
%}


\seealso{
\code{\link{similarity.variables}}, \code{\link{dist.variables}},
}

\examples{
x <- rnorm(100)
y <- as.factor(sample(1:3, 100, replace=TRUE))
association(x, y)
}

\keyword{univar}
\keyword{cluster}
