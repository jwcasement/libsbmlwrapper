# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html

# load an SBML file
data(ts_case00124)

# create a _p_SBMLDocument object
doc = readSBMLFromString(ts_case00124)

# now create a _p_Model object
mod = SBMLDocument_getModel(doc)

# get a _p_Reaction object from the model
r = Model_getReaction(mod, 0)

# no CV terms will be added if there is no metaid to reference,
# so set a metaId if not already set
if (SBase_isSetMetaId(r) == FALSE)
  SBase_setMetaId(r, "metaid_0000052")

# create CVTerm objects
cv1 = CVTerm("BIOLOGICAL_QUALIFIER")
CVTerm_setBiologicalQualifierType(cv1, "BQB_IS_DESCRIBED_BY")
CVTerm_addResource(cv1, "urn:miriam:obo.eco:ECO%3A0000183")

cv2 = CVTerm("BIOLOGICAL_QUALIFIER")
CVTerm_setBiologicalQualifierType(cv2, "BQB_IS")
CVTerm_addResource(cv2, "urn:miriam:kegg.reaction:R00756")
CVTerm_addResource(cv2, "urn:miriam:reactome:REACT_736")

#now add the CV terms cv1 and cv2 to the _p_Reaction object r
SBase_addCVTerm(r, cv1)
SBase_addCVTerm(r, cv2)

# The SBML document with CV terms added can be written using
# writeSBML(doc, "nameOfOutputFile.xml")
