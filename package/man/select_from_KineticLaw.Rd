\name{select_from_KineticLaw}
\alias{select_from_KineticLaw}
\title{Select _p_KineticLaw sub-components}
\usage{
  select_from_KineticLaw(x, i)
}
\arguments{
  \item{x}{a _p_KineticLaw object}

  \item{i}{a string which should be
  "DerivedUnitDefinition", "ListOfLocalParameters",
  "ListOfParameters", "LocalParameter", "Parameter" or a
  KineticLaw attribute}
}
\value{
  an object of class R_ListOfLocalParameters,
  R_ListOfParameters, _p_UnitDefinition or a call to
  \code{get_attribute_from_component}
}
\description{
  select_from_KineticLaw
}
\details{
  Handles requests for "KineticLaw" from a _p_Reaction
  object
}

