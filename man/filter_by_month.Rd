% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/filter_by_month.R
\name{filter_by_month}
\alias{filter_by_month}
\title{Filter FORCIS data by month of sampling}
\usage{
filter_by_month(data, months)
}
\arguments{
\item{data}{a \code{data.frame}. One obtained by \verb{read_*_data()} functions.}

\item{months}{a \code{numeric} containing one or several months.}
}
\value{
A \code{data.frame} containing a subset of \code{data} for the desired months.
}
\description{
Filters FORCIS data by month of sampling.
}
\examples{
# Attach the package ----
library("forcis")

# Import example dataset ----
file_name <- system.file(file.path("extdata", "FORCIS_pump_sample.csv"), 
                         package = "forcis")

pump_data <- vroom::vroom(file_name, delim = ";", show_col_types = FALSE)

# Add 'data_type' column ----
pump_data$"data_type" <- "Pump"

# Dimensions of the data.frame ----
dim(pump_data)

# Filter by months ----
pump_data_sub <- filter_by_month(pump_data, months = 1:2)

# Dimensions of the data.frame ----
dim(pump_data_sub)
}
