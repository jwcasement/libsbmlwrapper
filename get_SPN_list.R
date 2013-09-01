# Function sets up a model as a Stochastic Petri Net
#
# All rate values, stoichiometry and constants found within the Compartments,
# Parameters and Reaction components are read from the model
#
# Initial Amounts for Species are read from the model
#
# SPN is returned as a list and is suitable for use in simulations using the
# function 'gillespie' within the package smfsb
#
# KineticLaw formulae are extracted as character strings to be parsed and
# evaluated during simulation

library(libsbmlwrapper)

get_SPN_list = function(m) {
    
  numReactions = length(m[[11]])
  numSpecies = length(m[[6]])
  
  # create stoichiometry matrix 'pre'
  pre = matrix(0, nrow=numReactions, ncol=numSpecies)
    
  # add species IDs as headers to columns
  colnames(pre) = lapply(1:numSpecies, function(x){m[[6]][[x]][["Id"]]})
  
  # include reaction IDs as row names
  rownames(pre) = lapply(1:numReactions, function(x){m[[11]][[x]][["Id"]]})
    
  # create stoichiometry matrix 'post' as a copy of 'pre' 
  post = pre
  
  # get values for 'pre' and 'post' matrices
  for(i in 1:numReactions) {
    # get _p_Reaction object
    r = m[[11]][[i]]
    # get values for 'pre' matrix for this reaction
    numReactants = Reaction_getNumReactants(r)
    if(numReactants > 0) {
      for(j in 1:numReactants) {
        pre[i, r[["ListOfReactants"]][[j]][["Species"]]] = r[["Reactant"]][[j]][["Stoichiometry"]]
      }      
    }
    # get values for 'post' matrix for this reaction
    numProducts = Reaction_getNumProducts(r)
    if(numProducts > 0) {
      for(j in 1:numProducts) {
        post[i, r[["ListOfProducts"]][[j]][["Species"]]] = r[["Product"]][[j]][["Stoichiometry"]]
      }      
    }    
  }  
  
  # get named values for all Reactions
  for(i in 1:numReactions) {
    # get KineticLaw object
    kl = m[[11]][[i]][["KineticLaw"]]
    numParameters = KineticLaw_getNumParameters(kl)
    if(numParameters > 0) {
      for(j in 1:numParameters) {
        assign(kl[["Parameter"]][[j]][["Id"]], kl[["Parameter"]][[j]][["Value"]])
      }          
    }      
  }
  
  # get named values for all Compartments
  numCompartments = Model_getNumCompartments(m)
  if(numCompartments > 0) {
    for(i in 1:numCompartments) {
      assign(m[[5]][[i]][["Id"]], m[[5]][[i]][["Size"]])
    }    
  }
  
  # get named values for all Parameters
  numParameters = Model_getNumParameters(m)
  if(numParameters > 0) {
    for(i in 1:numParameters) {
      assign(m[[7]][[i]][["Id"]], m[[7]][[i]][["Value"]])
    }    
  }
  
  # get InitialAmounts for all Species
  M = vector(mode = "numeric", length = numSpecies)
  for(i in 1:numSpecies) {
    names(M)[i] = m[[6]][[i]][["Id"]]
    M[i] = m[[6]][[i]][["InitialAmount"]]
  }
  
  # get KineticLaw formula for each reaction
  formStr = vector(mode = "character", length = numReactions)
  for(i in 1:numReactions) {
    formStr[i] = m[[11]][[i]][["KineticLaw"]][["Formula"]]
  }
    
  # get hazard function      
  h = function(x, t) {    
    with(as.list(x), {
      return(mapply(function(j) eval(parse(text=j)), formStr[1:numReactions]))      
    })
  }  
  
  return(list("M" = M,  "Pre" = pre, "Post" = post, "h" = h))
}
