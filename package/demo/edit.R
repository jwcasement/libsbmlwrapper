# load an SBML file
data(ts_case00247)

# create a _p_SBMLDocument object
doc = readSBMLFromString(ts_case00247)

# now create a _p_Model object
mod = SBMLDocument_getModel(doc)

# ===========================
# *** Changing attributes ***
# ===========================

# Note: All 'Edit' functions make use of libSBML operation return values
# for error notification.

# Example 1: To change the 'Name' attribute of the 4th _p_Species object to "Species2"
sp = mod[[6]][[4]]
sp[["Name"]] = "Species2"

# Example 2: sets the 'Constant' attribute of the 2nd _p_Parameter object to FALSE
p = mod[[7]][[2]]
p[["Constant"]] = FALSE

# Setting an attribute to NULL sets the attribute to its 'typical' default value

# Example 3: To set the Id attribute of the 1st _p_Species object to its
# typical default value of ""
sp = mod[[6]][[1]]
sp[["Id"]] = NULL

# Example 4: To set the InitialAmount attribute of the 3rd _p_Species object to its
# typical default value of 0
sp = mod[[6]][[3]]
sp[["InitialAmount"]] = NULL


# ===========================
# *** Creating components ***
# ===========================
  
# Note: When an object is created, the SBML Level and Version of the enclosing
# _p_Model object, as well as any SBML package namespaces, are used to initialise the object's attributes.

# Example 5: To create a _p_Parameter object and add it to the model
createParameter(mod)

# The 'create' functions can also be used to copy objects within a model:

# Note: Objects of the same class are not permitted to have the same Id,
# so the Ids of copied objects are prepended with "CopyOf_" 

# Example 6: To add a copy of the 2nd _p_Parameter object to the model
createParameter(mod,2)

# Note: createParameter(mod,0) is equivalent to createParameter(mod)

# The 'create' functions can also take vectors:

# Example 7: To add copies of the 1st and 3rd _p_Species objects to the model
createSpecies(mod, c(1,3))

# Example 8: An example of a quick way to create a new component object,
# add it to the model, then add information to it.
sp = createSpecies(mod)
sp[["Id"]] = "newSpeciesId"
sp[["Name"]] = "newspeciesName" #and so on for all attributes


# ===========================
# *** Deleting components ***
# ===========================

#Objects can be deleted by setting them to NULL:

# Example 8: To delete the 3rd _p_Species object from the model m 
lsp = mod[[6]]
lsp[[3]] = NULL

# Note: This command deletes the _p_Species object completely; i.e. it is
# removed from the model and deleted (the deleted object is not returned
# to the calling environment)
