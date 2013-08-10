# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html

# load an SBML file
data(ts_case00124)

# create a _p_SBMLDocument object
doc = readSBMLFromString(ts_case00124)

# now create a _p_Model object
mod = SBMLDocument_getModel(doc)

printFunctionDefinition <- function(n, fd) {
  if ( FunctionDefinition_isSetMath(fd) )
  {
    cat("FunctionDefinition ",n,", ",FunctionDefinition_getId(fd),"(")
    
    math = FunctionDefinition_getMath(fd)
    
    # Print function arguments. 
    if (ASTNode_getNumChildren(math) > 1) {
      cat(ASTNode_getName( ASTNode_getLeftChild(math) ))
      
      for (n in seq_len(ASTNode_getNumChildren(math) - 1)) {
        cat(", ", ASTNode_getName( ASTNode_getChild(math, n) ))
      }
    }
    
    cat(") := ")
    
    # Print function body. 
    if (ASTNode_getNumChildren(math) == 0) {
      cat("(no body defined)")
    } else {
      math    = ASTNode_getChild(math, ASTNode_getNumChildren(math) - 1)
      formula = formulaToString(math)
      cat(formula,"\n")      
    }
  }
}


printRuleMath <- function(n, r) {
  if ( Rule_isSetMath(r) ) {
    formula = formulaToString( Rule_getMath(r) )
    cat("Rule ",n,", formula: ",formula,"\n")    
  }
}


printReactionMath <- function(n, r)
{
  if (Reaction_isSetKineticLaw(r)) {
    kl = Reaction_getKineticLaw(r)
    
    if ( KineticLaw_isSetMath(kl) ) {
      formula = formulaToString( KineticLaw_getMath(kl) )
      cat("Reaction ",n,", formula: ",formula,"\n")      
    }
  }
}


printEventAssignmentMath <- function(n, ea) {
  
  if ( EventAssignment_isSetMath(ea) ) {
    variable = EventAssignment_getVariable(ea)
    formula  = formulaToString( EventAssignment_getMath(ea) )
    
    cat("  EventAssignment ",n,", trigger: ",variable," = ",formula,"\n")
    
  }
}


printEventMath <- function(n, e) {
  if ( Event_isSetDelay(e) ) {
    delay = Event_getDelay(e)
    formula = formulaToString( Delay_getMath(delay) )
    cat("Event ",n," delay: ",formula,"\n")    
  }
  
  if ( Event_isSetTrigger(e) ) {
    trigger = Event_getTrigger(e)
    
    formula = formulaToString( Trigger_getMath(trigger) )
    cat("Event ",n," trigger: ",formula,"\n")    
  }
  
  for (i in seq_len(Event_getNumEventAssignments(e))) {
    printEventAssignmentMath(i, Event_getEventAssignment(e, i-1))
  }
  
  cat("\n")
}

printMath <- function(mod) {
  
  for (n in seq_len(Model_getNumFunctionDefinitions(mod))){
    printFunctionDefinition(n, Model_getFunctionDefinition(mod, n-1))
  }
  
  for (n in seq_len(Model_getNumRules(mod))){
    printRuleMath(n , Model_getRule(mod, n-1))
  }
  
  cat("\n")
  
  for (n in seq_len(Model_getNumReactions(mod))){
    printReactionMath(n, Model_getReaction(mod, n-1))
  }
  
  cat("\n")
  
  for (n in seq_len(Model_getNumEvents(mod))){
    printEventMath(n , Model_getEvent(mod, n-1))
  }
}

printMath(mod)
