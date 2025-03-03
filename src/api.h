#include <Rinternals.h>

SEXP collocate(SEXP filename, SEXP target, SEXP span, SEXP mydic);
SEXP docDF(SEXP directory, SEXP origF, SEXP fileN, SEXP ft, SEXP type, SEXP pos,
           SEXP posN, SEXP minFreq, SEXP N, SEXP Genkei, SEXP nDF, SEXP mydic);
SEXP docMatrix2(SEXP directory, SEXP origF, SEXP fileN, SEXP ft, SEXP pos,
                SEXP posN, SEXP minFreq, SEXP kigo, SEXP mydic);
SEXP docMatrixDF(SEXP charVec, SEXP charLeng, SEXP pos, SEXP posN, SEXP minFreq,
                 SEXP mydic);
SEXP docNgram2(SEXP directory, SEXP origF, SEXP fileN, SEXP ft, SEXP type,
               SEXP pos, SEXP posN, SEXP minFreq, SEXP N, SEXP kigo,
               SEXP mydic);
SEXP docNgramDF(SEXP mojiVec, SEXP rowN, SEXP type, SEXP pos, SEXP posN,
                SEXP minFreq, SEXP N, SEXP kigo, SEXP mydic);
SEXP Ngram(SEXP filename, SEXP type, SEXP N, SEXP pos, SEXP posN, SEXP mydic);
SEXP NgramDF(SEXP filename, SEXP type, SEXP N, SEXP pos, SEXP posN, SEXP mydic);
SEXP NgramDF2(SEXP directory, SEXP origF, SEXP fileN, SEXP ft, SEXP type,
              SEXP pos, SEXP posN, SEXP minFreq, SEXP N, SEXP kigo, SEXP mydic);
SEXP RMeCabC(SEXP str, SEXP mypref, SEXP mydic);
SEXP RMeCabDoc(SEXP filename, SEXP mypref, SEXP kigo, SEXP mydic);
SEXP RMeCabFreq(SEXP dfCol, SEXP mydic);
SEXP RMeCabMx(SEXP filename, SEXP pos, SEXP posN, SEXP minFreq, SEXP kigo,
              SEXP mydic);
SEXP RMeCabText(SEXP filename, SEXP mydic);
