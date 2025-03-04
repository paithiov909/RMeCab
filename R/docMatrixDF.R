#' docMatrixDF
#'
#' Creates a document-term matrix out of a character vector.
#' Each cell of the matrix shows the actual frequency of each word.
#'
#' @param charVec A character vector.
#' @inheritParams rmecab-args-pos
#' @inheritParams rmecab-args-minFreq
#' @inheritParams rmecab-args-weight
#' @inheritParams rmecab-args-co
#' @inheritParams rmecab-args-tagger
#' @returns An integer matrix is invisibly returned.
#' @export
docMatrixDF <- function(charVec = c("MeCab", "CaBoCha"),
                        pos = "Default",
                        minFreq = 1,
                        weight = "no",
                        co = 0,
                        dic = "",
                        mecabrc = "",
                        etc = "") {
  charLeng <- length(charVec)
  if (charLeng < 1) {
    stop("character vector must be specified.")
  }
  if (any(pos == "" | is.na(pos))) {
    stop("specify pos argument!")
  }
  if (length(pos) == 1 && pos == "Default") {
    posN <- 0
  } else {
    posN <- length(pos)
  }
  if (minFreq < 1) {
    stop("minFreq > 0 must be specified.")
  }
  opt <- getOptChr(dic, mecabrc, etc)

  dtm <- .Call(
    docMatrixDF_impl,
    as.character(charVec),
    as.numeric(charLeng),
    pos,
    as.numeric(posN),
    as.numeric(minFreq),
    as.character(opt),
    PACKAGE = "RMeCab"
  )

  if (is.null(dtm)) {
    stop("give less number to minFreq!")
  }

  dtm <- t(dtm)
  if (co == 1 || co == 2 || co == 3) {
    dtm <- coOccurrence(removeInfo(dtm), co)
  }
  if (weight == "") {
    return(invisible(dtm))
  }
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
  invisible(dtm)
}
