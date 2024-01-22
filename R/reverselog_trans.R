# Returns a transformation object with reversed logarithmically spaced values ----
# Used for the x-axis of the plot returned by generatePlot()
reverselog_trans <- function() {
  trans <- function(x) -log(x, 10)
  inv <- function(x) 10^(-x)
  scales::trans_new(paste0("reverselog-", format(10)), trans, inv,
    scales::log_breaks(base = 10),
    domain = c(-Inf, Inf)
  )
}
