% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/filter.R
\name{filter_by_bbox}
\alias{filter_by_bbox}
\title{Filter FORCIS data by a spatial bounding box}
\usage{
filter_by_bbox(data, coord_square)
}
\arguments{
\item{data}{a \code{data.frame}, i.e. a FORCIS dataset.}

\item{coord_square}{a vector of four \code{numeric} values defining a square
bounding box. Values must follow this order: minimum latitude, minimum
longitude, maximum latitude, and maximum longitude.}
}
\value{
A \code{data.frame} containing a subset of \code{data}.
}
\description{
This function can be used to filter FORCIS data by a spatial bounding box.
}
\examples{
## ADD EXAMPLE ----
}