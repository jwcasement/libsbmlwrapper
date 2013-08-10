\name{get_default_nodes}
\alias{get_default_nodes}
\title{SBML components with attribute defaults}
\usage{
  get_default_nodes(level)
}
\arguments{
  \item{level}{an SBML model level}
}
\value{
  a listing of all SBML components for which typical
  defaults can be generated
}
\description{
  A listing of SBML components for which attribute defaults
  exist
}
\note{
  Not all components are included in the lists returned by
  this function since some components do not have typical
  defaults and some do not have attributes. For SBML Level
  3, the list also excludes the 'CompartmentType' and
  'SpeciesType' components since these do not exist in SBML
  Level 3.
}

