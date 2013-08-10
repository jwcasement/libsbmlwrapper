# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html

# load an SBML file
data(enzymaticreaction)

# create a _p_SBMLDocument object
doc = readSBMLFromString(enzymaticreaction)

latestLevel   = SBMLDocument_getDefaultLevel()
latestVersion = SBMLDocument_getDefaultVersion()

errors = SBMLErrorLog_getNumFailsWithSeverity(
  SBMLDocument_getErrorLog(doc), 
  enumToInteger("LIBSBML_SEV_ERROR", "_XMLErrorSeverity_t")
)

if (errors > 0) {
  cat("Encountered the following SBML error(s):\n")
  SBMLDocument_printErrors(doc)
  stop("Conversion skipped.  Please correct the problems above first.\n")
} else {
  olevel   = SBase_getLevel(doc)
  oversion = SBase_getVersion(doc)
  
  if (olevel < latestLevel || oversion < latestVersion) {
    cat("Attempting to convert model to SBML Level ",latestLevel," Version ",latestVersion,".\n")
    success = SBMLDocument_setLevelAndVersion(doc, latestLevel, latestVersion)
  } else {
    cat("Attempting to convert model to SBML Level 1 Version 2.\n")
    success = SBMLDocument_setLevelAndVersion(doc, 1, 2)
  }
  
  errors = SBMLErrorLog_getNumFailsWithSeverity(
    SBMLDocument_getErrorLog(doc), 
    enumToInteger("LIBSBML_SEV_ERROR", "_XMLErrorSeverity_t")
  )
  
  if (!success) {
    cat("Unable to perform conversion due to the following:\n")
    SBMLDocument_printErrors(doc)
    
    cat("Conversion skipped.  Either libSBML does not (yet) have\n")
    cat("ability to convert this model, or (automatic) conversion\n")
    cat("is not possible in this case.\n")
  } else if (errors > 0) {
    cat("Information may have been lost in conversion but a valid model ")
    cat("was produced by the conversion.\nThe following information ")
    cat("was provided:\n")
    SBMLDocument_printErrors(doc)
    writeSBML(doc, args[2])
  } else {       
    cat("Conversion completed.\n")
    # The converted SBML document can be written using
    # writeSBML(doc, "nameOfOutputFile.xml")
  }
}
