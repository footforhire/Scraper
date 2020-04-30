# Scraper

The vision for this tool is to be able to create an automated digest of open source information. 
I envision either a shiny application hosted somewhere or an automated email to which one can subscribe,
or updating a WordPress page with two or three open source article a day.

As of 30 Apr 2020, this is a proof of concept project ONLY. If you would like to contribute, or if you have any ideas on how to improve this tool, please email me at marknitz@gmail.com or send me a pull request.

# Required R packages

RSelenium
tidyverse

RSelenium is the tool that connects this script to a Selenium Server.
More information on this can be found at

https://cran.r-project.org/web/packages/RSelenium/vignettes/basics.html

and 

https://rpubs.com/johndharrison/RSelenium-Docker

Based on that walkthrough, it is also advised that you invest some time
in learning how to utilize Docker. You can find out more about Docker and its
capabilities at

https://www.docker.com/products/docker-desktop

More information on fusing the two in order to make this script work can be found here

https://rpubs.com/johndharrison/RSelenium-Docker

tidyverse is a suite of tools created by Hadley Wickham that allow a wide range
of functions to be called on data. Currently, dplyr is the only package that
is called within the tidyverse, but I envision rvest being utilized to great
extent in the future. You can learn more by visiting

https://www.tidyverse.org/

and

https://blog.rstudio.com/2014/11/24/rvest-easy-web-scraping-with-r/

# The Way Forward

I'm hoping to compile most of the information that I get from this tool into a WordPress and/or subscription emailer. I've looked at continuing to utilize docker machines in order to work in a static environment, and then interact with the WordPress application through the docker image and utilizing other R packages as indicated here

https://rpubs.com/pbaumgartner/r2wp

in order to create WordPress posts from our filtered results.

As of 30 Apr 2020, I am working on identifying the new news articles from the previous pull and posting ONLY the new articles to a single WordPress post. This should only result in a couple of articles being posted. The format at this point is unimportant, but will be refined along the line.

# Troubleshooting

When executing docker run for an image with firefox browser please set shm-size to 2g. See https://github.com/SeleniumHQ/docker-selenium/pull/485/files# for more info.

``` bash
$ docker run -d -p 4444:4444 --shm-size 2g selenium/standalone-firefox:##ANY##
```
where ##ANY## is the version of firefox that you're using

This is a workaround to node-firefox crash in docker container issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1338771#c10
