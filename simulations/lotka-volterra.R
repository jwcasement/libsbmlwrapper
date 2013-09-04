# Obtain an example realisation of a stochastic Lotka-Volterra process
# SBML model from the website accompanying Darren Wilkinson's book "Stochastic Modelling for Systems Biology"

library(smfsb)
set.seed(1)

# get SBML document as an XML string
xmlStr = paste(readLines("http://www.staff.ncl.ac.uk/d.j.wilkinson/smfsb/2e/ch06-lv.xml"), collapse = "")

# get model from document
doc = readSBMLFromString(xmlStr)
mod = SBMLDocument_getModel(doc)

# now obtain a realisation via gillespie function with 10000 timesteps
N = get_SPN_list(mod)
out = gillespie(N,10000)

# N.B. 'out' is a list with tags 't' and 'x'
# 't' is a vector of event times
# 'x' is a matrix with a columns for 'Prey' and 'Predator'



###############################################################
# example code to produce an attractive plot of the realisation

# plot prey
plot(stepfun(out$t, out$x[,1]), main = "Stochastic LV process",
     panel.first = grid(),
     xlab = "Time", ylab = "Population", lwd = 2,
     xlim = c(0, max(out$t)), ylim = c(0, 500))

# plot predator
lines(stepfun(out$t, out$x[,2]), lwd = 2, col = "slateblue")

# add labels
text(10, 30, "Prey", font = 2)
text(17, 400, "Predator", font = 2, col = "slateblue")
