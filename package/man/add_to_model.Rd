\name{add_to_model}
\alias{add_to_model}
\title{Add to a model}
\usage{
  add_to_model(compStr, obj, index)
}
\arguments{
  \item{compStr}{a string indicating the SBML component to
  be created}

  \item{obj}{the model object to which the component will
  be added}

  \item{index}{a vector of integers indicating the object
  to be copied}
}
\description{
  A function to add an SBML component object to a model
}
\details{
  Can add a new object (initialised to typical defaults) or
  a copy of an existing object within the model
}
\note{
  if \code{index} is missing or equal to zero, a new object
  (initialised to typical defaults) will be added to the
  model
}

