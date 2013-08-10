#' A barplot for a _p_Model object
#' 
#' Displays a barplot illustrating numbers of components within the model 
#' 
#' @title Barplot
#' @param height a _p_Model object
#' @docType methods
#' @rdname barplot-methods
#' @exportMethod barplot
#' @aliases barplot,_p_Model,ANY-method
#' @aliases barplot,_p_Model-method
setMethod("barplot", signature(height = "_p_Model"),
          function(height, ...) {
            
            #provide defaults for xlab and main
            xlabel = "Number in Model"
            plotTitle = paste("Components of", Model_getId(height))
            
            #get bar heights
            bars = summary(height)$Components
            #filter out absent components
            barsFiltered = bars[bars>0]
            
            #get current margin settings
            old_par = par(no.readonly=TRUE)$mar
            #adjust left margin to accommodate text
            par(mar = c(5.1,8.2,4,2))
            
            defaults = list(xlab = xlabel, main = plotTitle)
            
            args = modifyList(defaults, list(height = rev(barsFiltered), horiz = TRUE, 
                                             las = 1, ...))
            
            do.call("barplot", args)
            
            #restore old margins
            par(mar = old_par)
            
          }
)