
#' R_ListOfFunctionDefinitions class
#'
#' @title R_ListOfFunctionDefinitions class
#' @rdname R_ListOfFunctionDefinitions
#' @docType class
#' @exportClass R_ListOfFunctionDefinitions
#' @name R_ListOfFunctionDefinitions-class
#' @aliases R_ListOfFunctionDefinitions-class
#' @note an R 'list' containing libSBML _p_* objects
#'
setClass("R_ListOfFunctionDefinitions", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @aliases R_ListOfUnitDefinitions-class
#' @exportClass R_ListOfUnitDefinitions
setClass("R_ListOfUnitDefinitions", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @aliases R_ListOfCompartmentTypes-class
#' @exportClass R_ListOfCompartmentTypes
setClass("R_ListOfCompartmentTypes", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfSpeciesTypes
#' @aliases R_ListOfSpeciesTypes-class
setClass("R_ListOfSpeciesTypes", contains = "list")


#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfCompartments
#' @aliases R_ListOfCompartments-class
setClass("R_ListOfCompartments", contains = "list")


#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfSpecies
#' @aliases R_ListOfSpecies-class
setClass("R_ListOfSpecies", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfParameters
#' @aliases R_ListOfParameters-class
setClass("R_ListOfParameters", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfInitialAssignments
#' @aliases R_ListOfInitialAssignments-class
setClass("R_ListOfInitialAssignments", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfRules
#' @aliases R_ListOfRules-class
setClass("R_ListOfRules", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfConstraints
#' @aliases R_ListOfConstraints-class
setClass("R_ListOfConstraints", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfReactions
#' @aliases R_ListOfReactions-class
setClass("R_ListOfReactions", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfEvents
#' @aliases R_ListOfEvents-class
setClass("R_ListOfEvents", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfUnits
#' @aliases R_ListOfUnits-class
setClass("R_ListOfUnits", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfSpeciesReferences
#' @aliases R_ListOfSpeciesReferences-class
setClass("R_ListOfSpeciesReferences", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfModifierSpeciesReferences
#' @aliases R_ListOfModifierSpeciesReferences-class
setClass("R_ListOfModifierSpeciesReferences", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfLocalParameters
#' @aliases R_ListOfLocalParameters-class
setClass("R_ListOfLocalParameters", contains = "list")

#' @rdname R_ListOfFunctionDefinitions
#' @exportClass R_ListOfEventAssignments
#' @aliases R_ListOfEventAssignments-class
setClass("R_ListOfEventAssignments", contains = "list")
