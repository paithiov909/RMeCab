#' Check if any mcabrc file exists
#'
#' @details
#' This is a helper function that checks if any mecabrc file exists
#' before initializing tagger.
#'
#' MeCab expects a mecabrc file to be present;
#' if not, it will raise an error (without any message!).
#'
#' @returns A logical.
#' @export
anyRcfileExists <- function() {
  if (Sys.getenv("MECABRC") != "") {
    return(TRUE)
  } else if (file.exists(path.expand("~/.mecabrc"))) {
    return(TRUE)
  }
  # NOTE: this check is not complete. the actual default rc path may be different.
  switch(.Platform$OS.type,
    "windows" = file.exists("C:/PROGRA~1/mecab/etc/mecabrc"),
    "unix" = (file.exists("/etc/mecabrc") ||
              file.exists("/usr/local/etc/mecabrc"))
  )
}

#' @noRd
getOptChr <- function(dic, mecabrc, etc) {
  # FIXME: these checks would fail if argument is not 1-length.
  if (is.null(dic) || is.na(dic)) {
    dic <- ""
  } else if (nchar(dic) > 0) {
    dic <- paste(dirname(dic), basename(dic), sep = "/")
    if (!(file.exists(dic))) {
      cat("specified dictionary file not found; result by default dictionary.\n")
      dic <- ""
    } else {
      dic <- paste(" -u", dic)
    }
  }

  if (is.null(mecabrc) || is.na(mecabrc) || (nchar(mecabrc)) < 2) {
    mecabrc <- ""
  } else {
    # 2015 12 11
    mecabrc <- paste(dirname(mecabrc), basename(mecabrc), sep = "/")
    if (!(file.exists(mecabrc))) {
      cat("specified mecabrc not found; result by default mecabrc.\n")
      mecabrc <- ""
    } else {
      mecabrc <- paste("-r", mecabrc)
    }
  }
  if (mecabrc == "" && !anyRcfileExists()) {
    cat("there would be no mecabrc file available; MeCab might raise an error.\n")
  }

  paste(dic, mecabrc, etc)
}
