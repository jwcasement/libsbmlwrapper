\name{select_from_UnitDefinition}
\alias{select_from_UnitDefinition}
\title{Select _p_UnitDefinition sub-components}
\usage{
  select_from_UnitDefinition(x, i)
}
\arguments{
  \item{x}{a _p_UnitDefinition object}

  \item{i}{a string which should be "ListOfUnits" or a
  UnitDefinition attribute}
}
\value{
  an R_ListOfUnits object containing _p_Unit objects, or a
  call to \code{get_attribute_from_component}
}
\description{
  select_from_UnitDefinition
}
\details{
  Handles requests for "ListOfUnits" from a
  _p_UnitDefinition object
}

