#include <stdint.h>
#include <Rinternals.h>
#include <R_ext/Parse.h>

#include "api.h"

static const R_CallMethodDef CallEntries[] = {
    {"collocate_impl", (DL_FUNC)&collocate, 4},
    {"docDF_impl", (DL_FUNC)&docDF, 12},
    {"docMatrix2_impl", (DL_FUNC)&docMatrix2, 9},
    {"docMatrixDF_impl", (DL_FUNC)&docMatrixDF, 6},
    {"docNgram2_impl", (DL_FUNC)&docNgram2, 11},
    {"docNgramDF_impl", (DL_FUNC)&docNgramDF, 9},
    {"Ngram_impl", (DL_FUNC)&Ngram, 6},
    {"NgramDF_impl", (DL_FUNC)&NgramDF, 6},
    {"NgramDF2_impl", (DL_FUNC)&NgramDF2, 11},
    {"RMeCabC_impl", (DL_FUNC)&RMeCabC, 3},
    {"RMeCabDoc_impl", (DL_FUNC)&RMeCabDoc, 4},
    {"RMeCabFreq_impl", (DL_FUNC)&RMeCabFreq, 2},
    {"RMeCabMx_impl", (DL_FUNC)&RMeCabMx, 6},
    {"RMeCabText_impl", (DL_FUNC)&RMeCabText, 2},
    {NULL, NULL, 0}
  };

void R_init_RMeCab(DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
