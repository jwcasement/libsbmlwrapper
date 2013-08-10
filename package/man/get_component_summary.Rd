\name{get_component_summary}
\alias{get_component_summary}
\title{Component summary}
\usage{
  get_component_summary(compStr, obj, tags)
}
\arguments{
  \item{compStr}{a string containing the name of an SBML
  component (singular)}

  \item{obj}{the component object to be summarised}

  \item{tags}{the names of the attributes of the component
  object \code{obj}}
}
\value{
  a list of attribute values
}
\description{
  A summary function for an SBML component object
}
\details{
  Returns a list of attribute values, with tags
  corresponding to component attribute names
}

