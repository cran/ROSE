\name{accuracy.meas}
\alias{accuracy.meas}

\title{
Metrics to evaluate a classifier accuracy in imbalanced learning
}

\description{
This function computes precision, recall and the F measure of a prediction. 
}

\usage{
accuracy.meas(response, predicted, threshold = 0.5) 
}

\arguments{
	\item{response}{
A vector of responses containing two classes to be used to evaluate prediction accuracy. 
It can be of class \code{"factor"}, \code{"numeric"} or \code{"character"}.
}
	\item{predicted}{
A vector containing a prediction for each observation. This can be of class \code{"factor"} if the predicted label classes are provided 
or \code{"numeric"} for the probabilities of the rare class (or a monotonic function of them).
}
	\item{threshold}{
When \code{predicted} is of class \code{numeric}, it defines the probability threshold to classify an example as positive. 
Default value is meant for predicted probabilities and is set to 0.5. See further details below. 
Ignored if \code{predicted} is of class \code{factor}}
}

\details{
Prediction of positive or negative labels depends on the classification threshold, 
here defined as the value such that observations with predicted value greater than the
threshold are assigned to the positive class. Some caution is due in setting the 
threshold as well as in using the default setting both because the default value is meant 
for predicted probabilities and because the default 0.5 is 
not necessarily the optimal 
choice for imbalanced learning. Smaller values set for the threshold correspond to assign a larger 
misclassification costs to the rare class, which is usually the case.

Precision is defined as follows:
\deqn{\frac{\mbox{true positives}}{\mbox{true positives + false positives}}}
Recall is defined as:
\deqn{\frac{\mbox{true positives}}{\mbox{true positives + false negative}}}
The F measure is the harmonic average between precision and recall:
\deqn{2 \cdot \frac{\mbox{precision} \cdot \mbox{recall}}{\mbox{precision+recall}}}

}

\value{
A list with elements
  \item{Call}{The matched call.}
  \item{threshold}{The selected threshold.}
  \item{precision}{A vector of length one giving the precision of the prediction}
  \item{recall}{A vector of length one giving the recall of the prediction}
  \item{F}{A vector of length one giving the F measure}
}

\references{
Fawcet T. (2006). An introduction to ROC analysis. \emph{Pattern Recognition Letters}, 27 (8), 861--875.
}

\seealso{
\code{\link{roc.curve}} 
}


\examples{
#10-dimensional example
#loading data
data(sefihy)

#imbalance on training set
table(sefihy.train$cls)

#model estimation using logistic regression
fit.sefihy  <- glm(cls~., data=sefihy.train, family="binomial")

#prediction on training set
pred.sefihy.train <- predict(fit.sefihy, newdata=sefihy.train, type="response")

#compute accuracy measures (training set)
accuracy.meas(sefihy.train$cls, pred.sefihy.train, threshold = 0.05)

#imbalance on test set 
table(sefihy.test$cls)

#prediction on test set
pred.sefihy.test <- predict(fit.sefihy, newdata=sefihy.test, type="response")

#compute accuracy measures (test set)
accuracy.meas(sefihy.test$cls, pred.sefihy.test, threshold = 0.05)

}


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ supervised classification }
%\keyword{ supervised classification }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
