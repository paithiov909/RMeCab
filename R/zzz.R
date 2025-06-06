#' @references \url{http://www.amazon.co.jp/dp/4627848420}
#' @seealso \url{https://rmecab.jp/wiki/index.php?RMeCab}
#'
#' @importFrom stats xtabs
#' @useDynLib RMeCab, .registration = TRUE
#' @keywords internal
"_PACKAGE"

.onAttach <- function(libname, pkgname) {
  if (.Platform$OS.type == "windows") {
    packageStartupMessage(
      paste(
        "The current version is designed to work with the 64-bit version of MeCab and a UTF-8 dictionary. ",
        "If you are using old MeCab with a Shift-JIS dictionary, please completely uninstall it, and",
        "then reinstall the 64-bit version of MeCab with a UTF-8 dictionary from 'https://github.com/ikegami-yukino/mecab/releases'.",
        sep = "\n"
      )
    )
  }
}

.onUnload <- function(libpath) {
  library.dynam.unload("RMeCab", libpath)
}
