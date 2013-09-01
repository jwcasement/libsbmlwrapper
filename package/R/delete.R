#' @rdname select-methods-_p_Model
#' @aliases [[<-,R_ListOf,ANY-method
#' @aliases [[<-,R_ListOf,numeric,missing-method
setMethod("[[<-", signature(x = "R_ListOf", i = "numeric", j = "missing", value = "ANY"),
          function(x, i, value) delete_from_RList(x, i, value)
)



#  function to delete an object from an R_ListOf object
# The object is also removed from the parent model
# @param RList the R_ListOf object
# @param index an integer corresponding to the position of the object in \code{RList}
# to be deleted
# param value set to NULL to indicate that the object will be deleted   
# return the R_ListOf object \code{RList} with the element at \code{index} deleted
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



##A function to remove an object from a model and delete it
delete_object = function(obj) {  
  code = SBase_removeFromParentAndDelete(obj)
  if(code != 0) { 
    warning(paste("libSBML Operation Return Value", code, get_error_code(code)))
  }
}
