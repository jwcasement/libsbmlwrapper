#' Read an SBML file
#' 
#' Reads SBML file, sets defaults, and returns a _p_SBMLDocument object
#' 
#' @title Read an SBML file
#' @param filename a character string representing an SBML file 
#' @docType methods
#' @note \code{readSBML} is an alias for \code{readSBMLFromFile}.
#' @export
readSBML = function(filename) {
  
  doc = libSBML::readSBML(filename)
  
  level = SBase_getLevel(doc)
  vers = SBase_getVersion(doc)
  
  # get level and version of currently loaded document
  current_level = get("doc_level", pkg_globals)
  current_vers = get("doc_version", pkg_globals)
  
  # only generate defaults if level or version of document being loaded
  # are different to the existing document
  if((level != current_level) || (vers != current_vers)) {
    # set defaults according to document level and version
    get("defs", pkg_globals)$set_Defaults(level, vers)
    # update level and version variables in global
    assign("doc_level", level, pkg_globals)
    assign("doc_version", vers, pkg_globals)    
  }
  
  return(doc)
}

#' @rdname readSBML
#' @export
readSBMLFromFile = function(filename) {
  readSBML(filename)
}

#' @rdname readSBML
#' @param xml string containing an SBML file 
#' @export
readSBMLFromString = function(xml) {
  
  doc = libSBML::readSBMLFromString(xml)
  
  level = SBase_getLevel(doc)
  vers = SBase_getVersion(doc)
  
  # get level and version of currently loaded document
  current_level = get("doc_level", pkg_globals)
  current_vers = get("doc_version", pkg_globals)
  
  # only generate defaults if level or version of document being loaded
  # are different to the existing document
  if((level != current_level) || (vers != current_vers)) {
    # set defaults according to document level and version
    get("defs", pkg_globals)$set_Defaults(level, vers)
    # update level and version variables in global
    assign("doc_level", level, pkg_globals)
    assign("doc_version", vers, pkg_globals)    
  }
  
  return(doc)
}
