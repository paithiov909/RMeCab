#' docNgram2
#'
#' Creates a data frame of N-grams out of all files in a given directory.
#'
#' @param directory directory in which text files are stored
#' or a single file.
#' @inheritParams rmecab-args-set
#' @inheritParams rmecab-args-pos
#' @inheritParams rmecab-args-minFreq
#' @inheritParams rmecab-args-weight
#' @inheritParams rmecab-args-kigo
#' @inheritParams rmecab-args-tagger
#' @returns A data.frame is invisibly returned.
#' @export
#' @examples
#' \dontrun{
#' text_dir <- system.file("samples", package = "RMeCab")
#' out <- docNgram2(text_dir, type = 1)
#' head(out)
#' }
docNgram2 <- function(directory,
                      type = 0,
                      pos = "Default",
                      minFreq = 1,
                      N = 2,
                      kigo = 0,
                      weight = "no",
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
    stop("N argument  must be equal to or larger than 2")
  }
  opt <- getOptChr(dic, mecabrc, etc)

  dtm <- .Call(
    docNgram2_impl,
    as.character(directory),
    as.character(file),
    as.numeric(fileN),
    as.integer(ft),
    as.integer(type),
    as.character(pos),
    as.integer(posN),
    as.integer(minFreq),
    as.integer(N),
    as.integer(kigo),
    as.character(opt),
    PACKAGE = "RMeCab"
  )

  if (weight == "no" || weight == "") {
    return(invisible(t(dtm)))
  } else {
    argW <- unlist(strsplit(weight, "*", fixed = TRUE))

    for (i in seq_along(argW)) {
      dtm <- t(dtm)

      if (argW[i] == "tf") {
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
}
