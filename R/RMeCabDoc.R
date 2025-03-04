#' RMeCabDoc
#'
#' Takes a file as an argument and tokenize it into
#' a list of term.
#'
#' @param filename An input file.
#' @inheritParams rmecab-args-mypref
#' @inheritParams rmecab-args-kigo
#' @inheritParams rmecab-args-tagger
#' @returns A list.
#' @export
RMeCabDoc <- function(filename,
                      mypref = 1,
                      kigo = 0,
                      dic = "",
                      mecabrc = "",
                      etc = "") {
  if (!file.exists(filename)) {
    stop("file not found")
  }
  opt <- getOptChr(dic, mecabrc, etc)

  .Call(
    RMeCabDoc_impl,
    as.character(filename),
    as.numeric(mypref),
    as.numeric(kigo),
    as.character(opt),
    PACKAGE = "RMeCab"
  )
}
