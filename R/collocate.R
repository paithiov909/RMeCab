#' collocate
#'
#' Finds collocations from the specified text file.
#' Takes a `node` word and a window `span` as arguments.
#'
#' @param filename An input file.
#' @param node Node word.
#' @param span Windows span. Defaults to `3`.
#' @inheritParams rmecab-args-tagger
#' @returns A data.frame.
#' @export
collocate <- function(filename,
                      node,
                      span = 3,
                      dic = "",
                      mecabrc = "",
                      etc = "") {
  if (!file.exists(filename)) {
    stop("file not found")
  }
  if (file.info(filename)$isdir) {
    stop("this is directory. Please input file name")
  }
  if (missing(node)) {
    stop("second argumet must be specified")
  }
  opt <- getOptChr(dic, mecabrc, etc)

  ret <- .Call(
    collocate_impl,
    as.character(filename),
    as.character(node),
    as.numeric(span),
    as.character(opt),
    PACKAGE = "RMeCab"
  )
  class(ret) <- c("RMeCab_collocation", class(ret))
  ret
}
