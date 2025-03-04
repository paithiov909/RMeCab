#' docNgramDF
#'
#' Creates a data.frame of N-grams out of a character vector.
#'
#' @param mojiVec A character vector.
#' @param baseform Genkei. See [docDF()]. Defaults to `0`.
#' @inheritParams rmecab-args-set
#' @inheritParams rmecab-args-pos
#' @inheritParams rmecab-args-minFreq
#' @inheritParams rmecab-args-weight
#' @inheritParams rmecab-args-co
#' @inheritParams rmecab-args-kigo
#' @inheritParams rmecab-args-tagger
#' @returns A data frame is invisibly returned.
#' @export
docNgramDF <- function(mojiVec = "MeCab",
                       type = 0,
                       pos = "Default",
                       baseform = 0,
                       minFreq = 1,
                       N = 1,
                       kigo = 0,
                       weight = "no",
                       co = 0,
                       dic = "",
                       mecabrc = "",
                       etc = "") {
  rowN <- length(mojiVec)
  if (rowN < 1) {
    stop("character vector must be specified.")
  }
  if (type != 0 && type != 1) {
    stop("type must be 0 (character) or 1 (word)")
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
  if (N < 1) {
    stop("N argument  must be equal to or larger than 1")
  }

  opt <- getOptChr(dic, mecabrc, etc)
  dtm <- .Call(
    docNgramDF_impl,
    as.character(mojiVec),
    as.numeric(rowN),
    as.integer(type),
    as.character(pos),
    as.integer(posN),
    as.integer(minFreq),
    as.integer(N),
    kigo = 0,
    as.character(opt),
    PACKAGE = "RMeCab"
  )

  if (type == 1 && (co == 1 || co == 2 || co == 3)) {
    dtm <- coOccurrence(removeInfo(dtm), co)
  }
  if (weight == "no" || weight == "") {
    return(invisible(dtm))
  } else {
    # NOTE: NOT require to transpose
    argW <- unlist(strsplit(weight, "*", fixed = TRUE))

    for (i in seq_along(argW)) {
      if (argW[i] == "tf") {
        dtm <- localTF(dtm)
      } else if (argW[i] == "tf2") {
        dtm <- localLogTF(dtm)
      } else if (argW[i] == "tf3") {
        dtm <- localBin(dtm)
      } else if (argW[i] == "idf") {
        dtm <- dtm * globalIDF(dtm, tp = 1)
      } else if (argW[i] == "idf2") {
        dtm <- dtm * globalIDF2(dtm, tp = 1)
      } else if (argW[i] == "idf3") {
        dtm <- dtm * globalIDF3(dtm, tp = 1)
      } else if (argW[i] == "idf4") {
        dtm <- dtm * globalEntropy(dtm, tp = 1)
      } else if (argW[i] == "norm") {
        dtm <- dtm * mynorm(dtm, tp = 1)
      }
    }
    if (any(is.na(dtm))) {
      cat("Warning! Term document matrix includes NA!", "\n")
    }
  }
  invisible(dtm)
}
