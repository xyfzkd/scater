% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runMDS.R
\name{runMDS}
\alias{runMDS}
\title{Perform MDS on cell-level data}
\usage{
runMDS(object, ncomponents = 2, ntop = 500, feature_set = NULL,
  exprs_values = "logcounts", scale_features = TRUE,
  use_dimred = NULL, n_dimred = NULL, method = "euclidean")
}
\arguments{
\item{object}{A SingleCellExperiment object.}

\item{ncomponents}{Numeric scalar indicating the number of MDS dimensions to obtain.}

\item{ntop}{Numeric scalar specifying the number of most variable features to use for MDS.}

\item{feature_set}{Character vector of row names, a logical vector or a numeric vector of indices indicating a set of features to use for MDS.
This will override any \code{ntop} argument if specified.}

\item{exprs_values}{Integer scalar or string indicating which assay of \code{object} should be used to obtain the expression values for the calculations.}

\item{scale_features}{Logical scalar, should the expression values be standardised so that each feature has unit variance?}

\item{use_dimred}{String or integer scalar specifying the entry of \code{reducedDims(object)} to use as input to \code{\link{cmdscale}}.
Default is to not use existing reduced dimension results.}

\item{n_dimred}{Integer scalar, number of dimensions of the reduced dimension slot to use when \code{use_dimred} is supplied.
Defaults to all available dimensions.}

\item{method}{String specifying the type of distance to be computed between cells.}
}
\value{
A SingleCellExperiment object containing the coordinates of the first \code{ncomponent} MDS dimensions for each cell.
This is stored in the \code{"MDS"} entry of the \code{reducedDims} slot.
}
\description{
Perform multi-dimensional scaling (MDS) on cells, based on the data in a SingleCellExperiment object.
}
\details{
The function \code{\link{cmdscale}} is used internally to compute the multidimensional scaling components to plot.

Setting \code{use_dimred} allows users to easily perform MDS on low-rank approximations of the original expression matrix (e.g., after PCA).
In such cases, arguments such as \code{ntop}, \code{feature_set}, \code{exprs_values} and \code{scale_features} will be ignored.
}
\examples{
## Set up an example SingleCellExperiment
data("sc_example_counts")
data("sc_example_cell_info")
example_sce <- SingleCellExperiment(
    assays = list(counts = sc_example_counts),
    colData = sc_example_cell_info
)
example_sce <- normalize(example_sce)

example_sce <- runMDS(example_sce)
reducedDimNames(example_sce)
head(reducedDim(example_sce))
}
\seealso{
\code{\link{cmdscale}},
\code{\link[scater]{plotMDS}}
}
\author{
Aaron Lun, based on code by Davis McCarthy
}
