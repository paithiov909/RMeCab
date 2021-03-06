\name{docDF}
\alias{docDF}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ docDF }
\description{
 \code{ docDF} returns returns data frame of N-gram from a file or all
 files in a given directoryor or a column of data.frame. Each word of N-gram makes one column. 
}
\usage{
  docDF(target, column = 0, type = 0, pos = NULL, minFreq = 1, N = 1,Genkei = 0, weight ="", nDF = 0, co = 0 , dic = "", mecabrc = "", etc = "")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{target}{directory path or a filename (may include path) or a 
	data.frame.}
  \item{column}{ column name or index, if data.frame . Default being 0 }
  \item{type}{ character (0) or term(1).Default being 0.  }
  \item{pos}{vector of parts of speech . Default being all words extracted.}
   %%   \item{posN}{argument4. Default being 0}
  \item{minFreq}{words of a document appearing less than minDocFreq
	within that document will be ignored.}
  \item{N}{N-gram. Default being 1}
  %   \item{sym}{ not implemented}%if total must include number of symbols, set sym = 1. Default being 0
  %   \item{kigo}{include symbols(0) or not(1)}
  \item{Genkei}{infinitive(0) or not(1)}
  \item{weight}{ tf or/and idf.see weight}
  \item{nDF}{0 or 1; if 1, ngrams are divided into columns}
  \item{co}{to make co-occurence matrix.}
  \item{dic}{ to specify user dictionary, e.x. ishida.dic }
  \item{mecabrc}{ not implemented (to specify mecab resource file) }
  \item{etc}{other options to mecab, not used now}  
%  \item{mydic}{ to specify user dictionary, e.x. ishida.dic }
}
%% \details{
%%   If necessary, more details than the description above 
%% }
\value{
  returns a data frame.
}
% \references{put references to the literature/web site here  }
\references{  \url{http://www.amazon.co.jp/dp/4627848420}  }
\author{ Motohiro ISHIDA \email{ishida.motohiro@gmail.com} }%\author{ishida motohiro }
% \note{ note 
%  \section{Warning }{....} 
% }
%\seealso{ objects to See Also as \code{\link{help}},  }
% \examples{
% %   \dontrun{
% %   }
% }
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ misc }
% \keyword{  }% __ONLY ONE__ keyword per line
