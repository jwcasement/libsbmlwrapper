\docType{methods}
\name{delete_RListOf}
\alias{[[<-,R_ListOf,ANY-method}
\alias{[[<-,R_ListOf,numeric,missing-method}
\alias{delete_RListOf}
\title{Delete an object from an R_ListOf object}
\arguments{
  \item{x}{an R_ListOf object}

  \item{i}{an integer indicating the position of the object
  to be deleted}

  \item{value}{set to NULL to indicate that the object will
  be deleted}
}
\description{
  Delete an object by setting value to NULL
}
\details{
  Deletes a member of an R_ListOf object and removes it
  from the model
}

