#' @noRd
getOptChr <- function(dic, mecabrc, etc) {
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
  paste(dic, mecabrc, etc)
}
