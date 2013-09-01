.onAttach <- function(...) {
  #create a global variable to store setter and getter functions for defaults
  assign("pkg_globals", new.env(), envir = globalenv())
  assign("defs", set_and_get_defaults(), pkg_globals)
  assign("doc_level", 0, pkg_globals)
  assign("doc_version", 0, pkg_globals)
}
