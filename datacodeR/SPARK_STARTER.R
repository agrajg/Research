rm(list = ls())
## SPARK STARTER ###
# Sys.setenv(SPARK_HOME = "T:/agrajg/spark")
# Sys.setenv(HADOOP_HOME = "T:/agrajg/winutils")
# .libPaths(c(file.path(Sys.getenv("SPARK_HOME"),"R","lib"), .libPaths()))
# library(SparkR)
# install.packages("rJava")
# library(rJava)

install.packages("sparklyr")
library(sparklyr)

spark_install()
install.packages("dplyr")
install.packages("tibble")
install.packages("config")
library(config)
devtools::install_github("rstudio/sparklyr")

library(sparklyr)
sc <- spark_connect(master = "local")