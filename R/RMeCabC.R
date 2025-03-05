#' RMeCabC
#'
#' Takes a string as an argument and tokenize it into
#' a length-1 lists of term.
#'
#' @param str A string scalar to be tokenized.
#' @inheritParams rmecab-args-mypref
#' @inheritParams rmecab-args-tagger
#' @return A list.
#' @export
#' @examples
#' \dontrun{
#' text <- scan(
#'   system.file("samples/doc1.txt", package = "RMeCab"),
#'   what = character()
#' )
#' unlist(RMeCabC(text))
#' }
RMeCabC <- function(str,
                    mypref = 0,
                    dic = "",
                    mecabrc = "",
                    etc = "") {
  if (missing(str)) {
    stop("first argument must be specified")
  }
  opt <- getOptChr(dic, mecabrc, etc)

  .Call(
    RMeCabC_impl,
    as.character(str),
    as.integer(mypref),
    as.character(opt),
    PACKAGE = "RMeCab"
  )
}
