\name{select_from_Reaction}
\alias{select_from_Reaction}
\title{Select _p_Reaction sub-components}
\usage{
  select_from_Reaction(x, i)
}
\arguments{
  \item{x}{a _p_Reaction object}

  \item{i}{a string which should be one of those listed in
  the Note below, or a Reaction attribute}
}
\value{
  an object of class R_ListOfSpeciesReferences,
  R_ListOfModifierSpeciesReferences, _p_KineticLaw or a
  call to \code{get_attribute_from_component}
}
\description{
  select_from_Reaction
}
\details{
  Handles requests for sub-components of a _p_Reaction
  object
}
\note{
  Valid strings are:

  "ListOfReactants", "ListOfProducts", "ListOfModifiers"
  which will return an R_ListOfSpeciesReferences object
  containing _p_SimpleSpeciesReference objects;

  "Product", "Reactant" which will return an
  R_ListOfSpeciesReferences object containing
  _p_SpeciesReference objects;

  "Modifier" which will return an
  R_ListOfModifierSpeciesReferences object;

  "KineticLaw" which will return a _p_KineticLaw object.

  Other strings will be treated as attributes, resulting in
  a call to \code{get_attribute_from_component}
}

