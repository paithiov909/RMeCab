#' collScores
#'
#' Calculates T-score and MI-score according to the result of [collocate].
#'
#' @param kekka Result of [collocate()].
#' @param node Node word.
#' @param span Window span.
#' @returns A data frame.
#' @export
collScores <- function(kekka, node, span = 0) {
  ## @Book{barnbrook96:_languag_comput,
  ##   author =		 {Geoff Barnbrook},
  ##   title = 		 {Language and Computers},
  ##   publisher = 	 {Edinburgh},
  ##   year = 		 1996
  ## }

  ##   # kekka が collocate 関数の出力かどうかを判断する必要あり
  ##   # クラス設計完成させるまでは以下でごまかし
  if (!is.data.frame(kekka) || (num2 <- which(kekka$Term == "[[MORPHEMS]]")) < 1) {
    stop("first argument must be result of collocate()")
  }
  if (nchar(node) < 1) {
    stop("second argument (node)  must be a node morpheme")
  }
  if (span == 0) {
    stop("third argument (span)  must be specified")
  }

  num1 <- which(kekka$Term == node) ## node の行数
  num3 <- which(kekka$Term == "[[TOKENS]]") ## 総語数の行数
  spanTokens <- span * 2 * kekka[num1, "Total"] ## node の出現回数 * span (前) * span (後)

  ##### T-scoore
  tscore <- (kekka[, "Span"] - (kekka[, "Total"] / kekka[num3, "Total"] * spanTokens)) / sqrt(kekka[, "Span"]) # (実測値 - 共起語が span に出現する期待値) / 実測値の平方根 ## Barbnrook p.93, p.97
  tscore[c(num1, num2, num3)] <- NA
  kekka$T <- tscore

  ##### MI-score
  mutual <- log2(kekka[, "Span"] / (kekka[, "Total"] / kekka[num3, "Total"] * spanTokens)) # (実測値/ 期待値)の対数
  mutual[c(num1, num2, num3)] <- NA
  kekka$MI <- mutual

  return(kekka)
}
