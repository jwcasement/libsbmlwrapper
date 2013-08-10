# Note: This demo is based on code by Frank Bergmann
# http://frank-fbergmann.blogspot.co.uk/2012/07/r-bindings-for-libsbml-550.html
# 
# The function evalAST(ASTNode_t) evaluates the formula of an
# Abstract Syntax Tree by simple recursion and returns the result
# as a double value.
# 
# If variables (ASTNodeType_t AST_NAME) occur in the formula the user is
# asked to provide a numerical value.  When evaluating ASTs within an SBML
# document or simulating an SBML model this node type includes parameters
# and variables of the model.  Parameters should be retrieved from the
# SBML file, time and variables from current values of the simulation.
# 
# Not implemented:
# 
#  - PIECEWISE, LAMBDA, and the SBML model specific functions DELAY and
#    TIME and user-defined functions.
# 
#  - Complex numbers and/or checking for domains of trigonometric and root
#    functions.
# 
#  - Checking for precision and rounding errors.
# 
# The Nodetypes AST_TIME, AST_DELAY and AST_PIECEWISE default to 0.  The
# SBML DELAY function and unknown functions (SBML user-defined functions)
# use the value of the left child (first argument to function) or 0 if the
# node has no children.
# 
evalAST <- function(n) {
  
  childnum = ASTNode_getNumChildren(n)  
  result = switch (ASTNode_getType(n), 
                   AST_INTEGER = ASTNode_getInteger(n), 
                   AST_REAL = ASTNode_getReal(n), 
                   AST_REAL_E = ASTNode_getReal(n),
                   AST_RATIONAL = ASTNode_getReal(n),
                   AST_NAME= {
                     cat("\n-------------MESSAGE FROM EVALUATION FUNCTION-------------\n")
                     cat("Please enter a number for the variable!\n")
                     cat("If you do not enter a valid number (empty or characters), the \n")
                     cat("evaluation will proceed with a current internal value and the \n")
                     cat("result will make no sense.\n")
                     cat(ASTNode_getName(n), "=")
                     l = getline()
                     var = as.numeric(l)
                     cat(ASTNode_getName(n)," = ", var, "\n")
                     cat("-----------------------END MESSAGE--------------------------\n\n")
                     var
                   },
                   AST_FUNCTION_DELAY={
                     cat("\n-------------MESSAGE FROM EVALUATION FUNCTION-------------\n")
                     cat("Delays can only be evaluated during a time series simulation.\n")
                     cat("The value of the first child (ie. the first argument to the function)\n")
                     cat("is used for this evaluation. If the function node has no children the\n")
                     cat("value defaults to 0.\n")
                     cat("-----------------------END MESSAGE--------------------------\n\n")
                     if(childnum>0) {
                       evalAST(ASTNode_getChild(n,0))
                     } else {
                       0.0
                     }
                   },
                   AST_NAME_TIME = {
                     cat("\n-------------MESSAGE FROM EVALUATION FUNCTION-------------\n")
                     cat("The time can only be evaluated during a time series simulation.\n")
                     cat("The value of defaults to 0\n")
                     cat("-----------------------END MESSAGE--------------------------\n\n")
                     0.0
                   },
                   AST_CONSTANT_E = exp(1),
                   AST_CONSTANT_FALSE = 0.0,
                   AST_CONSTANT_PI = 4.*atan(1.),
                   AST_CONSTANT_TRUE =1.0,
                   AST_PLUS  = evalAST(ASTNode_getChild(n,0)) + evalAST(ASTNode_getChild(n,1)),
                   AST_MINUS =  {
                     if(childnum==1) {
                       - (evalAST(ASTNode_getChild(n,0)))
                     } else{
                       evalAST(ASTNode_getChild(n,0)) - evalAST(ASTNode_getChild(n,1))
                     }},
                   AST_TIMES = evalAST(ASTNode_getChild(n,0)) * evalAST(ASTNode_getChild(n,1)),
                   AST_DIVIDE= evalAST(ASTNode_getChild(n,0)) / evalAST(ASTNode_getChild(n,1)),
                   AST_POWER= pow(evalAST(ASTNode_getChild(n,0)),evalAST(ASTNode_getChild(n,1))),
                   AST_LAMBDA = {
                     cat("\n-------------MESSAGE FROM EVALUATION FUNCTION-------------\n")
                     cat("This function is not implemented yet.\n")
                     cat("The value defaults to 0.\n")
                     cat("-----------------------END MESSAGE--------------------------\n\n")
                     0.0
                   },
                   AST_FUNCTION = {
                     cat("\n-------------MESSAGE FROM EVALUATION FUNCTION-------------\n")
                     cat("This function is not known.\n")
                     cat("Within an SBML document new functions can be defined by the user or \n")
                     cat("application. The value of the first child (ie. the first argument to \n")
                     cat("the function) is used for this evaluation. If the function node has\n")
                     cat("no children the value defaults to 0.\n")
                     cat("-----------------------END MESSAGE--------------------------\n\n")
                     if(childnum>0){
                       evalAST(ASTNode_getChild(n,0))
                     }else{
                       0.0
                     }},
                   AST_FUNCTION_ABS = abs(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_ARCCOS= acos(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_ARCCOSH = acosh(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_ARCCOT = atan(1./ evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_ARCCOTH = ((1./2.)*log((evalAST(ASTNode_getChild(n,0))+1.)/(evalAST(ASTNode_getChild(n,0))-1.))),
                   AST_FUNCTION_ARCCSC =atan( 1. / sqrt( (evalAST(ASTNode_getChild(n,0))-1.)*(evalAST(ASTNode_getChild(n,0))+1.) ) ),
                   AST_FUNCTION_ARCCSCH =log((1.+sqrt((1+pow(evalAST(ASTNode_getChild(n,0)),2)))) /evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_ARCSEC= atan( sqrt( (evalAST(ASTNode_getChild(n,0))-1.)*(evalAST(ASTNode_getChild(n,0))+1.) ) ),
                   AST_FUNCTION_ARCSECH= log((1.+pow((1-pow(evalAST(ASTNode_getChild(n,0)),2)),0.5))/evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_ARCSIN = asin(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_ARCSINH= asinh(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_ARCTAN=atan(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_ARCTANH= atanh(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_CEILING= ceiling(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_COS = cos(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_COSH = cosh(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_COT = (1./tan(evalAST(ASTNode_getChild(n,0)))),
                   AST_FUNCTION_COTH= cosh(evalAST(ASTNode_getChild(n,0))) / sinh(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_CSC= (1./sin(evalAST(ASTNode_getChild(n,0)))),
                   AST_FUNCTION_CSCH=(1./cosh(evalAST(ASTNode_getChild(n,0)))),
                   AST_FUNCTION_EXP= exp(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_FACTORIAL = factorial(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_FLOOR = floor(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_LN = log(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_LOG= log10(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_PIECEWISE ={
                     cat("\n-------------MESSAGE FROM EVALUATION FUNCTION-------------\n")
                     cat("This function is not implemented yet.\n")
                     cat("The value defaults to 0.\n")
                     cat("-----------------------END MESSAGE--------------------------\n\n")
                     0.0
                   },
                   AST_FUNCTION_POWER = pow(evalAST(ASTNode_getChild(n,0)),evalAST(ASTNode_getChild(n,1))),
                   AST_FUNCTION_ROOT = pow(evalAST(ASTNode_getChild(n,1)),(1./evalAST(ASTNode_getChild(n,0)))),
                   AST_FUNCTION_SEC = 1./cos(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_SECH = 1./sinh(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_SIN = sin(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_SINH = sinh(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_TAN = tan(evalAST(ASTNode_getChild(n,0))),
                   AST_FUNCTION_TANH = tanh(evalAST(ASTNode_getChild(n,0))),
                   AST_LOGICAL_AND = ((evalAST(ASTNode_getChild(n,0))) && (evalAST(ASTNode_getChild(n,1)))),
                   AST_LOGICAL_NOT = (!(evalAST(ASTNode_getChild(n,0)))),
                   AST_LOGICAL_OR = ((evalAST(ASTNode_getChild(n,0))) || (evalAST(ASTNode_getChild(n,1)))),
                   AST_LOGICAL_XOR = ((!(evalAST(ASTNode_getChild(n,0))) && (evalAST(ASTNode_getChild(n,1))))
                                      || ((evalAST(ASTNode_getChild(n,0))) &&  !(evalAST(ASTNode_getChild(n,1))))),
                   AST_RELATIONAL_EQ = ((evalAST(ASTNode_getChild(n,0))) == (evalAST(ASTNode_getChild(n,1)))),
                   AST_RELATIONAL_GEQ = ((evalAST(ASTNode_getChild(n,0))) >= (evalAST(ASTNode_getChild(n,1)))),
                   AST_RELATIONAL_GT = ((evalAST(ASTNode_getChild(n,0))) > (evalAST(ASTNode_getChild(n,1)))),
                   AST_RELATIONAL_LEQ = ((evalAST(ASTNode_getChild(n,0))) <= (evalAST(ASTNode_getChild(n,1)))),
                   AST_RELATIONAL_LT = ((evalAST(ASTNode_getChild(n,0))) < (evalAST(ASTNode_getChild(n,1)))),
                   0)
  return (result)
}

# example
line = 2 + 3 * 4
n = parseFormula(line)
result = evalAST(n)
cat("\n",formulaToString(n),"\n= ",result,"\n\n")
