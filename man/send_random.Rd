% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/send_random.R
\name{send_random}
\alias{send_random}
\title{Title}
\usage{
send_random(
  subject = "This is a test.",
  month = NULL,
  startday = NULL,
  endday = NULL,
  body = "Surprise!",
  from = options()$email,
  test = FALSE
)
}
\arguments{
\item{subject}{character string indicating subject line of email, defaults to "This is a test."}

\item{month}{character string containing month to send email,
defaults to current month}

\item{startday}{numeric indicating first possible day of month to send email, defaults to next day if \code{month} is current month, 1 otherwise.}

\item{endday}{numeric indicating last possible day of month to send email, defaults to last day of \code{month}}

\item{body}{character string containing body of email, defaults to "Surprise!"}

\item{from}{from email address, defaults to options()$email (can be stored in \code{.Rprofile})}

\item{test}{logical if \code{TRUE}, email is not sent, and firstday/lastday/surprise_date are displayed. Defaults to \code{FALSE}}
}
\description{
Title
}
\examples{

gmailr::gm_auth_configure()
send_random("feb")

}
