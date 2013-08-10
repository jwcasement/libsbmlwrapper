# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html

# Translates the given infix formula into MathML.
# 
# @return the MathML as a string.  The caller owns the memory and is
# responsible for freeing it.
# 
translateInfix <- function(formula) {
  
  math = parseFormula(formula)
  result = writeMathMLToString(math)
  
  return (result)
}


# 
# Translates the given MathML into an infix formula.  The MathML must
# contain no leading whitespace, but an XML header is optional.
# 
# @return the infix formula as a string.  The caller owns the memory and
# is responsible for freeing it.
# 
translateMathML <- function(xml) {
  # 
  # Prepend an XML header if not already present.
  #   
  if (substring(trim(xml),1, 2) != '<?') {
    header  = "<?xml version='1.0' encoding='UTF-8'?>\n"    
    math = readMathMLFromString(paste(header, xml))    
    return( formulaToString(math))
  } else {    
    math = readMathMLFromString(xml)
    return( formulaToString(math))
  }
}


# Utility function to trim the string
trim <- function(str) {
  return(gsub("(^ +)|( +$)", "", str))
}


# example:
buffer = ""
line = trim("3*5 + 5")
buffer = paste(buffer, line ,"\n", sep="")

if(substring(trim(buffer), 1,1) == "<") {
  
  result = translateMathML(buffer)
  
} else {
  
  result = translateInfix(buffer)
  
}
cat("Result:\n\n",result,"\n\n\n")


