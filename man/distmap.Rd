\name{distmap}
\alias{distmap}
\title{Display similarity matrix}

\description{Calculates and visualizes a similarity matrix for subjects or variables in an image plot}

\usage{
distmap(data, what = c("subjects", "variables"), col, ...)
}

\arguments{
  \item{data}{data frame}
  \item{what}{Shall similarity matrix of subjects or variables be visualized?}
  \item{col}{Color palette; defaults to blue-scale palette, where darker blue indicates higher similarity}
  \item{\dots}{graphical parameters passed to \code{\link[gplots]{heatmap.2}}}
}

%\details{
%}

\value{Image plots and dendrograms}

%\references{
%}

\author{Manuela Hummel}

%\note{
%}

\seealso{\code{\link{similarity.variables}}, \code{\link{dist.variables}}, \code{\link{dist.subjects}}, \code{\link{mix.heatmap}}}

\examples{
data(mixdata)

distmap(mixdata, what="subjects")
distmap(mixdata, what="variables")
}

\keyword{ hplot }
