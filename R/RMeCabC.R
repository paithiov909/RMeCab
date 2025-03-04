#' RMeCabC
#'
#' Takes a string as an argument and tokenize it into
#' a length-1 lists of term.
#'
#' @param str A string scalar to be tokenized.
#' @inheritParams rmecab-args-mypref
#' @inheritParams rmecab-args-tagger
#' @return A list.
#' @export
RMeCabC <-
  function(str, mypref = 0, dic = "", mecabrc = "", etc = "") {
    #   gc()
    if (!is.character(str)) {
      str <- as.character(str)
    }

    if (nchar(str) < 1) {
      stop("first argument must be specified")
    }

    if (is.null(dic) || is.na(dic)) {
      dic <- ""
    } else if (nchar(dic) > 0) {
      dic <- paste(dirname(dic), basename(dic), sep = "/")
      if (!(file.exists(dic))) {
        cat("specified dictionary file not found; result by default dictionary.\n")
        dic <- ""
      } else {
        dic <- paste("-u", dic)
      }
    }
    #
    if (is.null(mecabrc) || is.na(mecabrc) || (nchar(mecabrc)) < 2) {
      mecabrc <- ""
    } else {
      # 2015 12 11
      mecabrc <- paste(dirname(mecabrc), basename(mecabrc), sep = "/")
      if (!(file.exists(mecabrc))) {
        cat("specified mecabrc not found; result by default mecabrc.\n")
        mecabrc <- ""
      } else {
        mecabrc <- paste("-r", mecabrc)
      }
    }
    #
    opt <- paste(dic, mecabrc, etc)

    ret <- .Call(RMeCabC_impl, as.character(str), as.integer(mypref), as.character(opt), PACKAGE = "RMeCab")
    # Encoding(ret) <- "UTF-8"
    return(ret)
  }
