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
#' @returns An integer matrix.
#' @export
docMatrix <- function(mydir, pos = "Default", minFreq = 1, weight = "no", kigo = 0, co = 0, dic = "", mecabrc = "", etc = "") {
  ##                                       #  gc()
  ##     if("記号" %in% pos){
  ##       kigo = 1
  ##     }
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

  ## if( is.null(dic) || is.na(dic)){
  ##   dic = ""
  ## } else if( (xl <- nchar(dic))  > 0 ) {
  ##   if (substring(dic, xl-3) != ".dic" || !(file.exists(dic)) )
  ##     {
  ##      cat ("dictionary file not found; no dic file specified.\n")
  ##      dic = ""
  ##    }
  ##   else {
  ##     dic <- paste(" -u", dic)
  ##   }
  ## }

  weight <- weight
  dummy <- lapply(dir(mydir, full.names = TRUE), docVector, pos, posN, minFreq, kigo, dic, mecabrc, etc)
  # cat("\n")
  if (length(dummy) == 0) {
    #    gc()
    stop("no doc-matrix returned.")
  } else if (length(dummy) == 1) {
    return(dummy)
  }


  dtm <- t(xtabs(Freq ~ ., data = do.call("rbind", dummy)))
  if (co == 1 || co == 2 || co == 3) {
    dtm <- coOccurrence(removeInfo(dtm), co)
    ##     invisible(dtm)
  }

  #  environment(dtm) = new.env()
  ## ##   class(dtm) <- "RMeCabMatrix"

  ##   ######### < 2008 05 04 uncommented>
  ##   ######### < 2009 03 06>
  if ((weight == "" || weight == "no") && co == 0) {
    cat("Term Document Matrix includes 2 information rows!", "\n")
    cat("whose names are [[LESS-THAN-", minFreq, "]] and [[TOTAL-TOKENS]]", "\n", sep = "")
    cat("if you remove these rows, run", "\n", "result[ rownames(result) !=  \"[[LESS-THAN-", minFreq, "]]\" , ]", "\n", "result[ rownames(result) !=  \"[[TOTAL-TOKENS]]\" , ]", "\n", sep = "")
  } else {
    argW <- unlist(strsplit(weight, "*", fixed = T))

    for (i in 1:length(argW)) {
      ## if(nchar (argW[i]) < 2 ){#if(argW[i] == ""){
      ##           break
      ##         }else
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
          # dtm <- sweep(localTF(m), 2, globalNorm(m), "*")
          dtm <- removeInfo(dtm)
        }
        dtm <- t(t(dtm) * mynorm(dtm))
      }
    }

    ##   ############# < 2008 05 04 uncommented>

    ## ##   ### ########## < 2008 05 04 commented>
    ##   if(weight == "tf*idf"){
    ##     dtm <- localTF(dtm) * globalIDF(dtm)
    ##   }else if(weight == "tf*idf*norm") {
    ##     #dtm <- localTF(dtm)  * globalIDF(dtm) * globalNorm(dtm)
    ##     tmp <- localTF(dtm)  * globalIDF(dtm)
    ##     #dtm <- sweep(tmp, 2, mynorm(tmp), "*")
    ##      dtm <- t(t(tmp) * mynorm(tmp))
    ##   } else{
    ##   ##     class(dtm) <-  "docMatrix"
    ##   ## c("docMatrix", "xtabs", "table")
    ##   ##     return ( dtm )
    ##      invisible( dtm)
    ##   }
    ##   ### #############</ 2008 05 04 commented>

    ##  class(dtm) <-  "docMatrix"
    ## c("docMatrix", "xtabs", "table")
    ##   return ( dtm )
    if (any(is.na(dtm))) {
      cat("Warning! Term document matrix includes NA!", "\n")
    }
  }
  invisible(dtm)
}

#' @noRd
docVector <-
  function(filename, pos, posN, minFreq, kigo, dic = "", mecabrc = "", etc = "") {
    if (!file.exists(filename)) {
      stop("file not found")
    }
    # posN <- length(pos)
    if (kigo != 0 && kigo != 1) {
      kigo <- 0
    }
    if (minFreq < 0) {
      minFreq <- 1
    }

    if (is.null(mecabrc) || is.na(mecabrc) || (nchar(mecabrc)) < 2) {
      mecabrc <- ""
    } else {
      # 2015 12 11         mecabrc <- paste(dirname(mecabrc), basename(mecabrc), sep = "/")
    }


    dummy <- RMeCabMx(filename, pos, posN, minFreq, kigo, dic, mecabrc, etc)
    if (length(dummy) < 1) {
      return(NULL)
    } else {
      return(data.frame(docs = basename(filename), terms = names(dummy), Freq = as.vector(dummy), row.names = NULL))
    }
    return(NULL)
  }

#' @noRd
RMeCabMx <-
  function(filename, pos, posN, minFreq = 1, kigo = 0, dic = "", mecabrc = "", etc = "") { #  sym = 0, kigo = "記号"

    if (!file.exists(filename)) {
      stop("file not found")
    }
    if (length(pos) < 1) {
      stop("second argument must be specified.")
    }
    ##    if(posN != length(pos)){
    ##      posN = length(pos)
    ##    }
    ## #   gc()


    if (is.null(dic) || is.na(dic)) {
      dic <- ""
    } else if (nchar(dic) > 0) {
      dic <- paste(dirname(dic), basename(dic), sep = "/")
      if (!(file.exists(dic))) {
        cat("specified dictionary file not found; result by default dictionary.\n")
        dic <- ""
      } else {
        dic <- paste(" -u", dic)
      }
    }
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

    opt <- paste(dic, mecabrc, etc)


    # cat("* ")
    .Call(RMeCabMx_impl, as.character(filename), pos, as.integer(posN), as.integer(minFreq), as.integer(kigo), as.character(opt), PACKAGE = "RMeCab")
  }
