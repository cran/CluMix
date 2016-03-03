\name{similarity.variables}
\alias{similarity.variables}
\title{Similarity matrix for variables}

\description{Get similarity matrix for variables of mixed types}

\usage{
similarity.variables(data, associationFun = association, 
check.psd = TRUE, make.psd = TRUE)
}

\arguments{
  \item{data}{data frame with variables of interest}
  \item{associationFun}{By default, appropriate association measures are chosen for each pair of variables, see \code{\link{association}} for details. But the user can also define a function that for any two variables calculates a similarity measure.}
  \item{check.psd}{If \code{TRUE}, it is checked if the variable's similarity matrix S is positive semi-definite (p.s.d.).}
  \item{make.psd}{If \code{TRUE}, and if the similarity matrix is not positive semi-definite, it is transformed to a p.s.d. one by \code{\link[Matrix]{nearPD}}. Ignored if \code{check.psd = FALSE}}
}

\details{For each pair of variables, similarity coefficients s_ij are calculated, see \code{\link{association}} for details. If the similarity matrix is (made) positive semi-definite, distances d_ij = sqrt(1 - s_ij) have metric properties (Gower, 1971), which means for instance that the triangular inequality holds.}

\value{Matrix of similarity values for each pair of variables}

\references{
Gower J (1971). A general coefficient of similarity and some of its properties. Biometrics, 27:857-871.
}

\author{Manuela Hummel}

%\note{
%}

\seealso{\code{\link{association}}, \code{\link{dist.variables}}, \code{\link{dendro.variables}}, \code{\link{dist.subjects}}, \code{\link{mix.heatmap}}}

\examples{
data(mixdata)

S <- similarity.variables(mixdata)
}

\keyword{ math }
\keyword{ cluster }
