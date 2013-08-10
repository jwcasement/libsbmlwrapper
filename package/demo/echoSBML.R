# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html

# load an SBML file
data(ts_case00247)

# create a _p_SBMLDocument object
doc = readSBMLFromString(ts_case00247)

# check for errors
if (SBMLDocument_getNumErrors(doc) > 0) {
  SBMLDocument_printErrors(doc)
}

# Echo the SBML document with
# writeSBML(doc, "nameOfOutputFile.xml")

