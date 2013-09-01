#' A show function for a _p_SBMLDocument object
#' 
#' Overrides generic 'show' method
#' 
#' @title Show document
#' @param object a _p_SBMLDocument object
#' @docType methods
#' @rdname show-methods-_p_SBMLDocument
#' @exportMethod show
#' @aliases show,_p_SBMLDocument,ANY-method
#' @aliases show,_p_SBMLDocument-method
#' @name show_document
setMethod("show", "_p_SBMLDocument",
          function(object) message("An object of class _p_SBMLDocument")
)


#' @rdname show-methods-_p_SBMLDocument
#' @aliases show,_p_Model,ANY-method
#' @aliases show,_p_Model-method
setMethod("show", "_p_Model",
          function(object)  message("An object of class _p_Model")
)

#' @rdname show-methods-_p_SBMLDocument
#' @aliases show,R_ListOf,ANY-method
#' @aliases show,R_ListOf-method
setMethod("show", "R_ListOf",
          function(object) message("An object of class ", class(object))
)

#' @rdname show-methods-_p_SBMLDocument
#' @aliases show,_p_Component,ANY-method
#' @aliases show,_p_Component-method
setMethod("show", "_p_Component",
          function(object) message("An object of class ", class(object))
)

#' @rdname show-methods-_p_SBMLDocument
#' @aliases show,_p_ASTNode,ANY-method
#' @aliases show,_p_ASTNode-method
setMethod("show", "_p_ASTNode",
          function(object) {
            message(paste("An object of class _p_ASTNode",
                          "\nFormula: ", formulaToString(object)))            
          }           
)
