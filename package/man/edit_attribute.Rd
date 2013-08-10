\name{edit_attribute}
\alias{edit_attribute}
\title{Edit an attribute}
\usage{
  edit_attribute(compStr, obj, attrStr, newAttr)
}
\arguments{
  \item{compStr}{a string containing the name of an SBML
  component (singular)}

  \item{obj}{the component object to be edited}

  \item{attrStr}{a string containing the name of the
  attribute to be edited}

  \item{newAttr}{the new value of the attribute in
  \code{attrStr}}
}
\value{
  the modified component object \code{obj}
}
\description{
  A function for editing an attribute of a component object
}

