# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html

# load an SBML file
data(enzymaticreaction)

# create a _p_SBMLDocument object
doc = readSBMLFromString(enzymaticreaction)

# now create a _p_Model object
mod = SBMLDocument_getModel(doc)

# define printSBML function
printSBML = function(d, m) {
  
  level   = SBase_getLevel  (d)
  version = SBase_getVersion(d)
  
  cat(" (Level ",level,", version ",version,")\n")
  
  cat("         ")
  cat("  model id: ", ifelse(Model_isSetId(m), Model_getId(m) ,"(empty)"),"\n")
  
  cat( "functionDefinitions: ", Model_getNumFunctionDefinitions(m) ,"\n" )
  cat( "    unitDefinitions: ", Model_getNumUnitDefinitions    (m) ,"\n" )
  cat( "   compartmentTypes: ", Model_getNumCompartmentTypes   (m) ,"\n" )
  cat( "       speciesTypes: ", Model_getNumSpeciesTypes       (m) ,"\n" )
  cat( "       compartments: ", Model_getNumCompartments       (m) ,"\n" )
  cat( "            species: ", Model_getNumSpecies            (m) ,"\n" )
  cat( "         parameters: ", Model_getNumParameters         (m) ,"\n" )
  cat( " initialAssignments: ", Model_getNumInitialAssignments (m) ,"\n" )
  cat( "              rules: ", Model_getNumRules              (m) ,"\n" )
  cat( "        constraints: ", Model_getNumConstraints        (m) ,"\n" )
  cat( "          reactions: ", Model_getNumReactions          (m) ,"\n" )
  cat( "             events: ", Model_getNumEvents             (m) ,"\n" )  
}

# call printSBML
printSBML(doc, mod)
