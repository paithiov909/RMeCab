#' NgramDF2
#'
#' Creates a data.frame of N-grams out of all files in a given directory.
#'
#' @param directory A directory in which text files are stored
#' or a single file.
#' @inheritParams rmecab-args-set
#' @inheritParams rmecab-args-kigo
#' @inheritParams rmecab-args-pos
#' @inheritParams rmecab-args-minFreq
#' @inheritParams rmecab-args-tagger
#' @return A data.frame is invisibly returned.
#' @export
#' @examples
#' if (anyRcfileExists()) {
#'   text_dir <- system.file("samples", package = "RMeCab")
#'   out <- NgramDF2(text_dir, type = 1)
#'   head(out)
#' }
NgramDF2 <- function(directory,
                     type = 0,
                     pos = "Default",
                     minFreq = 1,
                     N = 2,
                     kigo = 0,
                     dic = "",
                     mecabrc = "",
                     etc = "") {
  posN <- length(pos)
  if (any(suppressWarnings(dir(directory)) > 0)) {
    ft <- 1 ## ディレクトリが指定された
    file <- dir(directory)
  } else if (file.exists(directory)) {
    ft <- 0 # 単独ファイル
    file <- basename(directory)
    directory <- dirname(directory)
  } else {
    stop("specify directory or a file!")
  }
  fileN <- length(file)

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
  if (minFreq < 1) {
    stop("minFreq argument must be equal to or larger than 1 ")
  }
  if (N < 2) {
    stop("N argument must be equal to or larger than 2")
  }
  opt <- getOptChr(dic, mecabrc, etc)

  dtm <- .Call(
    NgramDF2_impl,
    as.character(directory),
    as.character(file),
    as.numeric(fileN),
    as.integer(ft),
    as.integer(type),
    as.character(pos),
    as.integer(posN),
    as.integer(minFreq),
    as.integer(N),
    as.numeric(kigo),
    as.character(opt),
    PACKAGE = "RMeCab"
  )
  invisible(dtm)
}
