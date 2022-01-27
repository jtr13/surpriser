.onAttach <- function(libname, pkgname) {
  packageStartupMessage("This package requires gmailr to be set up. See: https://github.com/r-lib/gmailr")
}
