% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/collapsibleTree.R
\name{collapsibleTree}
\alias{collapsibleTree}
\title{Create Interactive Collapsible Tree Diagrams}
\source{
Christopher Gandrud: \url{http://christophergandrud.github.io/networkD3/}.

d3noob: \url{https://bl.ocks.org/d3noob/43a860bc0024792f8803bba8ca0d5ecd}.
}
\usage{
collapsibleTree(df, ...)
}
\arguments{
\item{df}{a \code{data.frame} from which to construct a nested list or
a preconstructed \code{data.tree}}

\item{...}{other arguments to pass onto S3 methods that implement
this generic function - \code{collapsibleTree.data.frame}, \code{collapsibleTree.Node}}
}
\description{
Interactive Reingold-Tilford tree diagram created using D3.js,
where every node can be expanded and collapsed by clicking on it.
}
\examples{
collapsibleTree(warpbreaks, c("wool", "tension", "breaks"))

# Data from US Forest Service DataMart
species <- read.csv(system.file("extdata/species.csv", package = "collapsibleTree"))
collapsibleTree(df = species, c("REGION", "CLASS", "NAME"), fill = "green")

# Visualizing the order in which the node colors are filled
library(RColorBrewer)
collapsibleTree(
  warpbreaks, c("wool", "tension"),
  fill = brewer.pal(9, "RdBu"),
  fillByLevel = TRUE
)
collapsibleTree(
  warpbreaks, c("wool", "tension"),
  fill = brewer.pal(9, "RdBu"),
  fillByLevel = FALSE
)

# Tooltip can be mapped to an attribute, or default to leafCount
collapsibleTree(
  warpbreaks, c("wool", "tension", "breaks"),
  tooltip = TRUE,
  attribute = "breaks"
)

 ## collapsibleTree.Node example
species <- read.csv(system.file("extdata/species.csv", package = "collapsibleTree"))
hierarchy <- c("REGION", "CLASS", "NAME")
species$pathString <- paste(deparse(substitute(species)),
  apply(species[,hierarchy], 1, paste, collapse = "//"), sep = "//")
df <- data.tree::as.Node(species, pathDelimiter = "//")
collapsibleTree(df, hierarchy_attribute = "level")
}
\seealso{
Other coallpsible tree functions: \code{\link{collapsibleTree.Node}},
  \code{\link{collapsibleTree.data.frame}}
}
