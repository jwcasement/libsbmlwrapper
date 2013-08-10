#' A union of SBML model component classes
#' 
#' @title Component classes 
#' @rdname set_class_union_Components
#' @docType class
#' @exportClass _p_Component
#' @name _p_Component-class
#' @aliases _p_Component-class
#' @note Used in some method signatures to avoid code repetition
#'
setClassUnion("_p_Component", get_component_classes())



#' A union of R_ListOf container classes 
#' 
#' @title R_ListOf classes
#' @rdname set_class_union_R_ListOf
#' @docType class
#' @exportClass R_ListOf
#' @name R_ListOf-class
#' @aliases R_ListOf-class
#' @note Used in some method signatures to avoid code repetition
#'
setClassUnion("R_ListOf", get_R_ListOf_classes())



#' A select function for a _p_Model object
#' 
#' Selects an SBML _p_ListOf container object and converts to an R_ListOf container object 
#' 
#' @title Selection of model component
#' @param x a _p_Model object
#' @param i a character string or number indicating the component list being selected
#' @docType methods
#' @rdname select-methods-_p_Model
#' @exportMethod [[
#' @aliases [[,_p_Model,ANY-method
#' @aliases [[,_p_Model,ANY,missing-method
#' @name select_from_model
#' @return an R_ListOf object containing SBML component objects
setMethod("[[", signature(x = "_p_Model", i = "ANY", j = "missing"),
          function(x, i) {            
            if(is.character(i)) {
              fun = paste0("Model_get", i)
            } else {
              fun = paste0("Model_get", get_ListOf_nodes()[i])
            }
            return(convert_p_ListOf_to_R_ListOf(do.call(fun, list(x))))
          }
)



#' A select function for a _p_Component object
#' 
#' Selects an attribute from an SBML component object 
#' 
#' @title Selection of component attribute
#' @param x a _p_Component object
#' @param i a character string indicating the attribute being selected
#' @docType methods
#' @rdname select-methods-_p_Component
#' @exportMethod [[
#' @aliases [[,_p_Component,ANY-method
#' @aliases [[,_p_Component,character,missing-method
#' @name select_from_component
#' @return a component attribute
setMethod("[[", signature(x = "_p_Component", i = "character", j = "missing"),
          function(x, i) {            
            compStr = get_model_nodes()[match(class(x), get_component_classes())]
            
            if(i == "Math") {
              # handle requests for 'Math' element
              if(compStr %in% has_math_element_nodes()) {
                return(get_math(compStr, x))                
              } else {
                messageStr = paste0("No math element for ", compStr, " object")
                stop(messageStr)                
              }
            }
            
            if(compStr %in% has_subcomponent_nodes()) {
              # handle requests for other elements within components
              return(do.call(paste0("select_from_", compStr), list(x, i)))              
            } else {
              # otherwise look for an attribute matching i
              return(get_attribute_from_component(compStr, x, i))              
            }
            
          }
)



#' A select function for an R_ListOf object
#' 
#' Selects a subset of an R_ListOf container object 
#' 
#' @title Select a subset of a list of SBML component objects
#' @param x an R_ListOf object
#' @param i a vector indicating the components in the list to be selected
#' @docType methods
#' @rdname select-methods-R_ListOf
#' @exportMethod [
#' @aliases [,R_ListOf,ANY-method
#' @aliases [,R_ListOf,numeric-method
#' @name select_from_R_ListOf
#' @return an R_ListOf object containing SBML component objects
setMethod("[", signature(x = "R_ListOf", i = "numeric"),
          function(x, i, ...) {
            listStr = get_model_num_nodes()[match(class(x), get_R_ListOf_classes())]
            get_filtered_list_from_R_ListOf(listStr, x, i)
          }
)



#' get_attribute_from_component
#' 
#' Returns a component attribute
#' 
#' @title Component attributes
#' @rdname get_attribute_from_component
#' @name get_attribute_from_component
#' @param compStr a string containing the name of an SBML component (singular) 
#' @param obj the component object from which the attribute value will be taken
#' @param attrStr a string containing the name of the attribute
#' @return the value of the attribute named in \code{attrStr} from the component named
#' in \code{compStr}
#'
get_attribute_from_component = function(compStr, obj, attrStr) {
  
  fun = paste0(compStr, "_get", attrStr)
  return(do.call(fun, list(obj)))  
}



#' convert_p_ListOf_to_R_ListOf
#' 
#' Converts a _p_ListOf object to an R_ListOf object
#' 
#' @title Change object class
#' @rdname convert_p_ListOf_to_R_ListOf
#' @name convert_p_ListOf_to_R_ListOf
#' @param obj the _p_ListOf object to be converted to an R_ListOf object
#' @return the libSBML _p_ListOf container as an R_ListOf object
#'
convert_p_ListOf_to_R_ListOf = function(obj) {
  
  pos = match(class(obj), get_p_ListOf_classes())
  listStr = get_model_num_nodes()[pos]
  size = ListOf_size(obj)
  
  # stop if _p_ListOf object is empty
  if(size == 0) {
    messageStr = paste0("ListOf", listStr, " container is empty")
    stop(messageStr)
  }
  
  # now get _p_ListOf as generic 'list'
  fun = paste0("ListOf", listStr, "_get")
  l = mapply(function(k) do.call(fun, list(obj,k)), 0:(size-1))
  
  # now change 'list' to R_ListOf and return 
  #cl = paste0("R_",get_model_list_of_nodes()[pos])
  cl = get_R_ListOf_classes()[pos]
  return(as(l,cl))  
} 



#' get_filtered_list_from_R_ListOf
#' 
#' Allows an R_ListOf object to be filtered 
#' 
#' @title Filter a list
#' @rdname get_filtered_list_from_R_ListOf
#' @name get_filtered_list_from_R_ListOf
#' @param listStr a string containing the name of an SBML component (plural)
#' @param RList the R_ListOf object to be filtered
#' @param index a vector specifying the elements of RList to be retained  
#' @return a filtered R_ListOf object containing
#'  only the elements at positions in the vector \code{index}
#'
get_filtered_list_from_R_ListOf = function(listStr, RList, index) {
  
  size = length(RList)
  
  # stop if list is empty
  if(size == 0) {
    messageStr = paste0('"R_ListOf', listStr, '"container is empty')
    stop (messageStr)
  }
  
  # ensure that range is valid
  if(any(index<1) || any(index>size)) {
    messageStr = paste0("Out of bounds: index must be in range 1:", size)
    stop (messageStr)
  }
  
  #now do filtering and return
  RList = as(RList, "list")
  RList = RList[index]
  cl = paste0("R_ListOf",listStr)
  return(as(RList, cl))  
}



#' select_from_UnitDefinition
#' 
#' Handles requests for "ListOfUnits" from a _p_UnitDefinition object 
#' 
#' @title Select _p_UnitDefinition sub-components
#' @rdname select_from_UnitDefinition
#' @name select_from_UnitDefinition
#' @param x a _p_UnitDefinition object
#' @param i a string which should be "ListOfUnits" or a UnitDefinition attribute
#' @return an R_ListOfUnits object containing _p_Unit objects, or a call to
#' \code{get_attribute_from_component}
#'
select_from_UnitDefinition = function(x, i) {
  
  if(i == "ListOfUnits") {    
    lu = UnitDefinition_getListOfUnits(x)
    
    size = ListOf_size(lu)
    
    # stop if _p_ListOfUnits object is empty
    if(size == 0) {
      messageStr = ("ListOfUnits container is empty")
      stop(messageStr)
    }
    
    # now get _p_ListOf as generic 'list' containing _p_Unit objects
    fun = "ListOfUnits_get"
    l = mapply(function(k) do.call(fun, list(lu,k)), 0:(size-1))
    
    # now change generic 'list' to R_ListOfUnits object and return 
    return(as(l,"R_ListOfUnits"))    
  }
  
  else {    
    # if ListOfUnits was not requested, look for an attribute matching i
    return(get_attribute_from_component("UnitDefinition", x, i))    
  }  
}



#' select_from_Constraint
#' 
#' Handles requests for "Message" from a _p_Constraint object 
#' 
#' @title Select from _p_Constraint
#' @rdname select_from_Constraint
#' @name select_from_Constraint
#' @param x a _p_Constraint object
#' @param i a string which should be "Message"
#' @return the Constraint message string
#' @note The constraint component has no attributes
#'
select_from_Constraint = function(x, i) {
  
  if(i == "Message") {
    if(Constraint_isSetMessage(x)) {
      return(Constraint_getMessageString(x))    
    } else {
      return("Message element not set for this Constraint object")
    }
    
  } else {
    messageStr = ("Constraint component has no attributes")
    stop(messageStr)
  }  
    
}



#' select_from_Reaction
#' 
#' Handles requests for sub-components of a _p_Reaction object 
#' 
#' @title Select _p_Reaction sub-components
#' @rdname select_from_Reaction
#' @name select_from_Reaction
#' @param x a _p_Reaction object
#' @param i a string which should be one of those listed in the Note below, or 
#' a Reaction attribute
#' @return an object of class R_ListOfSpeciesReferences, R_ListOfModifierSpeciesReferences, 
#' _p_KineticLaw or a call to \code{get_attribute_from_component}
#' @note Valid strings are:
#' 
#' "ListOfReactants", "ListOfProducts", "ListOfModifiers" 
#' which will return an R_ListOfSpeciesReferences object containing
#'  _p_SimpleSpeciesReference objects;
#'  
#'  "Product", "Reactant" which will return an R_ListOfSpeciesReferences object 
#'  containing _p_SpeciesReference objects;
#'  
#'  "Modifier" which will return an R_ListOfModifierSpeciesReferences object;
#'  
#'  "KineticLaw" which will return a _p_KineticLaw object.
#'  
#'  Other strings will be treated as attributes, resulting in a call 
#'  to \code{get_attribute_from_component}
#'
select_from_Reaction = function(x, i) {
  
  fun = paste0("Reaction_get", i)
  
  if(i %in% c("ListOfModifiers", "ListOfProducts", "ListOfReactants")) {
    
    # stop if container is empty
    temp = do.call(fun, list(x))
    size = ListOf_size(temp)
    if(size == 0) {
      messageStr = paste0(i, " container is empty")
      stop(messageStr)
    }
    # now get _p_ListOf as generic 'list'
    # the list will contain _p_SimpleSpeciesReference objects
    l = mapply(function(k) do.call("ListOfSpeciesReferences_get", list(temp,k)), 0:(size-1))
    #return as R_ListOf object containing _p_SimpleSpeciesReference objects
    return(as(l,"R_ListOfSpeciesReferences"))
    
  } else if(i %in% c("Modifier", "Product", "Reactant")) {
    
    #check that element exists in 'Reaction' component
    size = do.call(paste0("Reaction_getNum", i, "s"), list(x))
    if(size == 0) {
      messageStr = paste0("Reaction component has no ", i, "s")
      stop(messageStr)
    }
    
    if(i == "Modifier") {
      # create a generic 'list' containing _p_ModifierSpeciesReference objects
      l = mapply(function(k) do.call(fun, list(x, k)), 0:(size-1))
      #return as R_ListOf object containing _p_ModifierSpeciesReference objects
      return(as(l,"R_ListOfModifierSpeciesReferences"))
      
    } else {
      #i is "Product" or "Reactant"
      # create a generic 'list' containing _p_SpeciesReference objects
      l = mapply(function(k) do.call(fun, list(x, k)), 0:(size-1))
      #return as R_ListOf object containing _p_SpeciesReference objects
      return(as(l,"R_ListOfSpeciesReferences"))
      
    }
    
  } else if(i == "KineticLaw") {
    # check that KineticLaw exists in 'Reaction' component
    if(Reaction_isSetKineticLaw(x)) {
      # return a _p_Kineticlaw object
      return(do.call(fun, list(x)))
    } else {
      messageStr = ("KineticLaw has not been set for this Reaction object")
      stop(messageStr)
    }    
    
  } else {
    # if none of the above were requested, look for an attribute matching i
    return(get_attribute_from_component("Reaction", x, i))
    
  }  
}



#' select_from_KineticLaw
#' 
#' Handles requests for "KineticLaw" from a _p_Reaction object 
#' 
#' @title Select _p_KineticLaw sub-components
#' @rdname select_from_KineticLaw
#' @name select_from_KineticLaw
#' @param x a _p_KineticLaw object
#' @param i a string which should be "DerivedUnitDefinition", "ListOfLocalParameters", 
#' "ListOfParameters", "LocalParameter", "Parameter" or a KineticLaw attribute
#' @return an object of class R_ListOfLocalParameters, R_ListOfParameters,  
#' _p_UnitDefinition or a call to \code{get_attribute_from_component}
#'
select_from_KineticLaw = function(x, i) {
  
  fun = paste0("KineticLaw_get", i) 
  
  if(i %in% c("ListOfLocalParameters", "ListOfParameters")) {
    
    # stop if container is empty
    temp = do.call(fun, list(x))
    size = ListOf_size(temp)
    if(size == 0) {
      messageStr = paste0(i, " container is empty")
      stop(messageStr)
    }
    
    # now get _p_ListOf as generic 'list'
    l = mapply(function(k) do.call(paste0(i, "_get"), list(temp,k)), 0:(size-1))
    #return as R_ListOf object
    cl = paste0("R_", i)
    return(as(l, cl))
    
  } else if(i %in% c("LocalParameter", "Parameter")) {
    
    #check that element exists in 'KineticLaw' component
    size = do.call(paste0("KineticLaw_getNum", i, "s"), list(x))
    if(size == 0) {
      messageStr = paste0("KineticLaw component has no ", i, "s")
      stop(messageStr)
    }
    # create a generic 'list'
    l = mapply(function(k) do.call(fun, list(x, k)), 0:(size-1))
    #return as R_ListOf object containing _p_ModifierSpeciesReference objects
    cl = paste0("R_ListOf", i, "s")
    return(as(l, cl))  
    
  } else if(i == "DerivedUnitDefinition") {
    # return a _p_UnitDefinition object
    return(do.call(fun, list(x)))   
    
  } else {
    # if none of the above were requested, look for an attribute matching i
    return(get_attribute_from_component("KineticLaw", x, i))
    
  }
}



#' select_from_Event
#' 
#' Handles requests for sub-components from a _p_Event object 
#' 
#' @title Select _p_Event sub-components
#' @rdname select_from_Event
#' @name select_from_Event
#' @param x a _p_Event object
#' @param i a string which should be "Trigger", "Delay", "Priority",  
#' "ListOfEventAssignments", "EventAssignment"or an Event attribute
#' @return an object of class R_ListOfEventAssignments, _p_Trigger, 
#' _p_Delay, _p_Priority or a call to \code{get_attribute_from_component}
#'
select_from_Event = function(x, i) {
  
  fun = paste0("Event_get", i)
  
  if(i =="ListOfEventAssignments") {
    
    # stop if container is empty
    temp = do.call(fun, list(x))
    size = ListOf_size(temp)
    if(size == 0) {
      messageStr = paste0(i, " container is empty")
      stop(messageStr)
    }
    
    # now get _p_ListOf as generic 'list'
    l = mapply(function(k) do.call(paste0(i, "_get"), list(temp,k)), 0:(size-1))
    #return as R_ListOf object
    return(as(l, "R_ListOfEventAssignments"))
    
  } else if(i == "EventAssignment") {
    
    #check that element exists in 'Event' component
    size = do.call(paste0("Event_getNum", i, "s"), list(x))
    if(size == 0) {
      messageStr = paste0("Event component has no ", i, "s")
      stop(messageStr)
    }
    # create a generic 'list'
    l = mapply(function(k) do.call(fun, list(x, k)), 0:(size-1))
    #return as R_ListOf object containing _p_EventAssignment objects
    return(as(l, "R_ListOfEventAssignments"))    
    
  } else if (i %in% c("Trigger", "Delay", "Priority")) {
    
    # check that element exists in 'Event' component
    if(do.call(paste0("Event_isSet", i), list(x))) {      
      # return a _p_Trigger, _p_Delay or _p_Priority object
      return(do.call(fun, list(x)))
    } else {
      messageStr = paste0(i, " has not been set for this Event object")
      stop(messageStr)
    }    
    
  } else {
    # if none of the above were requested, look for an attribute matching i
    return(get_attribute_from_component("Event", x, i))
    
  }
}
