#' @noRd
coOccurrence <- function(dtm, co) {
  cat("now making co-occurrence matrix: this may cost time!\n")

  # 行名のタームに対して，列名のタームが出現した回数
  ## 左右対称行列ではない
  if (co == 3) {
    y <- diag(rowSums(dtm))
    colnames(y) <- rownames(y) <- rownames(dtm)
    for (i in 1:(nrow(dtm) - 1)) {
      for (j in nrow(dtm):2) {
        if (i == j) break
        y[i, j] <- sum(dtm[j, dtm[i, ] > 0])
        y[j, i] <- sum(dtm[i, dtm[j, ] > 0])
      }
    }
    y

  } else if (co == 1 || co == 2) {
    ## 行名のタームと列名のタームが共起した回数
    ## 左右対称行列である
    y <- crossprod(t(dtm > 0))

    if (co == 1) {
      y
    } else {
      ### 行名のタームと列名のタームが共起したか否か
      ## 左右対称行列である
      y[y > 0] <- 1
      y
    }
  }
}
