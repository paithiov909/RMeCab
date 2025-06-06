/*
    全ての関数を使われる前に消し去りたい


　 　 　 　 |＼　　 　 　 　 　 ／|
　 　 　 　 |＼＼　　 　 　 ／／|
　　　　 　 : 　,>　｀´￣｀´　<　 ′
.　　　　 　 Ｖ　 　 　 　 　 　 Ｖ
.　　　　 　 i{　●　 　 　 ●　}i
　　　　 　 八　 　 ､_,_, 　 　 八 　　　わけがわからないよ
. 　 　 　 /　个 . ＿　 ＿ . 个 ',
　　　＿/ 　 il 　 ,'　　　 '.　 li　 ',＿_


    docDF関数で全てをまかなえるから

*/

#pragma once

#include "mecab.h"

#include <R.h>
#include <Rdefines.h>
#include <Rinternals.h>
#include <R_ext/Riconv.h>
#undef length

#ifdef R_NO_REMAP
#define allocVector Rf_allocVector
#define lengthgets Rf_lengthgets
#define mkCharCE Rf_mkCharCE
#define mkString Rf_mkString
#define setAttrib Rf_setAttrib
#define xlength(x) Rf_xlength(x)
#define ScalarInteger Rf_ScalarInteger
#endif

#include <string>
#include <map>
#include <list>
#include <vector>
#include <utility>
#include <locale.h>

using namespace std;

/*
vector <string> split(string str, string delim)
{
    vector <string> result;
    int cutAt;
    while( (cutAt = str.find_first_of(delim)) != str.npos )
    {
        if(cutAt > 0)
        {
            result.push_back(str.substr(0, cutAt));
        }
        str = str.substr(cutAt + 1);
    }
    if(str.size() > 0)
    {
        result.push_back(str);
    }
return result;
}
*/

// extern int utf8locale;

extern int BUF1;
extern int BUF2;
extern int BUF3;
extern int BUF4;
extern int FILEINPUT;
extern int OVERLINE;
extern int FILEN;

/////////////////////////////////////////////////////////////
extern char meisi[128];
extern char* meisiCode();

/////////////////////////////////////////////////////////////

extern char keiyou[128];
extern char* keiyouCode();
///////////////

/////////////////////////////////////////////////////////////
extern char kigo[128];
extern char* kigoCode();
////////////////////////////////////////////////

#define CHECK(eval)                                           \
  if (!eval) {                                                \
    fprintf(stderr, "Exception:%s\n", mecab_strerror(mecab)); \
    mecab_destroy(mecab);                                     \
    Rf_error("something gone wrong in MeCab");                \
  }
///////////////////////////////////////////////////////////////
