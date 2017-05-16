\name{similarity.variables}
\alias{similarity.variables}
\title{Similarity matrix for variables}

\description{Get similarity matrix for variables of mixed types}

\usage{
similarity.variables(data, method = c("associationMeasures", "distcor"), 
associationFun = association, check.psd = TRUE, make.psd = TRUE)
}

\arguments{
  \item{data}{data frame with variables of interest}
    \item{method}{method to calculate distances: combination of association measures (\code{'associationMeasures'}) or distance correlation (\code{'distcor'})}
  \item{associationFun}{only applies if \code{method = 'associationMeasures'}: appropriate association measures are chosen for each pair of variables, see \code{\link{association}} for details. But the user can also define a function that for any two variables calculates a similarity measure.}
  \item{check.psd}{only applies if \code{method = 'associationMeasures'}: if \code{TRUE}, it is checked if the variable's similarity matrix S is positive semi-definite (p.s.d.), and if not it is transformed to a p.s.d. one by \code{\link[Matrix]{nearPD}}.}
  \item{make.psd}{only applies if \code{method = 'associationMeasures'}: if \code{TRUE}, and if the similarity matrix is not positive semi-definite, it is transformed to a p.s.d. one by \code{\link[Matrix]{nearPD}}. Ignored if \code{check.psd = FALSE}}
}

\details{A similarity matrix for variables can be derived by combining different measures of association or by a distance correlation approach. For the association measure approach, for each pair of variables, similarity coefficients s_ij are calculated, see \code{\link{association}} for details. If the similarity matrix is (made) positive semi-definite, distances d_ij = sqrt(1 - s_ij) have metric properties (Gower, 1971), which means for instance that the triangular inequality holds.
The distance correlation approach uses generalized distance correlation based on Gower's similarity coefficient between sample elements.}

\value{Matrix of similarity values for each pair of variables}

\references{
Hummel M, Edelmann D, Kopp-Schneider A. Clustering of samples and variables with mixed-type data. Submitted.

Gower J (1971). A general coefficient of similarity and some of its properties. Biometrics, 27:857-871.

Szekely GJ, Rizzo ML, Bakirov NK (2007). Measuring and testing dependence by correlation of distances. The Annals of Statistics, 35.6:2769-2794.

Lyons R (2013). Distance covariance in metric spaces. The Annals of Probability, 41.5:3284-3305.
}

\author{Manuela Hummel, Dominic Edelmann}

%\note{
%}

\seealso{\code{\link{association}}, \code{\link{dist.variables}}, \code{\link{dendro.variables}}, \code{\link{dist.subjects}}, \code{\link{mix.heatmap}}}

\examples{
data(mixdata)

S1 <- similarity.variables(mixdata)
S2 <- similarity.variables(mixdata, method="distcor")
}

\keyword{ math }
\keyword{ cluster }
