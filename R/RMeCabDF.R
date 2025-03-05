#' RMeCabDF
#'
#' Takes a data frame as an argument and tokenize it into
#' a length-1 lists of term.
#'
#' @details
#' This is a wrapper of [RMeCabC()].
#' Any blanks should be replaced with `NA` for `coln`.
#'
#' @param dataf A data.frame.
#' @param coln Column number or name which include the text to analyze
#' @inheritParams rmecab-args-mypref
#' @inheritParams rmecab-args-tagger
#' @returns A list.
#' @export
RMeCabDF <- function(dataf, coln,
                     mypref = 0,
                     dic = "",
                     mecabrc = "",
                     etc = "") {
  if (!is.data.frame(dataf)) {
    stop("the first argument must be a data frame!")
  }
  kekka <- list(length(dataf[, coln, drop = TRUE]))
  for (i in seq_along(dataf[, coln, drop = TRUE])) {
    if (is.na(dataf[i, coln, drop = TRUE]) || dataf[i, coln, drop = TRUE] == "") {
      kekka[[i]] <- NA_character_
    } else {
      kekka[[i]] <- unlist(RMeCabC(dataf[i, coln, drop = TRUE], mypref, dic, mecabrc, etc))
    }
  }
  return(kekka)
}
#
