#' Read an SBML file
#' 
#' Reads SBML file, sets defaults, and returns a _p_SBMLDocument object
#' 
#' @title Read an SBML file
#' @param filename a character string representing an SBML file 
#' @docType methods
#' @rdname read_SBML
#' @export
readSBML = function(filename) {
  
  doc = libSBML::readSBML(filename)
  
  level = SBase_getLevel(doc)
  vers = SBase_getVersion(doc)
  
  # get level and version of currently loaded model
  current_level = get("model_level", pkg_globals)
  current_vers = get("model_version", pkg_globals)
  
  # only generate defaults if level or version of model being loaded
  # are different to the existing model
  if((level != current_level) || (vers != current_vers)) {
    # set defaults according to document level and version
    get("defs", pkg_globals)$set_Defaults(level, vers)
    # update level and version variables in global
    assign("model_level", level, pkg_globals)
    assign("model_version", vers, pkg_globals)    
  }
  
  return(doc)
}



#' Read an SBML document from an xml string
#' 
#' Reads SBML document, sets defaults, and returns a _p_SBMLDocument object
#' 
#' @title Read an SBML document from an xml string
#' @param xml string containing an SBML file 
#' @docType methods
#' @rdname read_SBML_from_string
#' @export
readSBMLFromString = function(xml) {
  
  doc = libSBML::readSBMLFromString(xml)
  
  level = SBase_getLevel(doc)
  vers = SBase_getVersion(doc)
  
  # get level and version of currently loaded model
  current_level = get("model_level", pkg_globals)
  current_vers = get("model_version", pkg_globals)
  
  # only generate defaults if level or version of model being loaded
  # are different to the existing model
  if((level != current_level) || (vers != current_vers)) {
    # set defaults according to document level and version
    get("defs", pkg_globals)$set_Defaults(level, vers)
    # update level and version variables in global
    assign("model_level", level, pkg_globals)
    assign("model_version", vers, pkg_globals)    
  }
  
  return(doc)
}
