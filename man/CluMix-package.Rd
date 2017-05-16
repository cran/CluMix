\name{CluMix-package}
\alias{CluMix-package}
\alias{CluMix}
\docType{package}
\title{
\packageTitle{CluMix}
}
\description{
\packageDescription{CluMix}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{The package provides clustering and visualization of mixed-type data}
\packageIndices{CluMix}
The main function \code{\link{mix.heatmap}} of the package generates a mixed-data heatmap. For visualizing similarities between either subjects or variables, a heatmap of the corresponding distance matrix can be drawn (\code{\link{distmap}}). Associations between variables can be explored by the \code{\link{confounderPlot}}, which allows visual detection of possible confounding, collinear, or surrogate factors for some variables of primary interest.  
Distance matrices and dendrograms for subjects and variables can be derived by functions \code{\link{dist.subjects}}, \code{\link{dist.variables}}, \code{\link{dendro.subjects}}, and \code{\link{dendro.variables}}. Clustering subjects is based on Gower's general similarity coefficient. Variables can be clustered by i) combination of association measures, ii) distance correlation, iii) the ClustOfVar approach.
}

\author{
\packageAuthor{CluMix}

Maintainer: \packageMaintainer{CluMix}
}

\references{
Hummel M, Edelmann D, Kopp-Schneider A. Clustering of samples and variables with mixed-type data. Submitted.

Gower J (1971). A general coefficient of similarity and some of its properties. Biometrics, 27:857-871.

Chavent M, Kuentz-Simonet V, Liquet B, Saracco J (2012). ClustOfVar: An R Package for the Clustering of Variables. Journal of Statistical Software, 50:1-16.
}

\keyword{ package }

\seealso{\code{\link{mix.heatmap}}, \code{\link[ClustOfVar]{ClustOfVar}} }

\examples{
data(mixdata)

mix.heatmap(mixdata, rowmar=7)
}
