#' get_math_string_FunctionDefinition
#' 
#' Get an easily readable string describing math within the FunctionDefinition component
#' 
#' @title FunctionDefinition math
#' @rdname get_math_string_FunctionDefinition
#' @name get_math_string_FunctionDefinition
#' @param fd a _p_FunctionDefinition object
#' @return a string describing the FunctionDefinition math 
#'
get_math_string_FunctionDefinition = function(fd) {
  if (FunctionDefinition_isSetMath(fd)) {
    
    # start a string to store the function definition math 
    mathStr = paste0("FunctionDefinition:  ", FunctionDefinition_getId(fd), "(")
    
    math = FunctionDefinition_getMath(fd)
    
    # add function arguments to string
    if (ASTNode_getNumChildren(math) > 1) {
      mathStr = paste0(mathStr, ASTNode_getName( ASTNode_getLeftChild(math)))    
      
      for (i in seq_len(ASTNode_getNumChildren(math) - 1)) {
        mathStr = paste0(mathStr, ", ", ASTNode_getName( ASTNode_getChild(math, i)))
      }
    }
    
    mathStr = paste0(mathStr, ") := ")
    
    # add function body to string
    if (ASTNode_getNumChildren(math) == 0) {
      mathStr = paste0(mathStr, "(no body defined)")      
    } else {
      math    = ASTNode_getChild(math, ASTNode_getNumChildren(math) - 1)
      formula = formulaToString(math)
      mathStr = paste0(mathStr, formula)      
    }
    return(mathStr)
    
  } else {
    return("Math element not set for this FunctionDefinition object")    
  }
}



#' get_math_string_InitialAssignment
#' 
#' Get an easily readable string describing math within the InitialAssignment component
#' 
#' @title InitialAssignment math
#' @rdname get_math_string_InitialAssignment
#' @name get_math_string_InitialAssignment
#' @param ia a _p_InitialAssignment object
#' @return a string describing the InitialAssignment math 
#'
get_math_string_InitialAssignment = function(ia) {
  if(InitialAssignment_isSetMath(ia)){
    symbol = InitialAssignment_getSymbol(ia)
    formula = formulaToString(InitialAssignment_getMath(ia))
    return(paste0("InitialAssignment: ", symbol, " = ", formula))
  } else {
    return("Math element not set for this InitialAssignment object")    
  }
}



#' get_math_string_Rule
#' 
#' Get an easily readable string describing math within the Rule component
#' 
#' @title Rule math
#' @rdname get_math_string_Rule
#' @name get_math_string_Rule
#' @param r a _p_Rule object
#' @return a string describing the Rule math 
#'
get_math_string_Rule = function(r) {
  if (Rule_isSetMath(r)) {
    formula = formulaToString( Rule_getMath(r) )
    return(paste0("Rule formula: ", formula))    
  } else {
    return("Math element not set for this Rule object")    
  }
}



#' get_math_string_Constraint
#' 
#' Get an easily readable string describing math within the Constraint component
#' 
#' @title Constraint math
#' @rdname get_math_string_Constraint
#' @name get_math_string_Constraint
#' @param con a _p_Constraint object
#' @return a string describing the Constraint math 
#'
get_math_string_Constraint = function(con) {
  if(Constraint_isSetMath(con)){
    formula = formulaToString(Constraint_getMath(con))
    return(paste0("Constraint: ", formula))
  } else {
    return("Math element not set for this Constraint object")    
  }
  
}



#' get_math_string_KineticLaw
#' 
#' Get an easily readable string describing math within the KineticLaw component
#' 
#' @title KineticLaw math
#' @rdname get_math_string_KineticLaw
#' @name get_math_string_KineticLaw
#' @param kl a _p_KineticLaw object
#' @return a string describing the KineticLaw math
#' @note  KineticLaw exists within the Reaction component 
#'
get_math_string_KineticLaw = function(kl) {    
    if (KineticLaw_isSetMath(kl)) {
      formula = formulaToString(KineticLaw_getMath(kl))
      return(paste0("KineticLaw formula: ", formula)) 
    } else {
      return("Math element not set for this KineticLaw object")      
    }
}



#' get_math_string_Trigger
#' 
#' Get an easily readable string describing math within the Trigger component
#' 
#' @title Trigger math
#' @rdname get_math_string_Trigger
#' @name get_math_string_Trigger
#' @param tr a _p_Trigger object
#' @return a string describing the Trigger math
#' @note  Trigger exists within the Event component 
#'
get_math_string_Trigger = function(tr) {  
  if (Trigger_isSetMath(tr)) {
    formula = formulaToString(Trigger_getMath(tr))
    return(paste0("Trigger formula: ", formula)) 
  } else {
    return("Math element not set for this Trigger object")    
  }
}



#' get_math_string_Priority
#' 
#' Get an easily readable string describing math within the Priority component
#' 
#' @title Priority math
#' @rdname get_math_string_Priority
#' @name get_math_string_Priority
#' @param p a _p_Priority object
#' @return a string describing the Priority math
#' @note  Priority exists within the Event component 
#'
get_math_string_Priority = function(p) {  
  if (Priority_isSetMath(p)) {
    formula = formulaToString(Priority_getMath(p))
    return(paste0("Priority formula: ", formula)) 
  } else {
    return("Math element not set for this Priority object")    
  }
}



#' get_math_string_Delay
#' 
#' Get an easily readable string describing math within the Delay component
#' 
#' @title Delay math
#' @rdname get_math_string_Delay
#' @name get_math_string_Delay
#' @param del a _p_Delay object
#' @return a string describing the Delay math
#' @note  Delay exists within the Event component 
#'
get_math_string_Delay = function(del) {  
  if (Delay_isSetMath(del)) {
    formula = formulaToString(Delay_getMath(del))
    return(paste0("Delay formula: ", formula)) 
  } else {
    return("Math element not set for this Delay object")    
  }
}



#' get_math_string_EventAssignment
#' 
#' Get an easily readable string describing math within the EventAssignment element
#' 
#' @title EventAssignment math
#' @rdname get_math_string_EventAssignment
#' @name get_math_string_EventAssignment
#' @param ea a _p_EventAssignment object
#' @return a string describing the EventAssignment math
#' @note  EventAssignment exists within the Event component 
#'
get_math_string_EventAssignment = function(ea) {  
  if (EventAssignment_isSetMath(ea)) {
    return(EventAssignment_getMath(ea))        
  } else {
    stop("Math element not set for this EventAssignment object")    
  }
}



#' get_math
#' 
#' Get the math element of a component as a _p_ASTNode object
#' 
#' @title get_math
#' @rdname get_math
#' @name get_math
#' @param compStr a string containing the name of an SBML component (singular)
#' @param obj the component object containing the math element
#' @return a _p_ASTNode object 
#'
get_math = function(compStr,obj) {
  if(do.call(paste0(compStr, "_isSetMath"), list(obj))) {
    return(do.call(paste0(compStr, "_getMath"), list(obj)))
  } else {
    messageStr = paste0("Math element not set for this ", compStr, " object")
    stop(messageStr)
  }
}
