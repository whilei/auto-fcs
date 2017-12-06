channels <- as.character(c("APC-Cy7-A","BV421-A"))
num_channels <- length(channels)

# For comparison purposes, we update the min and max values to -Inf and Inf,
# respectively, if NULL.
if (is.null(min)) {
  mins <- rep(-Inf, num_channels)
}
if (is.null(max)) {
  maxs <- rep(Inf, num_channels)
}

if (!(num_channels == length(min) && num_channels == length(max))) {
  stop("The lengths of 'min' and 'max' must match the number of 'channels' given.")
}

gate_coordinates <- lapply(seq_len(num_channels), function(i) {
  c(mins[i], maxs[i])
})