# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html

# load an SBML file
data(enzymaticreaction)

# create a _p_SBMLDocument object
doc = readSBMLFromString(enzymaticreaction)

# get number of errors
errors  = SBMLDocument_getNumErrors(doc)

# print errors if present
if (errors > 0) SBMLDocument_printErrors(doc)