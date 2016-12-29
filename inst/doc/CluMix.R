### R code from vignette source 'CluMix.Rnw'

###################################################
### code chunk number 1: data
###################################################
library(CluMix)
data(mixdata)
str(mixdata)


###################################################
### code chunk number 2: CluMix.Rnw:56-57 (eval = FALSE)
###################################################
## mix.heatmap(mixdata, rowmar=7, legend.mat=TRUE)


###################################################
### code chunk number 3: heat1
###################################################
mix.heatmap(mixdata, rowmar=7, legend.mat=TRUE)


###################################################
### code chunk number 4: CluMix.Rnw:72-74 (eval = FALSE)
###################################################
## w <- rep(1:2, each=5)
## mix.heatmap(mixdata, varweights=w, rowmar=7)


###################################################
### code chunk number 5: heat2
###################################################
w <- rep(1:2, each=5)
mix.heatmap(mixdata, varweights=w, rowmar=7)


###################################################
### code chunk number 6: heat3 (eval = FALSE)
###################################################
## mix.heatmap(mixdata, dist.variables.method="ClustOfVar", rowmar=7)


###################################################
### code chunk number 7: dendextend
###################################################
D.subjects <- dist.subjects(mixdata)
dend.variables <- dendro.variables(mixdata, dist.variables.method="ClustOfVar")

require(dendextend)
dend.variables <- dend.variables %>% set("branches_k_color", k=2, value=2:3) %>% 
                                     set("branches_lwd", 2)


###################################################
### code chunk number 8: CluMix.Rnw:116-117 (eval = FALSE)
###################################################
## mix.heatmap(mixdata, D.subjects=D.subjects, dend.variables=dend.variables, rowmar=7)


###################################################
### code chunk number 9: heat4
###################################################
mix.heatmap(mixdata, D.subjects=D.subjects, dend.variables=dend.variables, rowmar=7)


###################################################
### code chunk number 10: CluMix.Rnw:132-134 (eval = FALSE)
###################################################
## colbar <- sample(c("purple", "darkgrey"), nrow(mixdata), replace=T)
## mix.heatmap(mixdata, ColSideColors=colbar, legend.colbar=c("aa", "bb"), rowmar=7)


###################################################
### code chunk number 11: heat5
###################################################
colbar <- sample(c("purple", "darkgrey"), nrow(mixdata), replace=T)
mix.heatmap(mixdata, ColSideColors=colbar, legend.colbar=c("aa", "bb"), rowmar=7)


###################################################
### code chunk number 12: CluMix.Rnw:155-156 (eval = FALSE)
###################################################
## distmap(mixdata, what="variables", margins=c(6,6))


###################################################
### code chunk number 13: distmap
###################################################
distmap(mixdata, what="variables", margins=c(6,6))


###################################################
### code chunk number 14: distmap2 (eval = FALSE)
###################################################
## S <- similarity.variables(mixdata)
## distmap(S)


###################################################
### code chunk number 15: CluMix.Rnw:182-183 (eval = FALSE)
###################################################
## confounderPlot(mixdata, x="X4.ord", y="X1.cat")


###################################################
### code chunk number 16: confplot
###################################################
confounderPlot(mixdata, x="X4.ord", y="X1.cat")


###################################################
### code chunk number 17: sessioninfo
###################################################
require(devtools)
session_info()


