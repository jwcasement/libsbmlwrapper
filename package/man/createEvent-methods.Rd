\docType{methods}
\name{createEvent}
\alias{createEvent}
\alias{createEvent,_p_Model-method}
\alias{createEvent,_p_Model,ANY-method}
\title{A generic for createEvent}
\arguments{
  \item{obj}{a_p_Model object}

  \item{i}{a vector of integers indicating objects to be
  copied or created}

  \item{object}{a _p_Model object}

  \item{i}{a vector of integers indicating objects to be
  copied or created}
}
\description{
  A generic for createEvent

  Function for adding a _p_Event object to an SBML model
}
\details{
  Creates or copies a _p_Event object and adds it to the
  _p_Model object
}
\note{
  Where a new _p_Event object is created, the SBML Level
  and Version of the _p_Model object, (and any SBML package
  namespaces), are used to initialise the attributes of the
  new _p_Event object to 'typical' defaults
}

