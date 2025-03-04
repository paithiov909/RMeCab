skip_on_cran()

# NOTE: Skipping tests for `RMeCabDF()`
test_that("RMeCabC works", {
  out <- unlist(RMeCabC("今日、私は数学の本を読んだ。"))
  expect_snapshot_value(out, style = "json2", cran = FALSE)
})

test_that("docMatrixDF works", {
  capture.output({
    out <- docMatrixDF("今日、私は数学の本を読んだ。")
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)
})

test_that("docDF works for a data frame", {
  dat <- data.frame(
    text = c(
      "今日、私は数学の本を読んだ。",
      "明日は英語の本を読む予定です。",
      "明後日は、また数学の本を読みます。"
    )
  )
  capture.output({
    out <- docDF(dat, column = 1, type = 1, minFreq = 2)
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)

  capture.output({
    out <- docDF(dat, column = 1, type = 1, N = 2, nDF = 1)
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)

  capture.output({
    out <- docDF(dat, column = 1, pos = "名詞", type = 1, co = 1)
  })
  expect_equal(dim(out), c(8, 11))
})
