#' RMeCabText
#'
#' Takes a file as an argument and tokenize it into
#' a list of terms and parts of speech.
#'
#' @param filename An input file
#' @inheritParams rmecab-args-tagger
#' @return A list.
#' @export
#' @examples
#' \dontrun{
#' text_file <- system.file("samples/doc1.txt", package = "RMeCab")
#' RMeCabText(text_file)
#' }
RMeCabText <- function(filename, dic = "", mecabrc = "", etc = "") {
  if (!file.exists(filename)) {
    stop("file not found")
  }
  if (file.info(filename)$isdir) {
    stop("this is directory. Please input file name")
  }
  opt <- getOptChr(dic, mecabrc, etc)

  .Call(
    RMeCabText_impl,
    as.character(filename),
    as.character(opt),
    PACKAGE = "RMeCab"
  )
}
