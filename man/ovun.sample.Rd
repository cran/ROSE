\name{ovun.sample}
\alias{ovun.sample}
\title{
Over-sampling, under-sampling, combination of over- and under-sampling.
}

\description{
Creates possibly balanced samples by random over-sampling minority examples, under-sampling majority examples or combination of over- and under-sampling.
}

\usage{
ovun.sample(formula, data, method="both", N, p=0.5, subset, na.action, seed)
}

\arguments{
  \item{formula}{
An object of class \code{\link{formula}} (or one that can be coerced to that class). 
	The specification of the formula must be suited for the selected classifier. 
	See \code{\link{ROSE}} for information about interaction among predictors or 
	their transformations.
}
  \item{data}{
	An optional data frame, list or environment (or object
	coercible to a data frame by \code{as.data.frame}) in which 
   to preferentially interpret ``formula''. 
   If not specified, the variables are taken from ``environment(formula)''.
}
\item{method}{
  One among \code{c("over", "under", "both")} to perform over-sampling minority examples, under-sampling majority 
  examples or combination of over- and under-sampling, respectively. 
}
  \item{N}{
 The desired sample size of the resulting data set. 
 If missing and \code{method} is either \code{"over"} or \code{"under"} the sample size is determined by oversampling 
 or, respectively, undersampling examples so that the minority class occurs in proportion equal to \code{p}. 
 When \code{method = "both"} the argument is compulsory, with default value given by the length of vectors 
 specified in \code{formula}. 
}
 \item{p}{
 The proportion of minority class examples in the resulting data set. 
 If missing and \code{method} is either \code{"over"} or \code{"under"} this proportion is determined by oversampling 
 or, respectively, undersampling examples so that the sample size is equal to \code{N}. 
 When \code{method ="both"} the argument is compulsory with default value given by 0.5.
}
 \item{subset}{
 An optional vector specifying a subset of observations to be used in the sampling process.
 } 
 \item{na.action}{
 A function which indicates what should happen when the data contain 'NA's.  
 The default is set by the 'na.action' setting of 'options'.
}
  \item{seed}{
A single value, interpreted as an integer, recommended to specify seeds and keep trace of the  
  sample/es.
}
}


\value{
	\item{Call}{The matched call.}
	\item{method}{The method used to balance the sample. Possible choices are \cr \code{c("over", "under", "both")}.}
	\item{data}{ The resulting new data set.} 
}



\seealso{
\code{\link{ROSE}}.
}

\examples{

#10-dimensional example
#loading data
data(sefihy)

#imbalance on training set
table(sefihy.train$cls)

# balanced data set with both over and under sampling
data.balanced.ou <- ovun.sample(cls~., data=sefihy.train, N=nrow(sefihy.train), p=0.5, 
                                seed=1, method="both")$data

table(data.balanced.ou$cls)

# balanced data set with over-sampling
data.balanced.over <- ovun.sample(cls~., data=sefihy.train, p=0.5, seed=1, 
                                  method="over")$data

table(data.balanced.over$cls)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

