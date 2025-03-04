#' RMeCabFreq
#'
#' Takes text files as first argument
#' and returns parts of speech and frequencies as a data.frame.
#'
#' @param filename an input file.
#' @inheritParams rmecab-args-tagger
#' @returns A data.frame.
#' @export
RMeCabFreq <- function(filename, dic = "", mecabrc = "", etc = "") {
  if (!file.exists(filename)) {
    stop("file not found")
  }
  if (file.info(filename)$isdir) {
    stop("this is directory. Please input file name")
  }
  opt <- getOptChr(dic, mecabrc, etc)

  .Call(
    RMeCabFreq_impl,
    as.character(filename),
    as.character(opt),
    PACKAGE = "RMeCab"
  )
}
