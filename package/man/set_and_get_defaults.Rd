\name{set_and_get_defaults}
\alias{set_and_get_defaults}
\title{Set and get attribute defaults}
\usage{
  set_and_get_defaults()
}
\value{
  a list containing the functions \code{get_Defaults} and
  \code{set_Defaults}
}
\description{
  Generate defaults for attributes of component objects
}
\note{
  There is no 'createSpeciesReference' function in libSBML,
  hence the additional routine of using 'createProduct' to
  generate a SpeciesReference object initialised to typical
  defaults.
}

