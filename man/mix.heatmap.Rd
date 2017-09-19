\name{mix.heatmap}
\alias{mix.heatmap}
\title{Heatmap for data with variables of mixed types}

\description{Produces a heatmap visualizing all samples and variables of a dataset. Both samples and variables are clustered using methods suitable for mixed-type data. Different types of variables are indicated by different color schemes.}

\usage{
mix.heatmap(data, D.subjects, D.variables, dend.subjects, dend.variables, varweights,
dist.variables.method = c("associationMeasures", "distcor", "ClustOfVar"), 
linkage="ward.D2", associationFun = association, rowlab, rowmar = 3, lab.cex = 1.5, 
ColSideColors, RowSideColors, 
col.cont = marray::maPalette(low = "lightblue", high = "darkblue", k = 50), 
cont.fixed.range = FALSE, cont.range,
col.ord = list(low = "lightgreen", high = "darkgreen"), 
col.cat = c("indianred1","darkred","orangered","orange","palevioletred1",
          "violetred4","red3","indianred4"), 
legend.colbar, legend.rowbar, legend.mat = FALSE, legend.cex = 1, legend.srt = 0)
}

\arguments{
  \item{data}{data frame where columns are variables (of different data types) and rows are observations (subjects, samples)}
  \item{D.subjects}{A previously calculated distance matrix (class \code{dissimilarity}) for subjects can be given. If missing, it is calculated by \code{\link{dist.subjects}}. If set to \code{NULL}, no clustering is done and original order in \code{data} will be preserved.}
  \item{D.variables}{A previously calculated distance matrix (of class \code{dissimilarity}) for variables can be given. If missing, it is calculated by \code{\link{dist.variables}}. If set to \code{NULL}, no clustering is done and original order in \code{data} will be preserved.}
  \item{dend.subjects}{A \code{dendrogram} for subjects can be given; then no distances between subjects will be calculated and \code{D.subjects} will be ignored.}
  \item{dend.variables}{A \code{dendrogram} for variables can be given; then no distances between variables will be calculated and \code{D.variables} will be ignored.}
  \item{varweights}{optional vector of variable weights, used for calculating Gower's distances between subjects}
  \item{dist.variables.method}{If \code{"associationMeasures"}, similarities between variables are assessed by combination of appropriate measures of association for different pairs of data types. If \code{"distcor"}, distances between variables are calculated based on distance correlation. In both cases, then a dendrogram is derived by standard hierarchical clustering (\code{\link[stats]{hclust}}). If \code{"ClustOfVar"}, variables are clustered by \code{\link[ClustOfVar]{hclustvar}} from the \code{ClustOfVar} package.}
  \item{linkage}{agglomeration method used for hierarchical clustering; corresponds to parameter \code{method} of \code{\link[stats]{hclust}}}
  \item{associationFun}{By default, appropriate association measures are chosen for each pair of variables, see \code{\link{association}} for details. But the user can also define a function that for any two variables calculates a similarity measure. Ignored if \code{dist.variables.method = "ClustOfVar"} or \code{"distcor"}}
  \item{rowlab}{row (variable) labels; if missing, column names of \code{data} are used}
  \item{rowmar}{margin for row (variable) labels}
  \item{lab.cex}{size of row (variable) labels}
  \item{ColSideColors}{vector of length \code{nrow(data)} specifying colors for a color bar added on top of the heatmap}
  \item{RowSideColors}{vector of length \code{ncol(data)} specifying colors for a color bar added to the left of the heatmap}
  \item{col.cont}{color palette for continuous variables; defaults to red-blue color palette}
  \item{cont.fixed.range}{If \code{FALSE}, color range of each continuous variable is defined by respective individual variable's range. If \code{TRUE}, all continuous variables are assumed to have similar range and hence shall have the same color range; "extreme colors" then correspond to extreme values over all continuous variables and are applied to all of them equally. In any case, in order to prevent outlier values to dominate the color scale, "extreme colors" are restricted to 2.5\% and 97.5\% quantiles. Defaults to \code{FALSE}}
  \item{cont.range}{if \code{cont.fixed.range=TRUE}, extreme value limits for coloring continuous variables can be specified;  if missing, extreme values are taken from the data; ignored if \code{cont.fixed.range=FALSE}}
  \item{col.ord}{List with names of colors for the lowest and highest categories of ordinal variables. A color palette will be created correspondingly based on the number of categories. Defaults to a green color palette}
  \item{col.cat}{vector of colors for categorical variables}
  \item{legend.colbar}{class labels for subject groups defined by \code{ColSideColors}}
  \item{legend.rowbar}{class labels for variable groups defined by \code{RowSideColors}}
  \item{legend.mat}{shall legend matrix for heatmap be shown?}
  \item{legend.cex}{size of legend text}
  \item{legend.srt}{legend matrix label string rotation in degrees; i.e. \code{legend.srt = 90} produces vertical labels}
}

\details{If no dendrograms or distance matrices are given, subjects and/or samples are clustered with methods for mixed-type data. Similarities between subjects are measured by Gower's general similarity coefficient with an extension of Podani for ordinal variables, see \code{\link[FD]{gowdis}}. Similarities between variables can be assessed by combination of appropriate measures of association for different pairs of data types, see \code{\link{association}}, or based on distance correlation. Then standard hierarchical clustering with by default Ward's minimum variance method is applied. Alternatively, variables can also be clustered by the \code{ClustOfVar} approach.

Variables are shown as rows of the heatmap, samples as columns.}

\value{A mixed-data heatmap with dendrograms and annotation}

\references{
Hummel M, Edelmann D, Kopp-Schneider A. Clustering of samples and variables with mixed-type data. Submitted.

Gower J (1971). A general coefficient of similarity and some of its properties. Biometrics, 27:857-871.

Chavent M, Kuentz-Simonet V, Liquet B, Saracco J (2012). ClustOfVar: An R Package for the Clustering of Variables. Journal of Statistical Software, 50:1-16.

Szekely GJ, Rizzo ML, Bakirov NK (2007). Measuring and testing dependence by correlation of distances. The Annals of Statistics, 35.6:2769-2794.

Lyons R (2013). Distance covariance in metric spaces. The Annals of Probability, 41.5:3284-3305.
}

\author{Manuela Hummel, m.hummel@dkfz.de}

\note{The heatmap is currently limited to 200 variables = columns of \code{data} = heatmap rows.}

\seealso{\code{\link{dist.variables}}, \code{\link{dist.subjects}}, \code{\link{dendro.variables}}, \code{\link{dendro.subjects}},\code{\link{distmap}}}

\examples{
data(mixdata)

mix.heatmap(mixdata, rowmar=7, legend.mat=TRUE)

## with distance correlation
mix.heatmap(mixdata, dist.variables.method="distcor", rowmar=7, legend.mat=TRUE)

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
