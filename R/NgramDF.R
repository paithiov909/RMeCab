#' NgramDF
#'
#' Returns a data frame of N-gram.
#'
#' @param filename An input file.
#' @inheritParams rmecab-args-set
#' @inheritParams rmecab-args-pos
#' @inheritParams rmecab-args-tagger
#' @returns A data.frame.
#' @export
#' @examples
#' \dontrun{
#' text_file <- system.file("samples/doc1.txt", package = "RMeCab")
#' out <- NgramDF(text_file, type = 1)
#' head(out)
#' }
NgramDF <- function(filename,
                    type = 0,
                    N = 2,
                    pos = "Default",
                    dic = "",
                    mecabrc = "",
                    etc = "") {
  if (!file.exists(filename)) {
    stop("file not found")
  }
  if (file.info(filename)$isdir) {
    stop("this is directory. Please input file name")
  }
  if (type != 0 && type != 1 && type != 2) {
    stop("type must be 0 or 1 or 2")
  }
  if (type > 0 && (any(pos == "" | is.na(pos)))) {
    stop("specify pos argument!")
  }
  if (length(pos) == 1 && pos == "Default") {
    posN <- 0
  } else {
    posN <- length(pos)
  }
  if (N < 2) {
    stop("N argument  must be equal to or larger than 2")
  }
  opt <- getOptChr(dic, mecabrc, etc)

  .Call(
    NgramDF_impl,
    as.character(filename),
    as.integer(type),
    as.integer(N),
    as.character(pos),
    as.integer(posN),
    as.character(opt),
    PACKAGE = "RMeCab"
  )
}
