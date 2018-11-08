setwd("~/documents/code/Rstuff/repomaker")
tools::write_PACKAGES("local_cran/src/contrib", type="source")
available.packages(repos="local_cran")
