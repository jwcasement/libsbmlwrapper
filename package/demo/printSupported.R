# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html

# define printSupported function
printSupported = function() {
  
  list = SBMLNamespaces_getSupportedNamespaces()
  
  cat("LibSBML: ",getLibSBMLDottedVersion()," supports: \n")
  
  for (i  in seq_len(SBMLNamespacesList_getSize(list))) {
    current = SBMLNamespacesList_get(list, i-1)
    cat("\tSBML Level ", SBMLNamespaces_getLevel(current),
        " Version: ", SBMLNamespaces_getVersion(current),"\n"
    )
  }
}

printSupported()