## Obtain an example realisation of the stochastic Michaelis-Menten kinetics model
## SBML model from the website accompanying Darren Wilkinson's book "Stochastic Modelling for Systems Biology"

library(smfsb)
set.seed(1)

# get SBML document as an XML string
xmlStr = paste(readLines("http://www.staff.ncl.ac.uk/d.j.wilkinson/smfsb/2e/ch07-mm-stoch.xml"),
               collapse = "")

# get model from document
doc = readSBMLFromString(xmlStr)
mod = SBMLDocument_getModel(doc)

# now obtain a realisation
N = get_SPN_list(mod)
out = gillespie(N,500)

## N.B. 'out' is a list with tags 't' and 'x'
## 't' is a vector of event times
## 'x' is a matrix with columns for 'S', 'E', 'SE' and 'P'


################################################################
## example code to produce an attractive plot of the realisation

# plot S
plot(stepfun(out$t, out$x[,1]), pch = "", main = "Stochastic LV process",
     panel.first = grid(),
     xlab = "Time", ylab = "# of molecules", lwd = 2,
     xlim = c(0, max(out$t)), ylim = c(0, 300))

# plot E, SE, P 
lines(stepfun(out$t, out$x[,2]), pch = "", lwd = 2, col = "slateblue")
lines(stepfun(out$t, out$x[,3]), pch = "", lwd = 2, col = "olivedrab")
lines(stepfun(out$t, out$x[,4]), pch = "", lwd = 2, col = "maroon")

# add labels
text(5, 210, "S", font = 2)
text(16, 30, "E", font = 2, col = "slateblue")
text(6, 110, "SE", font = 2, col = "olivedrab")
text(25, 210, "P", font = 2, col = "maroon")
