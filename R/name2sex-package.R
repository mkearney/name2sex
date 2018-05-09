#' @keywords internal
"_PACKAGE"

.onAttach <- function(libname, pkgname) {
  if (!requireNamespace("genderdata", quietly = TRUE)) {
    install.packages(
      "genderdata",
      type = "source",
      repos = "http://packages.ropensci.org"
    )
  }
}
