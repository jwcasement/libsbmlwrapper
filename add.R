#' A generic for createFunctionDefinition
#' 
#' @export
#' @docType methods
#' @rdname createFunctionDefinition-methods
#' @param obj a_p_Model object
#' @param i a vector of integers indicating objects to be copied or created
setGeneric("createFunctionDefinition",
           function(obj, i)
             standardGeneric("createFunctionDefinition")
)



#' A generic for createUnitDefinition
#' 
#' @export
#' @docType methods
#' @rdname createUnitDefinition-methods
#' @param obj a_p_Model object
#' @param i a vector of integers indicating objects to be copied or created
setGeneric("createUnitDefinition",
           function(obj, i)
             standardGeneric("createUnitDefinition")
)



#' A generic for createCompartmentType
#' 
#' @export
#' @docType methods
#' @rdname createCompartmentType-methods
#' @param obj a_p_Model object
#' @param i a vector of integers indicating objects to be copied or created
setGeneric("createCompartmentType",
           function(obj, i)
             standardGeneric("createCompartmentType")
)



#' A generic for createSpeciesType
#' 
#' @export
#' @docType methods
#' @rdname createSpeciesType-methods
#' @param obj a_p_Model object
#' @param i a vector of integers indicating objects to be copied or created
setGeneric("createSpeciesType",
           function(obj, i)
             standardGeneric("createSpeciesType")
)



#' A generic for createCompartment
#' 
#' @export
#' @docType methods
#' @rdname createCompartment-methods
#' @param obj a_p_Model object
#' @param i a vector of integers indicating objects to be copied or created
setGeneric("createCompartment",
           function(obj, i)
             standardGeneric("createCompartment")
)



#' A generic for createSpecies
#' 
#' @export
#' @docType methods
#' @rdname createSpecies-methods
#' @param obj a_p_Model object
#' @param i a vector of integers indicating objects to be copied or created
setGeneric("createSpecies",
           function(obj, i)
             standardGeneric("createSpecies")
)



#' A generic for createParameter
#' 
#' @export
#' @docType methods
#' @rdname createParameter-methods
#' @param obj a_p_Model object
#' @param i a vector of integers indicating objects to be copied or created
setGeneric("createParameter",
           function(obj, i)
             standardGeneric("createParameter")
)



#' A generic for createInitialAssignment
#' 
#' @export
#' @docType methods
#' @rdname createInitialAssignment-methods
#' @param obj a_p_Model object
#' @param i a vector of integers indicating objects to be copied or created
setGeneric("createInitialAssignment",
           function(obj, i)
             standardGeneric("createInitialAssignment")
)



#' A generic for createConstraint
#' 
#' @export
#' @docType methods
#' @rdname createConstraint-methods
#' @param obj a_p_Model object
#' @param i a vector of integers indicating objects to be copied or created
setGeneric("createConstraint",
           function(obj, i)
             standardGeneric("createConstraint")
)



#' A generic for createReaction
#' 
#' @export
#' @docType methods
#' @rdname createReaction-methods
#' @param obj a_p_Model object
#' @param i a vector of integers indicating objects to be copied or created
setGeneric("createReaction",
           function(obj, i)
             standardGeneric("createReaction")
)



#' A generic for createEvent
#' 
#' @export
#' @docType methods
#' @rdname createEvent-methods
#' @param obj a_p_Model object
#' @param i a vector of integers indicating objects to be copied or created
setGeneric("createEvent",
           function(obj, i)
             standardGeneric("createEvent")
)



#' Function for adding a _p_FunctionDefinition object to an SBML model
#' 
#' Creates or copies a _p_FunctionDefinition object and adds it to the _p_Model object
#' 
#' @title Add _p_FunctionDefinition object to a model
#' @param object a _p_Model object
#' @param i a vector of integers indicating objects to be copied or created
#' @docType methods
#' @rdname createFunctionDefinition-methods
#' @export
#' @aliases createFunctionDefinition,_p_Model,ANY-method
#' @aliases createFunctionDefinition,_p_Model-method 
#' @name createFunctionDefinition
#' @note Where a new _p_FunctionDefinition object is created, the SBML Level and Version of
#' the _p_Model object, (and any SBML package namespaces), are used to initialise
#' the attributes of the new _p_FunctionDefinition object to 'typical' defaults
setMethod("createFunctionDefinition", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("FunctionDefinition", obj, i)
)



#' Function for adding a _p_UnitDefinition object to an SBML model
#' 
#' Creates or copies a _p_UnitDefinition object and adds it to the _p_Model object
#' 
#' @title Add _p_UnitDefinition object to a model
#' @param object a _p_Model object
#' @param i a vector of integers indicating objects to be copied or created
#' @docType methods
#' @rdname createUnitDefinition-methods
#' @export 
#' @aliases createUnitDefinition,_p_Model,ANY-method
#' @aliases createUnitDefinition,_p_Model-method
#' @name createUnitDefinition
#' @note Where a new _p_UnitDefinition object is created, the SBML Level and Version of
#' the _p_Model object, (and any SBML package namespaces), are used to initialise
#' the attributes of the new _p_UnitDefinition object to 'typical' defaults
setMethod("createUnitDefinition", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("UnitDefinition", obj, i)
)



#' Function for adding a _p_CompartmentType object to an SBML model
#' 
#' Creates or copies a _p_CompartmentType object and adds it to the _p_Model object
#' 
#' @title Add _p_CompartmentType object to a model
#' @param object a _p_Model object
#' @param i a vector of integers indicating objects to be copied or created
#' @docType methods
#' @rdname createCompartmentType-methods
#' @export 
#' @aliases createCompartmentType,_p_Model,ANY-method
#' @aliases createCompartmentType,_p_Model-method
#' @name createCompartmentType
#' @note Where a new _p_CompartmentType object is created, the SBML Level and Version of
#' the _p_Model object, (and any SBML package namespaces), are used to initialise
#' the attributes of the new _p_CompartmentType object to 'typical' defaults
setMethod("createCompartmentType", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("CompartmentType", obj, i)
)



#' Function for adding a _p_SpeciesType object to an SBML model
#' 
#' Creates or copies a _p_SpeciesType object and adds it to the _p_Model object
#' 
#' @title Add _p_SpeciesType object to a model
#' @param object a _p_Model object
#' @param i a vector of integers indicating objects to be copied or created
#' @docType methods
#' @rdname createSpeciesType-methods
#' @export 
#' @aliases createSpeciesType,_p_Model,ANY-method
#' @aliases createSpeciesType,_p_Model-method
#' @name createSpeciesType
#' @note Where a new _p_SpeciesType object is created, the SBML Level and Version of
#' the _p_Model object, (and any SBML package namespaces), are used to initialise
#' the attributes of the new _p_SpeciesType object to 'typical' defaults
setMethod("createSpeciesType", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("SpeciesType", obj, i)
)



#' Function for adding a _p_Compartment object to an SBML model
#' 
#' Creates or copies a _p_Compartment object and adds it to the _p_Model object
#' 
#' @title Add _p_Compartment object to a model
#' @param object a _p_Model object
#' @param i a vector of integers indicating objects to be copied or created
#' @docType methods
#' @rdname createCompartment-methods
#' @export 
#' @aliases createCompartment,_p_Model,ANY-method
#' @aliases createCompartment,_p_Model-method
#' @name createCompartment
#' @note Where a new _p_Compartment object is created, the SBML Level and Version of
#' the _p_Model object, (and any SBML package namespaces), are used to initialise
#' the attributes of the new _p_Compartment object to 'typical' defaults
setMethod("createCompartment", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("Compartment", obj, i)
)



#' Function for adding a _p_Species object to an SBML model
#' 
#' Creates or copies a _p_Species object and adds it to the _p_Model object
#' 
#' @title Add _p_Species object to a model
#' @param object a _p_Model object
#' @param i a vector of integers indicating objects to be copied or created
#' @docType methods
#' @rdname createSpecies-methods
#' @export 
#' @aliases createSpecies,_p_Model,ANY-method
#' @aliases createSpecies,_p_Model-method
#' @name createSpecies
#' @note Where a new _p_Species object is created, the SBML Level and Version of
#' the _p_Model object, (and any SBML package namespaces), are used to initialise
#' the attributes of the new _p_Species object to 'typical' defaults
setMethod("createSpecies", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("Species", obj, i)
)



#' Function for adding a _p_Parameter object to an SBML model
#' 
#' Creates or copies a _p_Parameter object and adds it to the _p_Model object
#' 
#' @title Add _p_Parameter object to a model
#' @param object a _p_Model object
#' @param i a vector of integers indicating objects to be copied or created
#' @docType methods
#' @rdname createParameter-methods
#' @export
#' @aliases createParameter,_p_Model,ANY-method
#' @aliases createParameter,_p_Model-method
#' @name createParameter
#' @note Where a new _p_Parameter object is created, the SBML Level and Version of
#' the _p_Model object, (and any SBML package namespaces), are used to initialise
#' the attributes of the new _p_Parameter object to 'typical' defaults
setMethod("createParameter", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("Parameter", obj, i)
)



#' Function for adding a _p_InitialAssignment object to an SBML model
#' 
#' Creates or copies a _p_InitialAssignment object and adds it to the _p_Model object
#' 
#' @title Add _p_InitialAssignment object to a model
#' @param object a _p_Model object
#' @param i a vector of integers indicating objects to be copied or created
#' @docType methods
#' @rdname createInitialAssignment-methods
#' @export 
#' @aliases createInitialAssignment,_p_Model,ANY-method
#' @aliases createInitialAssignment,_p_Model-method
#' @name createInitialAssignment
#' @note Where a new _p_InitialAssignment object is created, the SBML Level and Version of
#' the _p_Model object, (and any SBML package namespaces), are used to initialise
#' the attributes of the new _p_InitialAssignment object to 'typical' defaults
setMethod("createInitialAssignment", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("InitialAssignment", obj, i)
)



#' Function for adding a _p_Constraint object to an SBML model
#' 
#' Creates or copies a _p_Constraint object and adds it to the _p_Model object
#' 
#' @title Add _p_Constraint object to a model
#' @param object a _p_Model object
#' @param i a vector of integers indicating objects to be copied or created
#' @docType methods
#' @rdname createConstraint-methods
#' @export 
#' @aliases createConstraint,_p_Model,ANY-method
#' @aliases createConstraint,_p_Model-method
#' @name createConstraint
#' @note Where a new _p_Constraint object is created, the SBML Level and Version of
#' the _p_Model object, (and any SBML package namespaces), are used to initialise
#' the attributes of the new _p_Constraint object to 'typical' defaults
setMethod("createConstraint", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("Constraint", obj, i)
)



#' Function for adding a _p_Reaction object to an SBML model
#' 
#' Creates or copies a _p_Reaction object and adds it to the _p_Model object
#' 
#' @title Add _p_Reaction object to a model
#' @param object a _p_Model object
#' @param i a vector of integers indicating objects to be copied or created
#' @docType methods
#' @rdname createReaction-methods
#' @export 
#' @aliases createReaction,_p_Model,ANY-method
#' @aliases createReaction,_p_Model-method
#' @name createReaction
#' @note Where a new _p_Reaction object is created, the SBML Level and Version of
#' the _p_Model object, (and any SBML package namespaces), are used to initialise
#' the attributes of the new _p_Reaction object to 'typical' defaults
setMethod("createReaction", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("Reaction", obj, i)
)



#' Function for adding a _p_Event object to an SBML model
#' 
#' Creates or copies a _p_Event object and adds it to the _p_Model object
#' 
#' @title Add _p_Event object to a model
#' @param object a _p_Model object
#' @param i a vector of integers indicating objects to be copied or created
#' @docType methods
#' @rdname createEvent-methods
#' @export 
#' @aliases createEvent,_p_Model,ANY-method
#' @aliases createEvent,_p_Model-method
#' @name createEvent
#' @note Where a new _p_Event object is created, the SBML Level and Version of
#' the _p_Model object, (and any SBML package namespaces), are used to initialise
#' the attributes of the new _p_Event object to 'typical' defaults
setMethod("createEvent", signature(obj = "_p_Model", i = "ANY"),
          function(obj, i) add_to_model("Event", obj, i)
)



#' A function to add an SBML component object to a model
#' 
#' Can add a new object (initialised to typical defaults) or a copy of an existing
#' object within the model
#' 
#' @title Add to a model
#' @rdname add_to_model
#' @name add_to_model
#' @param compStr a string indicating the SBML component to be created 
#' @param obj the model object to which the component will be added
#' @param index a vector of integers indicating the object to be copied
#' @note if \code{index} is missing or equal to zero, a new object (initialised to
#' typical defaults) will be added to the model 
add_to_model = function(compStr, obj, index) {
  
  if(missing(index) || index==0) {
    crStr = get_create_component_nodes()[match(compStr, get_model_nodes())]
    add_new_object(crStr, obj)
  } else {
    add_copy_object(compStr, obj, index)
  }
}



#' A function to add a new SBML component object to a model
#' 
#' The new object will be initialised to typical defaults
#' 
#' @title Add a new object to a model
#' @rdname add_new_object
#' @name add_new_object
#' @param crStr a string indicating the SBML component to be created
#' @param obj the model object to which the component will be added
add_new_object = function(crStr, obj) {
  fun = paste0("Model_", crStr)
  do.call(fun, list(obj))  
}



#' A function to add a copy of an SBML component object to a model
#' 
#' @title Add a copy of an object to a model
#' @rdname add_copy_object
#' @name add_copy_object
#' @param compStr a string indicating the SBML component to be copied
#' @param obj the model object to which the component will be added
#' @param index a vector of integers indicating the positions of the
#' objects to be copied
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