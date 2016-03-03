\name{mixdata}
\alias{mixdata}
\docType{data}
\title{ Small example dataset with variables of different types}

\description{Simulated dataset with quantitative, ordinal and categorical variables. Some variables are correlated and some are associated to sample groups.}

\usage{data(mixdata)}

\format{
\code{mixdata} is a data frame with 40 samples (rows) and 10 variables (columns). The variable names indicate their type, i.e. '.quant' (quantitative), '.ord' (ordinal), '.cat' (categorical). 
}
  
\examples{
data(mixdata)
str(mixdata)
}
\keyword{datasets}
