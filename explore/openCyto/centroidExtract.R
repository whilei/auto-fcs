km_rc = KMeans_rcpp(
  clust,
  clusters = 4,
  num_init = 500,
  max_iters = 5000,
  
  initializer = 'optimal_init',
  threads = 4,
  verbose = T,
  seed = 42
)

km_rc$centroids