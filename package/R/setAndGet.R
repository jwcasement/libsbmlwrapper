## Generate defaults for attributes of component objects
## @return a list containing the functions \code{get_Defaults} and \code{set_Defaults} 
## @note There is no 'createSpeciesReference' function in libSBML, hence the additional
## routine of using 'createProduct' to generate a SpeciesReference object initialised 
## to typical defaults. 
set_and_get_defaults = function(){
  
  defaults = list()
  
  setter = function(level, vers) {
    
    mod = Model(level, vers)     
    
    for(compStr in get_default_nodes(level,vers)) {
      temp = do.call(paste0("Model_create", compStr), list(mod))
      funs = paste0(compStr, "_get", do.call(paste0(compStr, "_attributes"), list()))
      defaults[[compStr]] <<- sapply(funs, do.call, list(temp), simplify = FALSE)
    }   
    
    # get defaults for SpeciesReference objects via 'createProduct'
    sr = Model_createProduct(mod)
    funs = paste0("SpeciesReference_get", SpeciesReference_attributes())
    defaults[["SpeciesReference"]] <<- sapply(funs, do.call, list(sr), simplify = FALSE)  
    
  }
    
  getter = function(compStr, attrStr) {
    defaults[[compStr]][[paste0(compStr, "_get", attrStr)]]
  }
  
  return(list(get_Defaults = getter, set_Defaults = setter))
}
