# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html

# load an SBML file
data(enzymaticreaction)

# create a _p_SBMLDocument object
doc = readSBMLFromString(enzymaticreaction)

# now create a _p_Model object
mod = SBMLDocument_getModel(doc)

# get a _p_Species object from the model
s <- Model_getSpecies(mod ,0)

# no CV terms will be added if there is no metaid to reference,
# so set a metaId if not already set
if (SBase_isSetMetaId(s) == FALSE)
  SBase_setMetaId(s, "__meta2501")

# create CVTerm objects
cv <- CVTerm("BIOLOGICAL_QUALIFIER")
CVTerm_setBiologicalQualifierType(cv, "BQB_IS_VERSION_OF")
CVTerm_addResource(cv, "http://www.geneontology.org/#GO:0005892")

cv2 <- CVTerm("BIOLOGICAL_QUALIFIER")
CVTerm_setBiologicalQualifierType(cv2, "BQB_IS")
CVTerm_addResource(cv2, "http://www.geneontology.org/#GO:0005895")

cv1 <- CVTerm("BIOLOGICAL_QUALIFIER")
CVTerm_setBiologicalQualifierType(cv1, "BQB_IS_VERSION_OF")
CVTerm_addResource(cv1, "http://www.ebi.ac.uk/interpro/#IPR002394")

#now add the CV terms cv, cv2, cv1 to the _p_Species object s
SBase_addCVTerm(s, cv)
SBase_addCVTerm(s, cv2)
SBase_addCVTerm(s, cv1)

# The SBML document with CV terms added can be written using
# writeSBML(doc, "nameOfOutputFile.xml")
