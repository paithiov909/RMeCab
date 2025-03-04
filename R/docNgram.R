#' docNgram
#'
#' Creates a data.frame of N-gram out of all files in a given directory.
#'
#' @param mydir A directory where text files are stored.
#' @inheritParams rmecab-args-set
#' @inheritParams rmecab-args-pos
#' @inheritParams rmecab-args-tagger
#' @returns A data.frame is invisibly returned.
#' @export
docNgram <- function(mydir,
                     type = 1,
                     N = 2,
                     pos = "Default",
                     dic = "",
                     mecabrc = "",
                     etc = "") {
  if (type > 0 && (any(pos == "" | is.na(pos)))) {
    stop("specify pos argument!")
  }

  dummy <-
    lapply(
      dir(mydir, full.names = TRUE),
      makeNgram,
      type, N, pos, dic, mecabrc, etc
    )

  if (length(dummy) == 0) {
    stop("no doc-matrix returned.")
  } else if (length(dummy) == 1) {
    return(invisible(dummy))
  }

  dtm <- xtabs(Freq ~ ., data = do.call("rbind", dummy))
  invisible(dtm)
}

#' @noRd
makeNgram <- function(filename,
                      type = 1,
                      N = 2,
                      pos = "Default",
                      dic = "",
                      mecabrc = "",
                      etc = "") {
  # NOTE: differs from others.
  if (is.null(mecabrc) || is.na(mecabrc) || (nchar(mecabrc)) < 2) {
    mecabrc <- ""
  } else {
    # 2015 12 11
    mecabrc <- paste(dirname(mecabrc), basename(mecabrc), sep = "/")
  }

  dummy <- Ngram(filename, type, N, pos, dic, mecabrc, etc)
  dummy$Text <- rep_len(basename(filename), length(dummy$Freq))
  if (length(dummy) < 1) {
    return(NULL)
  } else {
    return(dummy)
  }
}
