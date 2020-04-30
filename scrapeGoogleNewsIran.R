## ----Load Required Packages----

# load rselenium if you haven't already
library(RSelenium)

# load tidyverse
library(tidyverse)

## ----Start Driver and navigate to target page----
#clean workspace
remove(list = ls())

#create the remote driver with firefox browser driver on port 4445; 
#make sure selenium server is running first!
remDr <- remoteDriver(
  remoteServerAddr = "localhost",
  port = 4445L,
  browserName = "firefox"
)

#open the remote driver browser
remDr$open()

#wait for page to load
Sys.sleep(4)

#navigate to google news homepage
remDr$navigate("https://news.google.com")

#wait for page to load
Sys.sleep(5)

#where we are. uncomment for MORE verbosity. not recommended
#remDr$screenshot(display = TRUE)

#wait for image to render
Sys.sleep(4)

#fin startup

## ----BEGIN THE SCRAPE CODE----
#find/name the search box
webElem1 <- remDr$findElement(using = "class", value = "Ax4B8")

#input search terms into search box
#change the first element in list() to define the search terms just like you would in the google search engine
webElem1$sendKeysToElement(list("Iran", key = "enter"))

#wait for page to load
Sys.sleep(5)

#take another picture to see where we're at
remDr$screenshot(display = TRUE)

#wait for screenshot to render
Sys.sleep(2)

#collate the search results
#find/name the link text
googLinkText <- remDr$findElements(value = "//h3[@class = 'ipQwMb ekueJc gEATFF RD0gLb']")
linkHeading <- sapply(googLinkText, function(x) x$getElementText())
googLinkDesc <- remDr$findElements(value = "//span[@class = 'xBbh9']")
linkDescription <- sapply(googLinkDesc, function(x) x$getElementText())
googLinkHref <- remDr$findElements(value = "//h3[@class = 'ipQwMb ekueJc gEATFF RD0gLb']/a")
linkHref <- sapply(
  googLinkHref,
  function(x) x$getElementAttribute("href")
)

#close the session so it doesn't break --we have all the info we need from selenium
remDr$close()

## ----Create the spreadsheet----
#create data.frame of links
linkDataFrame<- data.frame(matrix(unlist(linkHref), nrow = length(linkHref), byrow = TRUE), stringsAsFactors = FALSE)
#create data.frame of headings
headingDataFrame<- data.frame(matrix(unlist(linkHeading), nrow = length(linkHeading), byrow = TRUE), stringsAsFactors = FALSE)
#mashe em bof up
testDataFrame <- data.frame(heading = headingDataFrame, href = linkDataFrame)

#PROBLEM: THE RESULTING DATAFRAME INCLUDES HOMEPAGE RESULTS AT THE HEAD OF THE DATAFRAME WITHOUT HEADINGS BUT WITH LINKS
#QUESTION: IS IT 38 RESULTS EVERY TIME OR IS IT DYNAMIC?

#view current output with the leading 38 removed
results <- testDataFrame %>%
  slice(39:n()) 
View(results)

#write the table to file
write.csv(results, "results.csv", row.names = FALSE)
