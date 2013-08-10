\name{get_default_attribute}
\alias{get_default_attribute}
\title{Default attribute}
\usage{
  get_default_attribute(compStr, attrStr)
}
\arguments{
  \item{compStr}{a string containing the name of an SBML
  component (singular)}

  \item{attrStr}{a string containing the name of the
  attribute}
}
\value{
  the typical default value for the attribute in
  \code{attrStr}
}
\description{
  A function to determine the typical default value of an
  attribute
}
\note{
  g is a global list returned by
  \code{set_and_get_defaults()}
}

