\name{get_filtered_list_from_R_ListOf}
\alias{get_filtered_list_from_R_ListOf}
\title{Filter a list}
\usage{
  get_filtered_list_from_R_ListOf(listStr, RList, index)
}
\arguments{
  \item{listStr}{a string containing the name of an SBML
  component (plural)}

  \item{RList}{the R_ListOf object to be filtered}

  \item{index}{a vector specifying the elements of RList to
  be retained}
}
\value{
  a filtered R_ListOf object containing only the elements
  at positions in the vector \code{index}
}
\description{
  get_filtered_list_from_R_ListOf
}
\details{
  Allows an R_ListOf object to be filtered
}

