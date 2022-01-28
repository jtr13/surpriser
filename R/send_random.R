#' Title
#'

#' @param subject character string indicating subject line of email, defaults to "This is a test."
#' @param month character string containing month to send email,
#' defaults to current month
#' @param startday numeric indicating first possible day of month to send email, defaults to next day if \code{month} is current month, 1 otherwise.
#' @param endday numeric indicating last possible day of month to send email, defaults to last day of \code{month}
#' @param body character string containing body of email, defaults to "Surprise!"
#' @param from from email address, defaults to options()$email (can be stored in \code{.Rprofile})
#' @param test logical if \code{TRUE}, email is not sent, and firstday/lastday/surprise_date are displayed. Defaults to \code{FALSE}
#'
#' @export
#'
#' @examples
#'
#' gmailr::gm_auth_configure()
#' send_random("feb")
#'
send_random <- function(subject = "This is a test.", month = NULL, startday = NULL, endday = NULL, body = "Surprise!", from = options()$email, test = FALSE) {

  if (!is.null(startday) & !is.null(endday)) {
    if (endday <= startday) stop ("endday must be greater than startday.")
  }

  today <- Sys.Date()
  yr <- lubridate::year(today)
  day <- lubridate::day(today)
  if (is.null(month)) {
    if (is.null(startday)) {
      firstday <-  today + 1
    } else {
      firstday <- lubridate::ymd(paste(yr, month, startday))
    }
    if (months(firstday) != months(today)) stop("It's the end of the month, no dates are available.")
} else {
    if (is.null(startday)) {
      firstday <- lubridate::ymd(paste(yr, month, 1))
    } else {
      firstday <- lubridate::ymd(paste(yr, month, startday))
    }
  if (is.na(firstday)) stop("Impossible startday.")
}

  if (firstday < today) {
    firstday <- lubridate::ymd(paste(lubridate::year(firstday) + 1, months(firstday), lubridate::day(firstday)))
  }

  if (test) print(paste("firstday:", firstday))

  if (is.null(endday)) {
    lastday <- lubridate::ceiling_date(firstday, "month") - 1
  } else {
    lastday <- lubridate::ymd(paste(lubridate::year(firstday), months(firstday), endday))
  }

  if (is.na(lastday)) stop("Impossible endday.")

  if (test) print(paste("lastday:", lastday))

  surprise_date <- sample(firstday:lastday, 1) + as.Date("1970-01-01")

  if (test) print(paste("surprise_date:", surprise_date))

  to <- paste0(months(surprise_date), lubridate::day(surprise_date), "@sanebox.com")

  email_to_send <- gmailr::gm_mime() %>%
    gmailr::gm_to(to) %>%
    gmailr::gm_from(from) %>%
    gmailr::gm_subject(subject) %>%
    gmailr::gm_text_body(body)
  if (!test) gmailr::gm_send_message(email_to_send)
}
