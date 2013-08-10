#' A listing of SBML model component names in plural form
#' 
#' @title Model nodes (plural)
#' @rdname get_model_num_nodes
#' @name get_model_num_nodes
#' @note component names in plural form are required for some libSBML function calls
#' 
get_model_num_nodes = function() {
  c("FunctionDefinitions", "UnitDefinitions", 
    "CompartmentTypes", "SpeciesTypes", "Compartments",
    "Species","Parameters","InitialAssignments", "Rules", 
    "Constraints","Reactions", "Events",
    "Units", "SpeciesReferences", "SimpleSpeciesReferences",
    "ModifierSpeciesReferences", "KineticLaws", "LocalParameters",
    "Triggers", "Delays", "Priorities", "EventAssignments")
}



#' A listing of SBML model component names in singular form
#' 
#' @title Model nodes (singular)
#' @rdname get_model_nodes
#' @name get_model_nodes
#' @note component names in singular form are required for some libSBML function calls 
#' 
get_model_nodes = function() {
  c("FunctionDefinition", "UnitDefinition", 
    "CompartmentType", "SpeciesType", "Compartment",
    "Species","Parameter","InitialAssignment", "Rule", 
    "Constraint", "Reaction", "Event",
    "Unit", "SpeciesReference", "SimpleSpeciesReference",
    "ModifierSpeciesReference", "KineticLaw", "LocalParameter",
    "Trigger", "Delay", "Priority", "EventAssignment")
}



#' A listing of libSBML component classes
#' 
#' @title Component classes
#' @rdname get_component_classes
#' @name get_component_classes
#'
get_component_classes = function() paste0("_p_", get_model_nodes())



#' A listing of libSBML container classes
#' 
#' @title _p_ListOf object classes
#' @rdname get_p_ListOf_classes
#' @name get_p_ListOf_classes
#' @note Not all objects have container classes
#'
get_p_ListOf_classes = function() paste0("_p_ListOf", get_model_num_nodes()[-c(15,17,19,20,21)])



#' A listing of container classes for libSBML component objects
#' 
#' @title R_ListOf object classes
#' @rdname get_R_ListOf_classes
#' @name get_R_ListOf_classes
#' @note These are R 'list' objects containing libSBML component objects. 
#' Not all objects have container classes
#' 
get_R_ListOf_classes = function() paste0("R_ListOf", get_model_num_nodes()[-c(15,17,19,20,21)])



#' A listing of libSBML container names
#' 
#' @title Container nodes
#' @rdname get_ListOf_nodes
#' @name get_ListOf_nodes
#' @note required for some libSBML function calls. 
#' Not all objects have container classes
#' 
get_ListOf_nodes = function() paste0("ListOf", get_model_num_nodes()[-c(15,17,19,20,21)])



#' A listing of function names for creating components
#' 
#' @title Create component function names
#' @rdname get_create_component_nodes
#' @name get_create_component_nodes
#' 
get_create_component_nodes = function() paste0("create", get_model_nodes()[1:12])



#' A listing of SBML components for which attribute defaults exist
#' 
#' @title SBML components with attribute defaults
#' @rdname get_default_nodes
#' @param level an SBML model level
#' @name get_default_nodes
#' @return a listing of all SBML components for which typical defaults can be generated
#' @note Not all components are included in the lists returned by this function
#' since some components do not have typical defaults and some do not have attributes.
#' For SBML Level 3, the list also excludes the 'CompartmentType' and 'SpeciesType'
#' components since these do not exist in SBML Level 3.  
#' 
get_default_nodes = function(level) {
  
  has_defaults = c("FunctionDefinition", "UnitDefinition", "CompartmentType",
                   "SpeciesType", "Compartment", "Species","Parameter",
                   "InitialAssignment", "Reaction", "Event", "Unit",
                   "KineticLaw", "Trigger", "EventAssignment")
  
  ifelse((level > 2), return(has_defaults[-c(3,4)]), return(has_defaults))  
}



#' A listing of SBML components which have other components or elements within them
#' 
#' @title Components with 'sub-components'
#' @rdname has_subcomponent_nodes
#' @name has_subcomponent_nodes
#' 
has_subcomponent_nodes = function() {
  c("UnitDefinition", "Constraint", "Reaction", "KineticLaw", "Event")
}



#' A listing of SBML components which have a math element
#' 
#' @title Components with math element
#' @rdname has_math_element_nodes
#' @name has_math_element_nodes
#' 
has_math_element_nodes = function() {
  c("FunctionDefinition", "InitialAssignment",  "Rule", "Constraint", "KineticLaw",
    "Trigger", "Priority", "Delay", "EventAssignment")
}



#' A listing of attributes of the libSBML 'FunctionDefinition' component
#' 
#' @title FunctionDefinition component attributes
#' @rdname FunctionDefinition_attributes
#' @name FunctionDefinition_attributes
#'
FunctionDefinition_attributes = function() {
  c("Id", "Name")
}



#' A listing of attributes of the libSBML 'UnitDefinition' component
#' 
#' @title UnitDefinition component attributes
#' @rdname UnitDefinition_attributes
#' @name UnitDefinition_attributes
#'
UnitDefinition_attributes = function() {
  c("Id", "Name")
}



#' A listing of attributes of the libSBML 'CompartmentType' component
#' 
#' @title CompartmentType component attributes
#' @rdname CompartmentType_attributes
#' @name CompartmentType_attributes
#'
CompartmentType_attributes = function() {
  c("Id", "Name")
}



#' A listing of attributes of the libSBML 'SpeciesType' component
#' 
#' @title SpeciesType component attributes
#' @rdname SpeciesType_attributes
#' @name SpeciesType_attributes
#'
SpeciesType_attributes = function() {
  c("Id", "Name")
}



#' A listing of attributes of the libSBML 'Compartment' component
#' 
#' @title Compartment component attributes
#' @rdname Compartment_attributes
#' @name Compartment_attributes
#'
Compartment_attributes = function() {
  c("Id", "Name", "SpatialDimensions", "Size", "Units", "Constant")
}



#' A listing of attributes of the libSBML 'Species' component
#' 
#' @title Species component attributes
#' @rdname Species_attributes
#' @name Species_attributes
#'
Species_attributes = function() {
  c("Id", "Name", "Compartment", "InitialAmount", "InitialConcentration",
    "SubstanceUnits", "HasOnlySubstanceUnits", "BoundaryCondition",
    "Constant", "ConversionFactor")
}



#' A listing of attributes of the libSBML 'Parameter' component
#' 
#' @title Parameter component attributes
#' @rdname Parameter_attributes
#' @name Parameter_attributes
#'
Parameter_attributes = function() {
  c("Id", "Name", "Value", "Units", "Constant")
}



#' A listing of attributes of the libSBML 'InitialAssignment' component
#' 
#' @title InitialAssignment component attributes
#' @rdname InitialAssignment_attributes
#' @name InitialAssignment_attributes
#'
InitialAssignment_attributes = function() {
  c("Symbol")
}



#' A listing of attributes of the libSBML 'Rule' component
#' 
#' @title Rule component attributes
#' @rdname Rule_attributes
#' @name Rule_attributes
#'
Rule_attributes = function() {
  c("Id", "Formula", "Type", "Units", "Variable")
}



#' A listing of attributes of the libSBML 'Reaction' component
#' 
#' @title Reaction component attributes
#' @rdname Reaction_attributes
#' @name Reaction_attributes
#'
Reaction_attributes = function() {
  c("Id", "Name", "Reversible", "Fast", "Compartment")
}



#' A listing of attributes of the libSBML 'Event' component
#' 
#' @title Event component attributes
#' @rdname Event_attributes
#' @name Event_attributes
#'
Event_attributes = function() {
  c("Id", "Name", "UseValuesFromTriggerTime")
}



#' A listing of attributes of the libSBML 'Units' component
#' 
#' @title Unit component attributes
#' @rdname Unit_attributes
#' @name Unit_attributes
#' @note The 'Unit' component exists within the 'UnitDefinition' component  
#'
Unit_attributes = function() {
  c("Exponent", "Kind", "Multiplier", "Offset", "Scale")
}


#' A listing of attributes of the libSBML 'SpeciesReference' component
#' 
#' @title SpeciesReference component attributes
#' @rdname SpeciesReference_attributes
#' @name SpeciesReference_attributes
#' @note The 'SpeciesReference' component exists within the 'Reaction' component  
#'
SpeciesReference_attributes = function() {
  c("Stoichiometry", "Constant")
}



#' A listing of attributes of the libSBML 'SimpleSpeciesReference' component
#' 
#' @title SimpleSpeciesReference component attributes
#' @rdname SimpleSpeciesReference_attributes
#' @name SimpleSpeciesReference_attributes
#' @note The 'SimpleSpeciesReference' component exists within the 'Reaction' component  
#'
SimpleSpeciesReference_attributes = function() {
  c("Id", "Name", "Species")
}



#' A listing of attributes of the libSBML 'KineticLaw' element
#' 
#' @title KineticLaw element attributes
#' @rdname KineticLaw_attributes
#' @name KineticLaw_attributes
#' @note The 'KineticLaw' element exists within the 'Reaction' component   
#'
KineticLaw_attributes = function() {
  c("Formula", "SubstanceUnits", "TimeUnits", "NumParameters", "NumLocalParameters")
}



#' A listing of attributes of the libSBML 'LocalParameter' component
#' 
#' @title LocalParameter component attributes
#' @rdname LocalParameter_attributes
#' @name LocalParameter_attributes
#' @note The 'LocalParameter' component exists within the 'KineticLaw' element of
#' the 'Reaction' component  
#'
LocalParameter_attributes = function() {
  c("Id", "Name", "Value", "Units")
}



#' A listing of attributes of the libSBML 'Trigger' component
#' 
#' @title Trigger component attributes
#' @rdname Trigger_attributes
#' @name Trigger_attributes
#' @note The 'Trigger' component exists within the 'Event' component  
#'
Trigger_attributes = function() {
  c("InitialValue", "Persistent")
}



#' A listing of attributes of the libSBML 'EventAssignment' component
#' 
#' @title EventAssignment component attributes
#' @rdname EventAssignment_attributes
#' @name EventAssignment_attributes
#' @note The 'EventAssignment' component exists within the 'Event' component  
#'
EventAssignment_attributes = function() {
  c("Variable")
}