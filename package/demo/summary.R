# load an SBML file
data(ts_case00124)

# create a _p_SBMLDocument object
doc = readSBMLFromString(ts_case00124)

# now create a _p_Model object
mod = SBMLDocument_getModel(doc)

# Example 1: To see 'high-level' information about the _p_SBMLDocument object doc
# (SBML level, version, namespace and any errors)
summary(doc)

# Example 2: To see a list of attributes of the _p_Model object mod, including a
# summary of the number of each component in present in the model
summary(mod)

# Examples of 'summary' applied to component objects:

# Example 3: To get a summary of all attributes of _p_Parameter object m[[7]][[3]]
summary(mod[[7]][[3]])
 
# Example 4: To get the value of the InitialAmount attribute of _p_Species object sp
sp = mod[[6]][[2]]
summary(sp)$InitialAmount

# Example 5: Note that Example 4 produces equivalent output to the following:
mod[[6]][[2]][["InitialAmount"]]

# Example 6: To get the value of the BoundaryCondition attribute of _p_Species object m[[6]][[1]]
summary(mod[[6]][[1]])$BoundaryCondition

# Examples of 'summary' applied to 'ListOf' container objects:

# Example 7: To see all attribute values for all _p_Species objects
# in the ListOfspecies container mod[[6]]
summary(mod[[6]])

# Example 8: To get 'Name' attributes for all _p_Species objects in the model
summary(mod[[6]])$Name

# Example 9: An example of 'summary' applied to a filtered 'ListOf' container  
summary(mod[[7]][c(1,3,5)])