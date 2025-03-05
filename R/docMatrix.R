#' docMatrix
#'
#' Creates a document-term matrix out of all files in a given directory.
#' Each cell of the matrix shows the actual frequency of each word.
#'
#' @param mydir A directory where text files are stored.
#' @inheritParams rmecab-args-pos
#' @inheritParams rmecab-args-minFreq
#' @inheritParams rmecab-args-weight
#' @inheritParams rmecab-args-kigo
#' @inheritParams rmecab-args-co
#' @inheritParams rmecab-args-tagger
#' @returns An integer matrix is invisibly returned.
#' @export
#' @examples
#' \dontrun{
#' text_dir <- system.file("samples", package = "RMeCab")
#' out <- docMatrix(text_dir)
#' head(out)
#' }
docMatrix <- function(mydir,
                      pos = "Default",
                      minFreq = 1,
                      weight = "no",
                      kigo = 0,
                      co = 0,
                      dic = "",
                      mecabrc = "",
                      etc = "") {
  if (any(pos == "" | is.na(pos))) {
    stop("specify pos argument!")
  }
  if (length(pos) == 1 && pos == "Default") {
    posN <- 0
  } else {
    posN <- length(pos)
  }
  if (is.null(mecabrc) || is.na(mecabrc) || (nchar(mecabrc)) < 2) {
    mecabrc <- ""
  } else {
    # 2015 12 11
    mecabrc <- paste(dirname(mecabrc), basename(mecabrc), sep = "/")
  }

  weight <- weight
  dummy <- lapply(
    dir(mydir, full.names = TRUE),
    docVector,
    pos, posN, minFreq, kigo, dic, mecabrc, etc
  )

  if (length(dummy) == 0) {
    stop("no doc-matrix returned.")
  } else if (length(dummy) == 1) {
    return(invisible(dummy))
  }

  dtm <- t(xtabs(Freq ~ ., data = do.call("rbind", dummy)))
  if (co == 1 || co == 2 || co == 3) {
    dtm <- coOccurrence(removeInfo(dtm), co)
  }

  if ((weight == "" || weight == "no") && co == 0) {
    cat("Term Document Matrix includes 2 information rows!", "\n")
    cat("whose names are [[LESS-THAN-", minFreq, "]] and [[TOTAL-TOKENS]]", "\n", sep = "")
    cat("if you remove these rows, run", "\n", "result[ rownames(result) !=  \"[[LESS-THAN-", minFreq, "]]\" , ]", "\n", "result[ rownames(result) !=  \"[[TOTAL-TOKENS]]\" , ]", "\n", sep = "")
  } else {
    argW <- unlist(strsplit(weight, "*", fixed = T))

    for (i in seq_along(argW)) {
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
        if (i == 1) {
          dtm <- removeInfo(dtm)
        }
        dtm <- t(t(dtm) * mynorm(dtm))
      }
    }
    if (anyNA(dtm)) {
      cat("Warning! Term document matrix includes NA!", "\n")
    }
  }
  invisible(dtm)
}

#' @noRd
docVector <- function(filename, pos, posN, minFreq, kigo, dic = "", mecabrc = "", etc = "") {
  if (!file.exists(filename)) {
    stop("file not found")
  }
  if (kigo != 0 && kigo != 1) {
    kigo <- 0
  }
  if (minFreq < 0) {
    minFreq <- 1
  }
  if (is.null(mecabrc) || is.na(mecabrc) || (nchar(mecabrc)) < 2) {
    mecabrc <- ""
  }

  dummy <- RMeCabMx(filename, pos, posN, minFreq, kigo, dic, mecabrc, etc)
  if (length(dummy) < 1) {
    return(NULL)
  } else {
    return(
      data.frame(
        docs = basename(filename),
        terms = names(dummy),
        Freq = as.vector(dummy),
        row.names = NULL
      )
    )
  }
  # return(NULL)
}

#' @noRd
RMeCabMx <- function(filename, pos, posN, minFreq = 1, kigo = 0, dic = "", mecabrc = "", etc = "") {
  if (!file.exists(filename)) {
    stop("file not found")
  }
  if (length(pos) < 1) {
    stop("second argument must be specified.")
  }
  opt <- getOptChr(dic, mecabrc, etc)

  .Call(
    RMeCabMx_impl,
    as.character(filename),
    pos, as.integer(posN),
    as.integer(minFreq),
    as.integer(kigo),
    as.character(opt),
    PACKAGE = "RMeCab"
  )
}
