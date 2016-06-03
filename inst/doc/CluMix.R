### R code from vignette source 'CluMix.Rnw'

###################################################
### code chunk number 1: data
###################################################
library(CluMix)
data(mixdata)
str(mixdata)


###################################################
### code chunk number 2: heat1
###################################################
mix.heatmap(mixdata, rowmar=7, legend.mat=TRUE)


###################################################
### code chunk number 3: heat1
###################################################
w <- rep(1:2, each=5)
mix.heatmap(mixdata, varweights=w, rowmar=7)


###################################################
### code chunk number 4: heat2
###################################################
mix.heatmap(mixdata, dist.variables.method="ClustOfVar", rowmar=7)


###################################################
### code chunk number 5: heat3
###################################################
D.subjects <- dist.subjects(mixdata)
dend.variables <- dendro.variables(mixdata)
mix.heatmap(mixdata, D.subjects=D.subjects, dend.variables=dend.variables)


###################################################
### code chunk number 6: heat4
###################################################
colbar <- sample(c("purple", "darkgrey"), nrow(mixdata), replace=T)
mix.heatmap(mixdata, ColSideColors=colbar, legend.colbar=c("aa", "bb"), rowmar=7)


###################################################
### code chunk number 7: distmap
###################################################
distmap(mixdata, what="variables", margins=c(6,6))


###################################################
### code chunk number 8: distmap2
###################################################
S <- similarity.variables(mixdata)
distmap(S)


###################################################
### code chunk number 9: confplot
###################################################
confounderPlot(mixdata, x="X4.ord", y="X1.cat")


###################################################
### code chunk number 10: sessioninfo
###################################################
toLatex(sessionInfo())


