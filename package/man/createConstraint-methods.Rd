\docType{methods}
\name{createConstraint}
\alias{createConstraint}
\alias{createConstraint,_p_Model-method}
\alias{createConstraint,_p_Model,ANY-method}
\title{A generic for createConstraint}
\arguments{
  \item{obj}{a_p_Model object}

  \item{i}{a vector of integers indicating objects to be
  copied or created}

  \item{object}{a _p_Model object}

  \item{i}{a vector of integers indicating objects to be
  copied or created}
}
\description{
  A generic for createConstraint

  Function for adding a _p_Constraint object to an SBML
  model
}
\details{
  Creates or copies a _p_Constraint object and adds it to
  the _p_Model object
}
\note{
  Where a new _p_Constraint object is created, the SBML
  Level and Version of the _p_Model object, (and any SBML
  package namespaces), are used to initialise the
  attributes of the new _p_Constraint object to 'typical'
  defaults
}

