# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html

# load an SBML file
data(ts_case00345)

# create a _p_SBMLDocument object
doc = readSBMLFromString(ts_case00345)

# now create a _p_Model object
mod = SBMLDocument_getModel(doc)

# define printAnnotation function
printAnnotation <- function(sb, id ) {
  
  if (!is.null(sb) && SBase_isSetAnnotation(sb)) {  
    cat("----- ",SBase_getElementName(sb),
        " (",id,") annotation -----\n",
        SBase_getAnnotationString(sb),"\n\n")
  }
}

# Model 

printAnnotation(mod, Model_getId(mod))

for(i in seq_len(Model_getNumReactions(mod))) {
  
  re = Model_getReaction( mod, i-1)
  printAnnotation(re, Reaction_getId(re))
  
  # SpeciesReference (Reactant) 
  
  for(j in seq_len(Reaction_getNumReactants( re))) {
    rt =  Reaction_getReactant(re, j-1)
    if (SBase_isSetAnnotation( rt)) cat("   ")
    printAnnotation(rt, SimpleSpeciesReference_getSpecies( rt ) )
  }
  
  # SpeciesReference (Product) 
  
  for(j in seq_len(Reaction_getNumProducts( re ))) {
    rt = Reaction_getProduct( re, j-1)
    if (SBase_isSetAnnotation( rt)) cat("   ")
    printAnnotation(rt, SimpleSpeciesReference_getSpecies( rt ) )
  }
  
  # ModifierSpeciesReference (Modifiers) 
  
  for(j in seq_len(Reaction_getNumModifiers( re )))  {
    md = Reaction_getModifier(re, j-1)
    if (SBase_isSetAnnotation( md)) cat("   ")
    printAnnotation(md, SimpleSpeciesReference_getSpecies( md ) )
  }
  
  # KineticLaw 
  
  if(Reaction_isSetKineticLaw( re )) {
    kl = Reaction_getKineticLaw( re )
    if (SBase_isSetAnnotation( kl)) cat("   ")
    printAnnotation(kl, "")
    
    # Parameter 
    
    for(j in seq_len(KineticLaw_getNumParameters( kl ))) {
      pa = KineticLaw_getParameter( kl, j-1)
      if (SBase_isSetAnnotation( pa)) cat("   ")
      printAnnotation(pa, Parameter_getId(pa))
    }
  }
  
}

# Species 

for(i in seq_len(Model_getNumSpecies(mod))) {
  sp = Model_getSpecies(mod, i-1)
  printAnnotation(sp, Species_getId(sp))
}

# Compartments 

for(i in seq_len(Model_getNumCompartments( mod ))) {
  sp = Model_getCompartment(mod, i-1)
  printAnnotation(sp, Compartment_getId(sp))
}

# FunctionDefinition 

for(i in seq_len(Model_getNumFunctionDefinitions(mod))) {
  sp = Model_getFunctionDefinition(mod, i-1)
  printAnnotation(sp, FunctionDefinition_getId(sp))
}

# UnitDefinition 

for(i in seq_len(Model_getNumUnitDefinitions(mod))) {
  sp = Model_getUnitDefinition( mod, i-1)
  printAnnotation(sp, UnitDefinition_getId(sp))
}

# Parameter 
for(i in seq_len(Model_getNumParameters( mod ))) {
  sp = Model_getParameter( mod, i-1)
  printAnnotation(sp, Parameter_getId(sp))
}

# Rule 

for(i in seq_len(Model_getNumRules( mod ))) {
  sp = Model_getRule(mod, i-1)
  printAnnotation(sp, "")
}

# InitialAssignment 

for(i in seq_len(Model_getNumInitialAssignments(mod))) {
  sp = Model_getInitialAssignment(mod, i-1)
  printAnnotation(sp, "")
}

# Event 

for(i in seq_len(Model_getNumEvents(mod))) {
  sp = Model_getEvent(mod, i-1)
  printAnnotation(sp, Event_getId(sp))
  
  # Trigger 
  if(Event_isSetTrigger( sp )) {
    tg = Event_getTrigger(sp)
    if (SBase_isSetAnnotation(  tg)) cat( "   " )
    printAnnotation(tg, "")
  }
  
  # Delay 
  
  if(Event_isSetDelay(sp))  {
    dl = Event_getDelay(sp)
    if (SBase_isSetAnnotation(  dl)) cat( "   " )
    printAnnotation( dl, "")
  }
  
  # EventAssignment 
  
  for(j in seq_len(Event_getNumEventAssignments(sp))) {
    ea = Event_getEventAssignment(sp, j-1)
    if (SBase_isSetAnnotation(  ea)) cat( "   " )      
    printAnnotation(ea, "")
  }
}

# SpeciesType 

for(i in seq_len(Model_getNumSpeciesTypes(mod))) {
  sp = Model_getSpeciesType(mod, i-1)
  printAnnotation(sp, SpeciesType_getId(sp))
}

# Constraints 

for(i in seq_len(Model_getNumConstraints(mod))) {
  sp = Model_getConstraint(mod, i-1)
  printAnnotation(sp, "")
}
