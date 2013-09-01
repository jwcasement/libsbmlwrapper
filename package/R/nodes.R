# Model nodes (plural)
get_model_num_nodes = function() {
  c("FunctionDefinitions", "UnitDefinitions", 
    "CompartmentTypes", "SpeciesTypes", "Compartments",
    "Species","Parameters","InitialAssignments", "Rules", 
    "Constraints","Reactions", "Events",
    "Units", "SpeciesReferences", "SimpleSpeciesReferences",
    "ModifierSpeciesReferences", "KineticLaws", "LocalParameters",
    "Triggers", "Delays", "Priorities", "EventAssignments")
}



# Model nodes (singular)
get_model_nodes = function() {
  c("FunctionDefinition", "UnitDefinition", 
    "CompartmentType", "SpeciesType", "Compartment",
    "Species","Parameter","InitialAssignment", "Rule", 
    "Constraint", "Reaction", "Event",
    "Unit", "SpeciesReference", "SimpleSpeciesReference",
    "ModifierSpeciesReference", "KineticLaw", "LocalParameter",
    "Trigger", "Delay", "Priority", "EventAssignment")
}



## A listing of libSBML component classes
get_component_classes = function() paste0("_p_", get_model_nodes())



## A listing of libSBML container classes
## Note Not all objects have container classes
get_p_ListOf_classes = function() paste0("_p_ListOf", get_model_num_nodes()[-c(15,17,19,20,21)])



## A listing of container classes for libSBML component objects
## Note These are R 'list' objects containing libSBML component objects. 
## Not all objects have container classes
get_R_ListOf_classes = function() paste0("R_ListOf", get_model_num_nodes()[-c(15,17,19,20,21)])



## A listing of libSBML container names
## Not all objects have container classes
get_ListOf_nodes = function() paste0("ListOf", get_model_num_nodes()[-c(15,17,19,20,21)])



# A listing of function names for creating components
get_create_component_nodes = function() paste0("create", get_model_nodes()[1:12])



## A listing of SBML components for which attribute defaults exist
## @param level an SBML model level
## @param vers an SBML model version
# @return a listing of all SBML components for which typical defaults can be generated
# @note Not all components are included in the lists returned by this function
# since some components do not have typical defaults and some do not have attributes.
# Also, the 'CompartmentType' and 'SpeciesType' components only existed in SBML Level 2 Versions 2-4,
# and the 'InitialAssignment' component was introduced in SBML Level 2 Version 2
get_default_nodes = function(level, vers) {
  
  has_defaults = c("FunctionDefinition", "UnitDefinition", "Compartment",
                   "Species","Parameter", "Reaction", "Event", "Unit",
                   "KineticLaw", "Trigger", "EventAssignment")
  
  if(level == 2 && vers %in% c(2,3,4)) {
    return(c(has_defaults, "CompartmentType", "SpeciesType", "InitialAssignment"))
  } else if(level == 3) {
    return(c(has_defaults, "InitialAssignment"))
  } else return(has_defaults)  
}



# A listing of SBML components which have other components or elements within them
has_subcomponent_nodes = function() {
  c("UnitDefinition", "Constraint", "Reaction", "KineticLaw", "Event")
}



# A listing of SBML components which have a math element
has_math_element_nodes = function() {
  c("FunctionDefinition", "InitialAssignment",  "Rule", "Constraint", "KineticLaw",
    "Trigger", "Priority", "Delay", "EventAssignment")
}



# A listing of attributes of the libSBML 'FunctionDefinition' component
FunctionDefinition_attributes = function()  c("Id", "Name")

UnitDefinition_attributes = function()  c("Id", "Name")

CompartmentType_attributes = function() c("Id", "Name")

SpeciesType_attributes = function() c("Id", "Name")

Compartment_attributes = function() c("Id", "Name", "SpatialDimensions", "Size", "Units", "Constant")

Species_attributes = function() {
  c("Id", "Name", "Compartment", "InitialAmount", "InitialConcentration",
    "SubstanceUnits", "HasOnlySubstanceUnits", "BoundaryCondition",
    "Constant", "ConversionFactor")
}


Parameter_attributes = function() c("Id", "Name", "Value", "Units", "Constant")

InitialAssignment_attributes = function() c("Symbol")

Rule_attributes = function()  c("Id", "Formula", "Type", "Units", "Variable")


Reaction_attributes = function()  c("Id", "Name", "Reversible", "Fast", "Compartment")


Event_attributes = function() c("Id", "Name", "UseValuesFromTriggerTime")

Unit_attributes = function()  c("Exponent", "Kind", "Multiplier", "Offset", "Scale")

SpeciesReference_attributes = function()  c("Stoichiometry", "Constant")

SimpleSpeciesReference_attributes = function() c("Id", "Name", "Species")

KineticLaw_attributes = function() {
  c("Formula", "SubstanceUnits", "TimeUnits", "NumParameters", "NumLocalParameters")
}

LocalParameter_attributes = function()  c("Id", "Name", "Value", "Units")

Trigger_attributes = function()   c("InitialValue", "Persistent")

EventAssignment_attributes = function() c("Variable")
