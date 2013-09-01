## A function to return an informative string corresponding to 
## libSBML operation return value
## @param i an integer value returned by a libSBML function   
## @return a string corresponding to the libSBML return value \code{i}
get_error_code = function(i) {
  
  retVals = c(0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,
              -20,-21,-22,-23,-24,-25,-30,-31,-32,-33,-34)
  
  if(!(i %in% retVals))
    stop("Not a valid return value")
  
  indx = which(retVals==i)
  
  info = c("OPERATION_SUCCESS",
           "INDEX_EXCEEDS_SIZE",
           "UNEXPECTED_ATTRIBUTE",
           "OPERATION_FAILED",
           "INVALID_ATTRIBUTE_VALUE",
           "INVALID_OBJECT",
           "DUPLICATE_OBJECT_ID",
           "LEVEL_MISMATCH",
           "VERSION_MISMATCH",
           "INVALID_XML_OPERATION",
           "NAMESPACES_MISMATCH",
           "DUPLICATE_ANNOTATION_NS",
           "ANNOTATION_NAME_NOT_FOUND",
           "ANNOTATION_NS_NOT_FOUND",
           "PKG_VERSION_MISMATCH",
           "PKG_UNKNOWN",
           "PKG_UNKNOWN_VERSION",
           "PKG_DISABLED",
           "PKG_CONFLICTED_VERSION",
           "PKG_CONFLICT",
           "CONV_INVALID_TARGET_NAMESPACE",
           "CONV_PKG_CONVERSION_NOT_AVAILABLE",
           "CONV_INVALID_SRC_DOCUMENT",
           "CONV_CONVERSION_NOT_AVAILABLE",
           "CONV_PKG_CONSIDERED_UNKNOWN")
  
  return(info[indx])
}
