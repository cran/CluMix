\name{dist.variables}
\alias{dist.variables}
\title{Distance matrix for variables}

\description{Get distance matrix for variables of mixed types}

\usage{
dist.variables(data, associationFun = association, check.psd = TRUE)
}

\arguments{
  \item{data}{data frame with variables of interest}
  \item{associationFun}{By default, appropriate association measures are chosen for each pair of variables, see \code{\link{association}} for details. But the user can also define a function that for any two variables calculates a similarity measure.}
  \item{check.psd}{If \code{TRUE}, it is checked if the variable's similarity matrix S is positive semi-definite (p.s.d.), and if not it is transformed to a p.s.d. one by \code{\link[Matrix]{nearPD}}.}
}

\details{For each pair of variables, similarity coefficients s_ij are calculated, see \code{\link{association}} for details. Distances are then calculated as d_ij = sqrt(1 - s_ij). If the similarity matrix is (made) positive semi-definite, those distances have metric properties (Gower, 1971), which means for instance that the triangular inequality holds.}

\value{An object of class \code{\link[stats]{dist}}}

\references{
Gower J (1971). A general coefficient of similarity and some of its properties. Biometrics, 27:857-871.
}

\author{Manuela Hummel}

%\note{
%}

\seealso{\code{\link{association}}, \code{\link{similarity.variables}}, \code{\link{dendro.variables}}, \code{\link{dist.subjects}}, \code{\link{mix.heatmap}}}

\examples{
data(mixdata)

D <- dist.variables(mixdata)
}

\keyword{ math }
\keyword{ cluster }
