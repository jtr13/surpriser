#' Title
#'

#' @param subject character string indicating subject line of email
#' @param month character string indicating month to send email
#' @param body character string indicating body of email
#' @param email from email address, defaults to options()$email
#'
#' @export
#'
#' @examples
#'
#' gmailr::gm_auth_configure()
#' send_random("feb")
#'
send_random <- function(subject = "This is a test.", month = NULL, body = "Surprise!", email = options()$email) {
  today <- Sys.Date()
  if (is.null(month)) month <- months(today)
  if (month == months(today)) {
    firstday <- today + 1
  } else {
    yr <- lubridate::year(today)
    firstday <- as.Date(paste(month, 1, yr), format = "%b %d %Y")
    if (firstday < today) firstday <- as.Date(paste(month, 1, yr+1), format = "%b %d %Y")
  }
  lastday <- lubridate::ceiling_date(firstday, "month") - 1
  surprise_date <- sample(firstday:lastday, 1) + as.Date("1970-01-01")
  to <- paste0(months(surprise_date), lubridate::day(surprise_date), "@sanebox.com")

  email_to_send <- gmailr::gm_mime() %>%
    gmailr::gm_to(to) %>%
    gmailr::gm_from("joycerobbins1@gmail.com") %>%
    gmailr::gm_subject(subject) %>%
    gmailr::gm_text_body(body)
  gmailr::gm_send_message(email_to_send)
}
