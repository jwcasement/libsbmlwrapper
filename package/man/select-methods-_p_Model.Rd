\docType{methods}
\name{select_from_model}
\alias{[}
\alias{[,R_ListOf,ANY-method}
\alias{[,R_ListOf,numeric-method}
\alias{[[}
\alias{[[,_p_Component,ANY-method}
\alias{[[,_p_Component,character,missing-method}
\alias{[[,_p_Model,ANY-method}
\alias{[[,_p_Model,ANY,missing-method}
\alias{[[<-}
\alias{[[<-,_p_Component,ANY-method}
\alias{[[<-,_p_Component,character,missing-method}
\alias{[[<-,R_ListOf,ANY-method}
\alias{[[<-,R_ListOf,numeric,missing-method}
\alias{select_from_model}
\title{Selection of model component}
\arguments{
  \item{x}{a _p_Model object}

  \item{i}{a character string or number indicating the
  component list being selected}
}
\value{
  an R_ListOf object containing SBML component objects
}
\description{
  A select function for a _p_Model object
}
\details{
  Selects an SBML _p_ListOf container object and converts
  to an R_ListOf container object
}
