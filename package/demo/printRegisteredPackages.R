# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html

#define printRegisteredPackages function
printRegisteredPackages = function() {
  
  cat ("This version of LibSBML ",getLibSBMLDottedVersion()," includes \n")
  
  for (i in seq_len(SBMLExtensionRegistry_getNumRegisteredPackages())) {
    cat("\t",SBMLExtensionRegistry_getRegisteredPackageName(i-1),"\n")      
  }
  
}

# output
printRegisteredPackages()
