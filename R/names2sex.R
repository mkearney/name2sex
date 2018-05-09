
trim_ws <- function(x) {
  x <- gsub("\\s{2,}", " ", x)
  gsub("^\\s|\\s$", "", x)
}


#' Convert full name string to first name
#'
#' Parses full names vector into first names vector
#'
#' @param x A character vector of full names (each full name is a string)
#' @return A vector of first names
#' @export
full2first <- function(x) {
  ## trim white space
  x <- trim_ws(x)
  ## remove prefixes
  x <- gsub("^(dr|mr|ms|mrs)\\.?\\s", "", x, ignore.case = TRUE)
  ## if comma (last name), remove everything before comma
  comma <- grepl("^\\S+\\,\\s\\S+", x)
  x[comma] <- sub(".*\\,\\s", "", x[comma])
  ## parse first word
  x <- gsub("\\s.*", "", x)
  ## trim white space just in case
  x <- trim_ws(x)
  ## if empty, set to NA
  x[x == ""] <- NA_character_
  x
}

#' Convert names to sex estimates
#'
#' Takes first names (input) and looks up percent female/male using national
#' data from the Social Security Administration
#'
#' @param nm Vector of first names
#' @return A data frame with names, percent female, and sex variables
#' @export
names2sex <- function(nm) UseMethod("names2sex")

#' @export
names2sex.character <- function(nm) {
  ## validate input
  stopifnot(is.character(nm))
  ## filter sex data using input names
  x <- sexdat$f_pct[match(nm, sexdat$name)]
  ## add names
  names(x) <- nm
  ## return estimates
  x
}

#' @export
names2sex.factor <- function(nm) {
  nm <- as.character(nm)
  names2sex(nm)
}

#' @export
names2sex.data.frame <- function(nm) {
  if (any(grepl("^first.?name$", names(nm), ignore.case = TRUE))) {
    nm <- nm[[grep("^first.?name$", names(nm), ignore.case = TRUE)[1]]]
  } else if (any(grepl("^first$", names(nm), ignore.case = TRUE))) {
    nm <- nm[[grep("^first$", names(nm), ignore.case = TRUE)[1]]]
  } else if (any(grepl("^name.?first$", names(nm), ignore.case = TRUE))) {
    nm <- nm[[grep("^name.?first$", names(nm), ignore.case = TRUE)[1]]]
  }
  names2sex(nm)
}

