\encoding{UTF-8}
\name{sefihy}
\alias{sefihy.train}
\alias{sefihy.test}
\title{Semi-filled hypersphere data}
\description{
Simulated training and test set for imbalanced binary classification. The rare class may be described as a depleted semi-hypersphere filled with the prevalent class, which is normally distributed and has elliptical contours. 
}

\usage{data(sefihy)}

\format{
Data represent 10 real features (denoted as \code{x1,...,x10}) and a binary label class (denoted as \code{cls}). Positive examples occur in about 5\% of the data. 
\describe{
\item{\code{sepihy.train}}{Includes 1000 rows and 50 positive examples.}
\item{\code{sepihy.test}}{Includes 250 rows and 12 positive examples.}
}

Data have been simulated as follows:
\deqn{
(\mbox{\code{x1,...,x10, cls}) s.t.}
\left \{ \begin{array}{ll}
\mbox{\code{x1,...,x10}} \sim \mathbf{N}_{10} \left(\mathbf{0}_{10}, (0.25, \mathbf{0}_9) \mathbf{I}_{10}\right) & \mbox{ if \code{cls} }=0 \\
\mbox{\code{x1,...,x10}} \sim \mathbf{N}_{10} \left(\mathbf{0}_{10}, \mathbf{I}_{10}\right) \cap \left\|\mathbf{x}\right\|<4 \cap x_1 \leq 0 &\mbox{  if \code{cls} }=1\\
\end{array}\right. 
}
}
 
\references{Menardi, G. and Torelli, N. (2012). Training and assessing classification rules with imbalanced data. \emph{Data Mining and Knowledge Discovery}, DOI:10.1007/s10618-012-0295-5, to appear.}

\examples{
data(sefihy)
summary(sefihy.train)
summary(sefihy.test)
}  
\keyword{datasets}
