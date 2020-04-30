# Scraper

The vision for this tool is to be able to create an automated digest of open source information. 
I envision either a shiny application hosted somewhere or an automated email to which one can subscribe,
or updating a WordPress page with two or three open source article a day.

# Required R packages

RSelenium
tidyverse

RSelenium is the tool that connects this script to a Selenium Server.
More information on this can be found at

https://cran.r-project.org/web/packages/RSelenium/vignettes/basics.html

Based on that walkthrough, it is also advised that you invest some time
in learning how to utilize Docker. You can find out more about Docker and its
capabilities at

https://www.docker.com/products/docker-desktop

tidyverse is a suite of tools created by Hadley Wickham that allow a wide range
of functions to be called on data. Currently, dplyr is the only package that
is called within the tidyverse, but I envision rvest being utilized to great
extent in the future. You can learn more by visiting

https://www.tidyverse.org/

and

https://blog.rstudio.com/2014/11/24/rvest-easy-web-scraping-with-r/

# Troubleshooting

When executing docker run for an image with firefox browser please set shm-size to 2g. See https://github.com/SeleniumHQ/docker-selenium/pull/485/files# for more info.

``` bash
$ docker run -d -p 4444:4444 --shm-size 2g selenium/standalone-firefox:##ANY##
```
where ##ANY## is the version of firefox that you're using

This is a workaround to node-firefox crash in docker container issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1338771#c10
