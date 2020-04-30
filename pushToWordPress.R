## This code is adapted from the RPubs by RStudio site, an article by Peter Baumgartner
## https://rpubs.com/pbaumgartner/r2wp

## ----BEGIN CODE----

## ----Load Required Packages----
## Set the global chunk options for knitting reports
knitr::opts_chunk$set(
  echo = TRUE,
  eval = TRUE,
  message = TRUE,
  error = TRUE,
  warning = TRUE,
  highlight = TRUE,
  prompt = FALSE
)

## load required package `RWordPress` and `XMLRPC`
## as the interface and transfer protocol to WordPress
if (!require('RWordPress')) {
  devtools::install_github(c("duncantl/XMLRPC", "duncantl/RWordPress"))
}

library(RWordPress)
library(XMLRPC)

## load `knitr`: A general-purpose tool for dynamic report generation in R
if (!require("knitr")) {
  install.packages("knitr", repos = 'http://cran.wu.ac.at/')
}

library(knitr)

## load `reshape2`: Flexible restructuring and aggregating of data
if (!require("reshape2")) {
  install.packages("reshape2", repos = 'http://cran.wu.ac.at/')
}

library(reshape2)

## load `RCurl`: Provides functions to compose general HTTP requests
if (!require("RCurl")) {
  install.packages("RCurl", repos = 'http://cran.wu.ac.at/')
}

library(RCurl)

## ----Provide login data and URL for connecting to WordPress----

## add the following line to your .Rprofile-file:

##options(WordpressLogin = c(yourUserName = 'yourPassword'),
  ##WordpressURL = 'yourWordPressURL')

## ----Set up image push----
opts_knit$set(upload.fun = imgur_upload, base.url = NULL)  # upload all images to imgur.com
opts_chunk$set(fig.width = 5, fig.height = 5, cache = TRUE)

