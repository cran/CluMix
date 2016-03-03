\name{confounderPlot}
\alias{confounderPlot}
\title{Confounder Plot}

\description{Plots similarities of all variables to an outcome variable against similarities of all variables to a predictor of interest}

\usage{
confounderPlot(data, S, x, y, labels, returnS = FALSE, ...)
}

\arguments{
  \item{data}{data frame with variables of interest}
  \item{S}{similarity matrix; if missing it will be calculated from data by \code{\link{similarity.variables}}}
  \item{x}{name of the predictor variable (as used in \code{data} and \code{S}) of main interest, for which confounders / collinearities shall be detected}
  \item{y}{name of the outcome variable (as used in \code{data} and \code{S})}
  \item{labels}{variable names used for plotting; have to be in corresponding order with columns of \code{data}; if missing, names of \code{data} are used}
  \item{returnS}{shall similarity matrix be returned?}
  \item{\dots}{graphical parameters passed to \code{plot}}
}

\details{The similarities of all variables in a dataset with two variables of special interest (i.e. predictor and outcome of a regression model) are simultaneously visualized in a scatter plot, where the x-axis shows similarities to the predictor and the y-axis similarities to the outcome. The height of the predictor variable's point indicates its association with the outcome and hence its predicting ability. Variables in the upper right part are potential confounders for which prediction model should be adjusted, or collinear variables that should be removed. Variables in the lower right part are strongly related to the predictor, but not associated with the outcome. Variables very close to the outcome variable's point are potential surrogate outcomes.}

\value{Scatterplot of variable similarities. Chosen predictor and outcome variables are highlighted in bold. Categorical/quantitative variables are shown in blue/black by default.}

%\references{}

\author{Manuela Hummel}

\seealso{\code{\link{similarity.variables}}}

\examples{
data(mixdata)

confounderPlot(mixdata, x="X2.quant", y="X1.cat")
}

\keyword{ hplot }
