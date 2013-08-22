libsbmlwrapper
==============

A wrapper for SWIG generated R bindings for libSBML

libsbmlwrapper can be installed from from github using the devtools package:
```r
install.packages("devtools")
library(devtools)
install_github("libsbmlwrapper", "jwcasement", subdir="package")
```

Note Windows users have to first install [Rtools](http://cran.rstudio.com/bin/windows/Rtools/).

Getting Started
---------------

To get started, load the package:
```r
library(libsbmlwrapper)
```

The package contains a number of demonstrations of functionality. To see the list of demos, use:
```r
demo(package = "libsbmlwrapper")
```


