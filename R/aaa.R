#' Arguments for tagger
#'
#' @name rmecab-args-tagger
#' @rdname rmecab-args
#' @keywords internal
#'
#' @param dic Path to a user dictionary file such as `ishida.dic`.
#' @param mecabrc Path to a mecab resource file.
#' @param etc Other options for 'MeCab' tagger.
NULL

#' Arguments set type and N
#'
#' @name rmecab-args-set
#' @rdname rmecab-args
#' @keywords internal
#'
#' @param type Kind of tokens. `0` for character, `1` for term.
#' Defaults to `0`.
#' @param N Unit of tokens. If `2`, counts bi-grams.
NULL

#' Argument weight
#'
#' @name rmecab-args-weight
#' @rdname rmecab-args
#' @keywords internal
#'
#' @param weight Method to weight term frequencies.
NULL

#' Argument kigo
#'
#' @name rmecab-args-kigo
#' @rdname rmecab-args
#' @keywords internal
#'
#' @param kigo If `1`, `[[TOTAL-TOKENS]]` includes number of symbols.
#' Defaults to `0` (does not count symbols).
NULL

#' Argument pos
#'
#' @name rmecab-args-pos
#' @rdname rmecab-args
#' @keywords internal
#'
#' @param pos Parts of speech that should be extracted.
#' If `NULL`, all terms are extracted.
NULL # TODO: explain about `"Default"`

#' Argument minFreq
#'
#' @name rmecab-args-minFreq
#' @rdname rmecab-args
#' @keywords internal
#'
#' @param minFreq Minimum document frequency for filtering terms.
#' Terms that appear less than `minFreq` within a document are ignored.
NULL

#' Arguments co
#'
#' @name rmecab-args-co
#' @rdname rmecab-args
#' @keywords internal
#'
#' @param co If `1`, returns co-occurrence matrix.
NULL

#' Arguments mypref
#'
#' @name rmecab-args-mypref
#' @rdname rmecab-args
#' @keywords internal
#'
#' @param mypref If `1`, returns basic forms of terms.
NULL
