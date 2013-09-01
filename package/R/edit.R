#' @rdname select-methods-_p_Model
#' @aliases [[<-,_p_Component,ANY-method
#' @aliases [[<-,_p_Component,character,missing-method
setMethod("[[<-", signature(x = "_p_Component", i = "character", j = "missing", value = "ANY"),
          function(x, i, ..., value) {
            compStr = get_model_nodes()[match(class(x), get_component_classes())]            
            return(edit_attribute(compStr, x, i, value))
          }
)


#########################################################################
##Edit attributes
## @param compStr a string containing the name of an SBML component (singular) 
## @param obj the component object to be edited
## @param attrStr a string containing the name of the attribute to be edited
## @param newAttr the new value of the attribute in \code{attrStr} 
## @return the modified component object \code{obj}
##############################################################


edit_attribute = function(compStr, obj, attrStr, newAttr) {

  if(is.null(newAttr)) {
    newAttr = get_default_attribute(compStr, attrStr)   
  }
  
  fun = paste0(compStr, "_set", attrStr)  
  code = do.call(fun, list(obj, newAttr))
  
  if(code != 0) {
    warning(paste("libSBML Operation Return Value", code, get_error_code(code)))
  }
  
  return(obj)  
}



## @return the typical default value for the attribute in \code{attrStr}
## @note g is a global list returned by \code{set_and_get_defaults()} 
get_default_attribute = function(compStr, attrStr) {
  return(get("defs", pkg_globals)$get_Defaults(compStr, attrStr))
}

