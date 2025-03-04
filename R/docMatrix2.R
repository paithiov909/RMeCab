#' docMatrix2
#'
#' Creates a document-term matrix out of all files in a given directory.
#' Each cell of the matrix shows the actual frequency of each word.
#'
#' @param directory A directory where text files are stored
#' or a single file.
#' @inheritParams rmecab-args-pos
#' @inheritParams rmecab-args-minFreq
#' @inheritParams rmecab-args-weight
#' @inheritParams rmecab-args-kigo
#' @inheritParams rmecab-args-co
#' @inheritParams rmecab-args-tagger
#' @returns An integer matrix is invisibly returned.
#' @export
docMatrix2 <- function(directory,
                       pos = "Default",
                       minFreq = 1,
                       weight = "no",
                       kigo = 0,
                       co = 0,
                       dic = "",
                       mecabrc = "",
                       etc = "") {
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
  if (any(pos == "" | is.na(pos))) {
    stop("specify pos argument!")
  }
  if (length(pos) == 1 && pos == "Default") {
    posN <- 0
  } else {
    posN <- length(pos)
  }
  if (minFreq < 1) {
    stop("minFreq argument must be equal to or larger than 1!")
  }

  opt <- getOptChr(dic, mecabrc, etc)

  dtm <- .Call(
    docMatrix2_impl,
    as.character(directory),
    as.character(file),
    as.numeric(fileN),
    as.numeric(ft),
    as.character(pos),
    as.numeric(posN),
    as.numeric(minFreq),
    as.numeric(kigo),
    as.character(opt),
    PACKAGE = "RMeCab"
  )

  if (is.null(dtm)) {
    stop("change the value of minFreq argument!")
  }
  dtm <- t(dtm)

  if (co == 1 || co == 2 || co == 3) {
    dtm <- coOccurrence(removeInfo(dtm), co)
  }

  if (weight == "") {
    return(invisible(dtm))
  } else {
    argW <- unlist(strsplit(weight, "*", fixed = TRUE))
    for (i in seq_along(argW)) {
      if (argW[i] == "no") {
        return(invisible(dtm))
      } else if (argW[i] == "tf") {
        dtm <- localTF(dtm)
      } else if (argW[i] == "tf2") {
        dtm <- localLogTF(dtm)
      } else if (argW[i] == "tf3") {
        dtm <- localBin(dtm)
      } else if (argW[i] == "idf") {
        dtm <- dtm * globalIDF(dtm)
      } else if (argW[i] == "idf2") {
        dtm <- dtm * globalIDF2(dtm)
      } else if (argW[i] == "idf3") {
        dtm <- dtm * globalIDF3(dtm)
      } else if (argW[i] == "idf4") {
        dtm <- dtm * globalEntropy(dtm)
      } else if (argW[i] == "norm") {
        dtm <- t(t(dtm) * mynorm(dtm))
      }
    }
    if (anyNA(dtm)) {
      cat("Warning! Term document matrix includes NA!", "\n")
    }
  }
  invisible(dtm)
}
