#' Delete an object by setting value to NULL
#' 
#' Deletes a member of an R_ListOf object and removes it from the model 
#' 
#' @title Delete an object from an R_ListOf object
#' @param x an R_ListOf object
#' @param i an integer indicating the position of the object to be deleted
#' @param value set to NULL to indicate that the object will be deleted
#' @docType methods
#' @rdname delete-methods
#' @export
#' @aliases [[<-,R_ListOf,ANY-method
#' @aliases [[<-,R_ListOf,numeric,missing-method
#' @name delete_RListOf
setMethod("[[<-", signature(x = "R_ListOf", i = "numeric", j = "missing", value = "ANY"),
          function(x, i, value) delete_from_RList(x, i, value)
)



#' A function to delete an object from an R_ListOf object
#' 
#' The object is also removed from the parent model
#' 
#' @title Delete object from a container object
#' @rdname delete_from_RList
#' @name delete_from_RList 
#' @param RList the R_ListOf object
#' @param index an integer corresponding to the position of the object in \code{RList}
#' to be deleted
#' @param value set to NULL to indicate that the object will be deleted   
#' @return the R_ListOf object \code{RList} with the element at \code{index} deleted
delete_from_RList = function(RList, index, value) {
  
  if(is.null(value)) {
    code = SBase_removeFromParentAndDelete(RList[[index]])
    if(code != 0) {
      warning(paste("libSBML Operation Return Value",
                    code, get_error_code(code)))
    }
  }
  
  return(RList)
}



#' A function to remove an object from a model and delete it
#' 
#' @title Remove and delete an object
#' @rdname delete_object
#' @name delete_object
#' @param obj the object to be deleted
delete_object = function(obj) {  
  
  code = SBase_removeFromParentAndDelete(obj)
  
  if(code != 0) { 
    warning(paste("libSBML Operation Return Value", code, get_error_code(code)))
  }
}
