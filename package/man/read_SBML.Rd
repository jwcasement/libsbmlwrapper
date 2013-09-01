\docType{methods}
\name{readSBML}
\alias{readSBML}
\alias{readSBMLFromFile}
\alias{readSBMLFromString}
\title{Read an SBML file}
\usage{
  readSBML(filename)

  readSBMLFromFile(filename)

  readSBMLFromString(xml)
}
\arguments{
  \item{filename}{a character string representing an SBML
  file}

  \item{xml}{string containing an SBML file}
}
\description{
  Read an SBML file
}
\details{
  Reads SBML file, sets defaults, and returns a
  _p_SBMLDocument object
}
\note{
  \code{readSBML} is an alias for \code{readSBMLFromFile}.
}



