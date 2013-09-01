#' Summary methods
#' 
#' S4 summary methods for _p_SBMLDocument, _p_model, _p_Component and R_List objects. 
#' 
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



#' @rdname summary-methods-_p_SBMLDocument
#' @exportMethod summary
#' @aliases summary,_p_Model,ANY-method
#' @aliases summary,_p_Model-method
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

#' @rdname summary-methods-_p_SBMLDocument
#' @exportMethod summary
#' @aliases summary,_p_Component,ANY-method
#' @aliases summary,_p_Component-method
setMethod("summary", "_p_Component",
          function(object, ...) {
            compStr = get_model_nodes()[match(class(object), get_component_classes())]
            tags = do.call(paste0(compStr, "_attributes"), list())
            get_component_summary(compStr, object, tags)
          }
)


#' @rdname summary-methods-_p_SBMLDocument
#' @exportMethod summary
#' @aliases summary,R_ListOf,ANY-method
#' @aliases summary,R_ListOf-method
setMethod("summary", "R_ListOf",
          function(object, ...) {
            compStr = get_model_nodes()[match(class(object), get_R_ListOf_classes())]
            tags = do.call(paste0(compStr, "_attributes"), list())
            get_R_ListOf_summary(compStr, object, tags)
          }
)



##This function isn't exported so doesn't need documentation
get_component_summary = function(compStr, obj, tags) {
  
  l = list()
  
  # get value of all attributes in the component object;
  # display with tags corresponding to SBML component attribute names
  funs = paste0(compStr, "_get", tags)
  for(i in 1:length(tags)) l[[tags[i]]] = do.call(funs[i], list(obj))
  
  return(l)
}


get_R_ListOf_summary = function(compStr, RList, tags) {
  
  l = list()
  
  # include a tag showing the number of elements in the _p_ListOf object
  l[[paste0("Num", compStr)]] = length(RList)
  
  # get the value of all attributes for all objects in the R list;
  # display with tags corresponding to SBML component attribute names
  funs = paste0(compStr, "_get",tags)  
  for(i in 1:length(tags)) l[[tags[i]]] = mapply(function(k) do.call(funs[i], list(k)), RList)
  
  return(l)  
}
