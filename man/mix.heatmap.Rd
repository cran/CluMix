\name{mix.heatmap}
\alias{mix.heatmap}
\title{Heatmap for data with variables of mixed types}

\description{Produces a heatmap visualizing all samples and variables of a dataset. Both samples and variables are clustered using methods suitable for mixed-type data. Different types of variables are indicated by different color schemes.}

\usage{
mix.heatmap(data, D.subjects, D.variables, dend.subjects, dend.variables, varweights,
dist.variables.method = c("associationMeasures", "ClustOfVar"), 
associationFun = association, rowlab, rowmar = 3, lab.cex = 1.5, 
ColSideColors, RowSideColors, 
col.cont = marray::maPalette(low = "lightblue", high = "darkblue", k = 50), 
col.ord = list(low = "lightgreen", high = "darkgreen"), 
col.cat = c("indianred1","darkred","orangered","orange","palevioletred1",
          "violetred4","red3","indianred4"), 
legend.colbar, legend.rowbar, legend.mat = FALSE, legend.cex = 1)
}

\arguments{
  \item{data}{data frame where columns are variables (of different data types) and rows are observations (subjects, samples)}
  \item{D.subjects}{A previously calculated distance matrix (class \code{dissimilarity} for subjects can be given. If missing, it is calculated by \code{\link{dist.subjects}}. If set to \code{NULL}, no clustering is done and original order in \code{data} will be preserved.}
  \item{D.variables}{A previously calculated distance matrix (of class \code{dissimilarity} for variables can be given. If missing, it is calculated by \code{\link{dist.variables}}. If set to \code{NULL}, no clustering is done and original order in \code{data} will be preserved.}
  \item{dend.subjects}{A \code{dendrogram} for subjects can be given; then no distances between subjects will be calculated and \code{D.subjects} will be ignored.}
  \item{dend.variables}{A \code{dendrogram} for variables can be given; then no distances between variables will be calculated and \code{D.variables} will be ignored.}
  \item{varweights}{optional vector of variable weights, used for calculating Gower's distances between subjects}
  \item{dist.variables.method}{If \code{"associationMeasures"}, similarities between variables are assessed by combination of appropriate measures of association for different pairs of data types. Then a dendrogram is derived by standard hierarchical clustering (\code{\link[stats]{hclust}} with default options). If \code{"ClustOfVar"}, variables are clustered by the \code{\link{ClustOfVar}{ClustOfVar}} approach.}
  \item{associationFun}{By default, appropriate association measures are chosen for each pair of variables, see \code{\link{association}} for details. But the user can also define a function that for any two variables calculates a similarity measure. Ignored if \code{dist.variables.method = "ClustOfVar"}}
  \item{rowlab}{row (variable) labels; if missing, column names of \code{data} are used}
  \item{rowmar}{margin for row (variable) labels}
  \item{lab.cex}{size of row (variable) labels}
  \item{ColSideColors}{vector of length \code{nrow(data)} specifying colors for a color bar added on top of the heatmap}
  \item{RowSideColors}{vector of length \code{ncol(data)} specifying colors for a color bar added to the left of the heatmap}
  \item{col.cont}{color palette for continuous variables; defaults to red-blue color palette}
  \item{col.ord}{List with names of colors for the lowest and highest categories of ordinal variables. A color palette will be created correspondingly based on the number of categories. Defaults to a green color palette}
  \item{col.cat}{vector of colors for categorical variables}
  \item{legend.colbar}{class labels for subject groups defined by ColSideColors}
  \item{legend.rowbar}{class labels for variable groups defined by RowSideColors}
  \item{legend.mat}{shall legend matrix for heatmap be shown?}
  \item{legend.cex}{size of legend text}
}

\details{If no dendrograms or distance matrices are given, subjects and/or samples are clustered with methods for mixed-type data. Similarities between subjects are measured by Gower's general similarity coefficient with an extension of Podani for ordinal variables, see \code{\link[FD]{gowdis}}. Similarities between variables are assessed by combination of appropriate measures of association for different pairs of data types, see \code{\link{association}}. Then standard hierarchical clustering is applied. Alternatively, variables can also be clustered by the \code{\link{ClustOfVar}{ClustOfVar}} approach.

Variables are shown as rows of the heatmap, samples as columns.}

\value{A mixed-data heatmap with dendrograms and annotation}

\references{
Gower J (1971). A general coefficient of similarity and some of its properties. Biometrics, 27:857-871.

Chavent M, Kuentz-Simonet V, Liquet B, Saracco J (2012). ClustOfVar: An R Package for the Clustering of Variables. Journal of Statistical Software, 50:1-16.
}

\author{Manuela Hummel, m.hummel@dkfz.de}

\note{The heatmap is currently limited to 200 variables = columns of \code{data} = heatmap rows.}

\seealso{\code{\link{dist.variables}}, \code{\link{dist.subjects}}, \code{\link{dendro.variables}}, \code{\link{dendro.subjects}},\code{\link{distmap}}}

\examples{
data(mixdata)

mix.heatmap(mixdata, rowmar=7, legend.mat=TRUE)

## with (random) color bars 
colbar <- rep(5:7, nrow(mixdata))
rowbar <- rep(c("darkorange","grey"), ncol(mixdata))
mix.heatmap(mixdata, ColSideColors=colbar, RowSideColors=rowbar, 
legend.colbar=c("1","2","3"), legend.rowbar=c("a","b"), rowmar=7)

## example with variable weights
w <- rep(1:2, each=5)
mix.heatmap(mixdata, varweights=w, rowmar=7)
}

\keyword{ hplot }
