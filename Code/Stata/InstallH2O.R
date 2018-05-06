rm(list = ls())
.libPaths(new = c("H:/agrajg/R", "H:/agrajg/R2")) 

# The following two commands remove any previously installed H2O packages for R.
if ("package:h2o" %in% search()) { detach("package:h2o", unload=TRUE) }
if ("h2o" %in% rownames(installed.packages())) { remove.packages("h2o") }
# Next, we download packages that H2O depends on.
pkgs <- c("RCurl","jsonlite","dplyr","ggplot2", "caret", "magrittr","tibble","Rcpp", "RCurl", "bitops", "tibble", "tidyr")
for (pkg in pkgs) {
  if (! (pkg %in% rownames(installed.packages()))) { install.packages(pkg) }
}
# Now we download, install and initialize the H2O package for R.
install.packages("h2o", type="source", repos="http://h2o-release.s3.amazonaws.com/h2o/master/4193/R")
# install.packages("h2o", type="source", repos=(c("http://h2o-release.s3.amazonaws.com/h2o/latest_stable_R")))

update.packages()
# Finally, let's load H2O and start up an H2O cluster
library(h2o)
h2o.init(nthreads = -1,max_mem_size = "265G")

demo(h2o.randomForest)

h2o.shutdown()
# This file has installed, loaded and intialized H2O.
