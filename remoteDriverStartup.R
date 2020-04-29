#load rselenium if you haven't already
library(RSelenium)

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

#navigate to google news homepage
remDr$navigate("https://news.google.com")

#fin startup