#' A generic for createFunctionDefinition
#' 
#' @docType methods
#' @rdname createFunctionDefinition-methods
#' @param obj a_p_Model object
#' @param i a vector of integers indicating objects to be copied or created
#' @exportMethod createFunctionDefinition
#' @note Where a new _p_* object is created, the SBML Level and Version of
#' the _p_Model object, (and any SBML package namespaces), are used to initialise
#' the attributes of the new _p_FunctionDefinition object to 'typical' defaults
setGeneric("createFunctionDefinition",
           function(obj, i) standardGeneric("createFunctionDefinition")
)

#' @rdname createFunctionDefinition-methods
#' @exportMethod createUnitDefinition
setGeneric("createUnitDefinition",
           function(obj, i) standardGeneric("createUnitDefinition")
)

#' @rdname createFunctionDefinition-methods
#' @exportMethod createCompartmentType
setGeneric("createCompartmentType",
           function(obj, i) standardGeneric("createCompartmentType")
)


#' @rdname createFunctionDefinition-methods
#' @exportMethod createSpeciesType
setGeneric("createSpeciesType",
           function(obj, i) standardGeneric("createSpeciesType")
)

#' @rdname createFunctionDefinition-methods
#' @exportMethod createCompartment
setGeneric("createCompartment",
           function(obj, i) standardGeneric("createCompartment")
)

#' @rdname createFunctionDefinition-methods
#' @exportMethod createSpecies
setGeneric("createSpecies",
           function(obj, i) standardGeneric("createSpecies")
)

#' @rdname createFunctionDefinition-methods
#' @exportMethod createParameter
setGeneric("createParameter",
           function(obj, i) standardGeneric("createParameter")
)

#' @rdname createFunctionDefinition-methods
#' @exportMethod createInitialAssignment
setGeneric("createInitialAssignment",
           function(obj, i) standardGeneric("createInitialAssignment")
)

#' @rdname createFunctionDefinition-methods
#' @exportMethod createConstraint
setGeneric("createConstraint",
           function(obj, i) standardGeneric("createConstraint")
)

#' @rdname createFunctionDefinition-methods
#' @exportMethod createReaction
setGeneric("createReaction",
           function(obj, i) standardGeneric("createReaction")
)

#' @rdname createFunctionDefinition-methods
#' @exportMethod createEvent
setGeneric("createEvent",
           function(obj, i) standardGeneric("createEvent")
)

#################################################################
#Methods for above generics
#################################################################

#' @rdname createFunctionDefinition-methods
#' @aliases createFunctionDefinition,_p_Model,ANY-method
#' @aliases createFunctionDefinition,_p_Model-method 
#' @name createFunctionDefinition
setMethod("createFunctionDefinition", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("FunctionDefinition", obj, i)
)


#' @rdname createFunctionDefinition-methods
#' @aliases createUnitDefinition,_p_Model,ANY-method
#' @aliases createUnitDefinition,_p_Model-method
setMethod("createUnitDefinition", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("UnitDefinition", obj, i)
)

#' @rdname createFunctionDefinition-methods
#' @aliases createCompartmentType,_p_Model,ANY-method
#' @aliases createCompartmentType,_p_Model-method
setMethod("createCompartmentType", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("CompartmentType", obj, i)
)

#' @rdname createFunctionDefinition-methods
#' @aliases createSpeciesType,_p_Model,ANY-method
#' @aliases createSpeciesType,_p_Model-method
setMethod("createSpeciesType", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("SpeciesType", obj, i)
)
#' @rdname createFunctionDefinition-methods
#' @aliases createCompartment,_p_Model,ANY-method
#' @aliases createCompartment,_p_Model-method
setMethod("createCompartment", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("Compartment", obj, i)
)

#' @rdname createFunctionDefinition-methods
#' @aliases createSpecies,_p_Model,ANY-method
#' @aliases createSpecies,_p_Model-method
setMethod("createSpecies", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("Species", obj, i)
)

#' @rdname createFunctionDefinition-methods
#' @aliases createParameter,_p_Model,ANY-method
#' @aliases createParameter,_p_Model-method
setMethod("createParameter", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("Parameter", obj, i)
)

#' @rdname createFunctionDefinition-methods
#' @aliases createInitialAssignment,_p_Model,ANY-method
#' @aliases createInitialAssignment,_p_Model-method
setMethod("createInitialAssignment", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("InitialAssignment", obj, i)
)

#' @rdname createFunctionDefinition-methods
#' @aliases createConstraint,_p_Model,ANY-method
#' @aliases createConstraint,_p_Model-method
setMethod("createConstraint", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("Constraint", obj, i)
)

#' @rdname createFunctionDefinition-methods
#' @aliases createReaction,_p_Model,ANY-method
#' @aliases createReaction,_p_Model-method
setMethod("createReaction", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("Reaction", obj, i)
)

#' @rdname createFunctionDefinition-methods
#' @aliases createEvent,_p_Model,ANY-method
#' @aliases createEvent,_p_Model-method
setMethod("createEvent", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("Event", obj, i)
)



###########################
#Non exported functions


## Can add a new object (initialised to typical defaults) or a copy of an existing
## object within the model
## @param compStr a string indicating the SBML component to be created 
## @param obj the model object to which the component will be added
## @param index a vector of integers indicating the object to be copied
## @note if \code{index} is missing or equal to zero, a new object (initialised to
## typical defaults) will be added to the model 
add_to_model = function(compStr, obj, index) {
  
  if(missing(index) || index==0) {
    crStr = get_create_component_nodes()[match(compStr, get_model_nodes())]
    add_new_object(crStr, obj)
  } else {
    add_copy_object(compStr, obj, index)
  }
}


## @name add_new_object
## @param crStr a string indicating the SBML component to be created
## @param obj the model object to which the component will be added
add_new_object = function(crStr, obj) {
  fun = paste0("Model_", crStr)
  do.call(fun, list(obj))  
}



## A function to add a copy of an SBML component object to a model
## @param compStr a string indicating the SBML component to be copied
## @param obj the model object to which the component will be added
## @param index a vector of integers indicating the positions of the
## objects to be copied
add_copy_object = function(compStr, obj, index) {
  # get list of copies of object(s) at positions given in 'index'
  fun = paste0("Model_get", compStr)
  cp = lapply(index, function(k) do.call(compStr, list(do.call(fun, list(obj,k-1)))))
  # get new values for Id attribute
  fun = paste0(compStr, "_getId")
  newIds = lapply(cp, function(k) paste0("copyOf_", do.call(fun, list(k))))
  # apply new Ids to objects
  fun = paste0(compStr, "_setId")
  mapply(function(k,j) do.call(fun, list(k,j)), cp, newIds)
  # add copies to model
  fun = paste0("Model_add", compStr)
  codes = lapply(cp, function(k) do.call(fun, list(obj, k)))
  # display any error codes
  errors = codes[codes != 0]
  l = lapply(errors, function(k)
    warning("libSBML operation return value ", k, " ", get_error_code(k)))  
}
