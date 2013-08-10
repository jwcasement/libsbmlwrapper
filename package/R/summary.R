#' A summary function for a _p_SBMLDocument object
#' 
#' Returns a list containing high level information about the model
#' 
#' @title Document summary
#' @param object an SBML document
#' @docType methods
#' @rdname summary-methods-_p_SBMLDocument
#' @exportMethod summary
#' @aliases summary,_p_SBMLDocument,ANY-method
#' @aliases summary,_p_SBMLDocument-method
#' @name summary_document
setMethod("summary", "_p_SBMLDocument",
          function(object, ...) {            
            l = list()
            l$xmlns = XMLNamespaces_getURI(SBMLDocument_getNamespaces(object))
            l$Level = SBase_getLevel(object)
            l$Version = SBase_getVersion(object)
            l$NumErrors = SBMLDocument_getNumErrors(object)
            l$Errors = SBMLDocument_printErrors(object)
            return(l)           
          }
)



#' A summary function for a _p_Model object
#' 
#' Returns a list containing attributes of the model
#' 
#' @title Model summary
#' @param object an SBML model
#' @docType methods
#' @rdname summary-methods-_p_Model
#' @exportMethod summary
#' @aliases summary,_p_Model,ANY-method
#' @aliases summary,_p_Model-method
#' @name summary_model
setMethod("summary", "_p_Model", 
          function(object, ...) {
            nodes = get_model_num_nodes()[1:12]
            funs = paste0("Model_getNum", nodes)
            l = list()
            l$Id = Model_getId(object)
            l$Name = Model_getName(object)
            l$SubstanceUnits = Model_getSubstanceUnits(object)
            l$TimeUnits = Model_getTimeUnits(object)
            l$VolumeUnits = Model_getVolumeUnits(object)
            l$AreaUnits = Model_getAreaUnits(object)
            l$LengthUnits = Model_getLengthUnits(object)
            l$ExtentUnits = Model_getExtentUnits(object)
            l$Components = sapply(funs, do.call, list(object))
            names(l$Components) = nodes
            return(l)
          }
)



#' A summary function for a _p_Component object
#' 
#' Displays values of attributes of an SBML component object
#' 
#' @title Component summary
#' @param object an SBML component
#' @docType methods
#' @rdname summary-methods-_p_Component
#' @exportMethod summary
#' @aliases summary,_p_Component,ANY-method
#' @aliases summary,_p_Component-method
#' @name summary_component
setMethod("summary", "_p_Component",
          function(object, ...) {
            compStr = get_model_nodes()[match(class(object), get_component_classes())]
            tags = do.call(paste0(compStr, "_attributes"), list())
            get_component_summary(compStr, object, tags)
          }
)



#' A summary function for an R_ListOf object
#' 
#' Displays values of attributes of all SBML component objects in the R_ListOf object
#' 
#' @title R_ListOf summary
#' @param object an R_ListOf object
#' @docType methods
#' @rdname summary-methods-R_ListOf
#' @exportMethod summary
#' @aliases summary,R_ListOf,ANY-method
#' @aliases summary,R_ListOf-method
#' @name summary_RListOf
setMethod("summary", "R_ListOf",
          function(object, ...) {
            compStr = get_model_nodes()[match(class(object), get_R_ListOf_classes())]
            tags = do.call(paste0(compStr, "_attributes"), list())
            get_R_ListOf_summary(compStr, object, tags)
          }
)



#' A summary function for an SBML component object
#' 
#' Returns a list of attribute values, with tags corresponding
#' to component attribute names
#' 
#' @title Component summary
#' @rdname get_component_summary
#' @name get_component_summary
#' @param compStr a string containing the name of an SBML component (singular) 
#' @param obj the component object to be summarised
#' @param tags the names of the attributes of the component object \code{obj}
#' @return a list of attribute values
get_component_summary = function(compStr, obj, tags) {
  
  l = list()
  
  # get value of all attributes in the component object;
  # display with tags corresponding to SBML component attribute names
  funs = paste0(compStr, "_get", tags)
  for(i in 1:length(tags)) l[[tags[i]]] = do.call(funs[i], list(obj))
  
  return(l)
}



#' A summary function for an R_ListOf object
#' 
#' Returns a list of vectors containing attribute values for all elements in the 
#' R_ListOf object, with tags corresponding to component attribute names
#' 
#' @title R_ListOf object summary
#' @rdname get_R_ListOf_summary
#' @name get_R_ListOf_summary
#' @param compStr a string containing the name of an SBML component (singular) 
#' @param RList the R_ListOf object to be summarised
#' @param tags the names of the attributes of the component objects in \code{RList}
#' @return a list of vectors containing attribute values
get_R_ListOf_summary = function(compStr, RList, tags) {
  
  l = list()
  
  # include a tag showing the number of elements in the _p_ListOf object
  l[[paste0("Num",compStr)]] = length(RList)
  
  # get the value of all attributes for all objects in the R list;
  # display with tags corresponding to SBML component attribute names
  funs = paste0(compStr, "_get",tags)  
  for(i in 1:length(tags)) l[[tags[i]]] = mapply(function(k) do.call(funs[i], list(k)), RList)
  
  return(l)  
}