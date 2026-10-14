format_cz <- function(x, digits = 2, signed = FALSE) {
  res_formatted <- formatC(
    x = x,
    format = "f",
    digits = digits,
    decimal.mark = ",",
    big.mark = " "
  )

  if (signed && is.finite(x) && x > 0) {
    res_formatted <- paste0("+", res_formatted)
  }

  return(res_formatted)
}