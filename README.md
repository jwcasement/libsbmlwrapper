libsbmlwrapper
==============

A wrapper for SWIG generated R bindings for libSBML.

The package enables SBML documents to be viewed and edited within R.

libsbmlwrapper can be installed from from GitHub using the devtools package:
```r
install.packages("devtools")
library(devtools)
install_github("libsbmlwrapper", "jwcasement", subdir="package")
```

Note: Windows users have to first install [Rtools](http://cran.rstudio.com/bin/windows/Rtools/).

Getting Started
---------------

libsbmlwrapper requires libSBML, available from [SourceForge](http://sourceforge.net/projects/sbml/) (automatic download [here](http://sourceforge.net/projects/sbml/files/libsbml/5.5.0/experimental/binaries/r-bindings/windows/libSBML_5.5.0.zip/download)).

Then load the package:
```r
library(libsbmlwrapper)
```

The package contains a number of demonstrations of functionality. To see the list of demos, use:
```r
demo(package = "libsbmlwrapper")
```


