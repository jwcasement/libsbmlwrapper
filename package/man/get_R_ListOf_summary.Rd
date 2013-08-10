\name{get_R_ListOf_summary}
\alias{get_R_ListOf_summary}
\title{R_ListOf object summary}
\usage{
  get_R_ListOf_summary(compStr, RList, tags)
}
\arguments{
  \item{compStr}{a string containing the name of an SBML
  component (singular)}

  \item{RList}{the R_ListOf object to be summarised}

  \item{tags}{the names of the attributes of the component
  objects in \code{RList}}
}
\value{
  a list of vectors containing attribute values
}
\description{
  A summary function for an R_ListOf object
}
\details{
  Returns a list of vectors containing attribute values for
  all elements in the R_ListOf object, with tags
  corresponding to component attribute names
}

