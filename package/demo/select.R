# load an SBML file
data(ts_case00124)

# create a _p_SBMLDocument object
doc = readSBMLFromString(ts_case00124)

# now create a _p_Model object
mod = SBMLDocument_getModel(doc)

# First double bracket returns a 'ListOf' container
# (Bracket can contain character or numeric)

# Example 1: To return the ListOfSpecies container
mod[[6]]            

# Example 2: To return the ListOfUnitDefinitions container
mod[["ListOfUnitDefinitions"]]

# To return an element from a 'ListOf' container, use a further double-bracket:

# Example 3: To return the 2nd _p_Species object in the ListOfSpecies container
mod[[6]][[2]]
            
# Or use single brackets to return another (filtered) 'ListOf' container:

# Example 4: To return a ListOfParameters container, containing the 2nd and 3rd
# _p_Parameter objects
mod[[7]][2:3]

# Next double bracket returns an attribute:
  
# Example 5: To return the Id attribute of the 3rd _p_Species object
mod[[6]][[3]][["Id"]]

# Example 6: A further example to demonstrate selection and filtering:
lsp = mod[[6]]
lsp2 = lsp[2:3]
sp = lsp[[2]]
sp2 = lsp2[[1]]
# Now test for equality:
sp[["Name"]] == sp2[["Name"]]

# Use "Math" to get the Math element of a component:

# Example 7: To return the Math element for the 'Rule' component
mod[[9]][[1]][["Math"]]

# Components which exist within other components can be selected using a further
# double bracket:

# Example 8: To select the KineticLaw object from the 2nd 'Reaction' object:
mod[[11]][[2]][["KineticLaw"]]

# Example 9: To return the Math element this KineticLaw object:
mod[[11]][[2]][["KineticLaw"]][["Math"]]
