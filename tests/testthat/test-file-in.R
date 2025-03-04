skip_on_cran()

text_file <- system.file("samples/doc1.txt", package = "RMeCab")
text_dir <- system.file("samples", package = "RMeCab")

test_that("collocate works for a file", {
  capture.output({
    out <- collocate(text_file, "数学")
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)
})

test_that("docDF works for directory", {
  capture.output({
    out <- docDF(text_dir, column = 0, type = 1, minFreq = 2)
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)
})

test_that("docMatrix works for directory", {
  capture.output({
    out <- docMatrix(text_dir)
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)
})

test_that("docMatrix2 works for directory",  {
  capture.output({
    out <- docMatrix2(text_dir)
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)
})

test_that("docNgram works for directory", {
  capture.output({
    out <- docNgram(text_dir, type = 1)
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)
})

test_that("docNgram2 works for directory", {
  capture.output({
    out <- docNgram2(text_dir, type = 1)
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)
})

test_that("Ngram works for a file", {
  capture.output({
    out <- Ngram(text_file, type = 1)
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)
  expect_error(capture.output(Ngram(text_file, type = 1, N = 1)))
})

test_that("NgramDF works for a file", {
  capture.output({
    out <- NgramDF(text_file, type = 1)
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)
  expect_error(capture.output(NgramDF(text_file, type = 1, N = 1)))
})

test_that("NgramDF2 works for directory", {
  capture.output({
    out <- NgramDF2(text_dir, type = 1)
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)
  expect_error(capture.output(NgramDF2(text_dir, type = 1, N = 1)))
})

test_that("RMeCabDoc works for a file", {
  capture.output({
    out <- unlist(RMeCabDoc(text_file))
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)
})

test_that("RMeCabFreq works for a file", {
  capture.output({
    out <- RMeCabFreq(text_file)
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)
})

test_that("RMeCabText works for a file", {
  capture.output({
    out <- RMeCabText(text_file)
  })
  expect_snapshot_value(out, style = "json2", cran = FALSE)
})
