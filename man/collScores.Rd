\name{collScores}
\alias{collScores}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ collScores}
\description{
 \code{ collScores} gets T-score and MI-score according to the result of "collocate".}
\usage{
%  collScores(dataf, coln, mypref, mybuf)
  collScores(kekka, node, span = 0)
% 
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{kekka}{ result of collocate function.}
  \item{node}{ node word. }
  \item{span}{ span }
  % %  \item{mybuf}{ enough buffer for japanese strings}
}
%% \details{
%%   If necessary, more details than the description above 
%% }
\value{
 generates and returns data.frame.
}
\references{  \url{http://www.amazon.co.jp/dp/4627848420}   }
\author{ Motohiro ISHIDA \email{ishida.motohiro@gmail.com} }%\author{ishida motohiro }
% \note{ not
%  \section{Warning }{....} 
% }
% \seealso{ objects to See Also as \code{\link{help}},  }
% \examples{
% %   \dontrun{
% %  z <- collScores(dat, 2)
% %   }
% }
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ misc }
% \keyword{  }% __ONLY ONE__ keyword per line
