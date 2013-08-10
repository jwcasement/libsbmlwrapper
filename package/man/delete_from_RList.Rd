\name{delete_from_RList}
\alias{delete_from_RList}
\title{Delete object from a container object}
\usage{
  delete_from_RList(RList, index, value)
}
\arguments{
  \item{RList}{the R_ListOf object}

  \item{index}{an integer corresponding to the position of
  the object in \code{RList} to be deleted}

  \item{value}{set to NULL to indicate that the object will
  be deleted}
}
\value{
  the R_ListOf object \code{RList} with the element at
  \code{index} deleted
}
\description{
  A function to delete an object from an R_ListOf object
}
\details{
  The object is also removed from the parent model
}

