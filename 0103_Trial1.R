# Discrete Graphical Model Trial 1
# Follow the R book on the packages, igraph, gRain, etc.

source("https://bioconductor.org/biocLite.R")
biocLite("RBGL")
biocLite("Rgraphviz")
install.packages("gRbase")
install.packages("gRain")

library(igraph)
library(gRain)
library(Rgraphviz)

# 
uG1 <- ug(~ a:b:c + c:d)
uG2 <- ug(c("a","b","c"), c("c","d"))
uG3 <- ug(c("a","b"), c("a","c"), c("b","c"), c("c","d"))

# log linear models
data(reinis)
as.data.frame(reinis)

# To read Page 79
install.packages("bnlearn")

library(gRbase)
data(cad1, package='gRbase')
library(bnlearn)
cad.bn <- hc(cad1)
plot(as(amat(cad.bn), "graphNEL"))


# The two algorithms to learn the undirected model.
t1 <- aracne(cad1)
plot(as(amat(t1), "graphNEL"))

t2 <- chow.liu(cad1)
plot(as(amat(t2), "graphNEL"))
