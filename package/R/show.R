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
          function(object) {
            message("An object of class _p_SBMLDocument")
          }
)



#' A show function for a _p_Model object
#' 
#' Overrides generic 'show' method
#' 
#' @title Show model
#' @param object a _p_Model object
#' @docType methods
#' @rdname show-methods-_p_Model
#' @exportMethod show
#' @aliases show,_p_Model,ANY-method
#' @aliases show,_p_Model-method
#' @name show_model
setMethod("show", "_p_Model",
          function(object) {
            message("An object of class _p_Model")
          }
)



#' A show function for an R_ListOf object
#' 
#' Overrides generic 'show' method
#' 
#' @title Show R_ListOf object
#' @param object an R_ListOf object
#' @docType methods
#' @rdname show-methods-R_ListOf
#' @exportMethod show
#' @aliases show,R_ListOf,ANY-method
#' @aliases show,R_ListOf-method
#' @name show_RListOf
setMethod("show", "R_ListOf",
          function(object) message("An object of class ", class(object))
)



#' A show function for an _p_Component object
#' 
#' Overrides generic 'show' method
#' 
#' @title Show _p_Component object
#' @param object a _p_Component object
#' @docType methods
#' @rdname show-methods-_p_Component
#' @exportMethod show
#' @aliases show,_p_Component,ANY-method
#' @aliases show,_p_Component-method
#' @name show_component
setMethod("show", "_p_Component",
          function(object) message("An object of class ", class(object))
)



#' A show function for an _p_ASTNode object
#' 
#' Overrides generic 'show' method for a _p_ASTNode object
#' and shows the math as a string
#' 
#' Note that _p_ASTNode does not belong to the virtual superclass _p_Component
#' 
#' @title Show _p_ASTNode object
#' @param object a _p_ASTNode object
#' @docType methods
#' @rdname show-methods-_p_ASTNode
#' @exportMethod show
#' @aliases show,_p_ASTNode,ANY-method
#' @aliases show,_p_ASTNode-method
#' @name show_ASTNode
setMethod("show", "_p_ASTNode",
          function(object) {
            message(paste("An object of class _p_ASTNode",
                          "\nFormula: ", formulaToString(object)))            
          }           
)
