# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html

# load an SBML file
data(ts_case00124)

# create a _p_SBMLDocument object
doc = readSBMLFromString(ts_case00124)

# now create a _p_Model object
mod = SBMLDocument_getModel(doc)

# define printStatus function
printStatus <- function(message,status) {
  enumStatus <- enumFromInteger(status, "_OperationReturnValues_t" )
  cat(message, switch(enumStatus, 
                      LIBSBML_OPERATION_SUCCESS = "succeeded", 
                      LIBSBML_INVALID_OBJECT = "invalid object", 
                      LIBSBML_OPERATION_FAILED = "operation failed", 
                      LIBSBML_UNEXPECTED_ATTRIBUTE = "unexpected attribute (missing metaid)", 
                      "unknown"), "\n")
}

# create ModelHistory and ModelCreator objects
h = ModelHistory()
c = ModelCreator()

#provide details of creator
ModelCreator_setFamilyName(c, "Keating")
ModelCreator_setGivenName(c, "Sarah")
ModelCreator_setEmail(c, "sbml-team@caltech.edu")
ModelCreator_setOrganisation(c, "University of Hertfordshire")

# add creator to ModelHistory object
status = ModelHistory_addCreator(h, c)
printStatus("Status for addCreator: ", status)

# provide created date
date = Date("1999-11-13T06:54:32")

#provide modified date
date2 = Date("2007-11-30T06:54:00-02:00")

# update ModelHistory object
status = ModelHistory_setCreatedDate(h, date)
printStatus("Set created date:      ", status)

status = ModelHistory_setModifiedDate(h, date2)
printStatus("Set modified date:     ", status)

# now update _p_Model object with model history
status =  SBase_setModelHistory(mod, h)
printStatus("Set model history:     ", status)

# The SBML document with model history added can be written using
# writeSBML(doc, "nameOfOutputFile.xml")
