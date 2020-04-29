##install relevant packages
pkgs <-c('twitteR','ROAuth','httr','plyr','stringr','ggplot2','plotly','xlsx', 'rJava', 'rtweet')
for(p in pkgs) if(p %in% rownames(installed.packages()) == FALSE) {install.packages(p)}
##insert relevant R packages
library(twitteR)
library(ROAuth)
library(httr)
library(xlsxjars)
library(rJava)
library(xlsx)
library(rtweet)
library(openxlsx)
##created API from Twitter and requested access tokens. Included the access tokens in R and set my authorities in the program to be able to run the relevant scripts.
api_key <- "xxxxxx"
api_secret <- "xxx"
access_token <- "xxxJ"
access_token_secret <- "xxx"
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)
get_token()
##look up latest tweet from the account
tweets_data(pmf)

##web scrap the most recent 3200 tweets from the account. Twitter puts a limit at 3200.
pmf_tweets<- userTimeline('teamsmediawar', n=3200)
##convert tweets to dataframe and check dimension
tweets2.df <- twListToDF(pmf_tweets)
dim(tweets2.df)
##convert dataframe to excel sheet
write.xlsx(x=tweets2.df,file="test.pmftweets.xlsx")
tweets.df
##alternative way to get timeline data using rtweet
pmf2<-get_timelines("teamsmediawar", n=3200)

##creating plot
pmf2 %>%
dplyr::filter(created_at > "2019-12-31") %>%
ts_plot("days", trim = 1L) +
ggplot2::geom_point() +
ggplot2::theme_minimal() +
ggplot2::theme(
legend.title = ggplot2::element_blank(),
legend.position = "bottom",
plot.title = ggplot2::element_text(face = "bold")) +
ggplot2::labs(
 x = NULL, y = NULL,
title = "Frequency of Twitter statuses posted by PMF",
subtitle = "Twitter status (tweet) counts aggregated by day from December 2019",
caption = "\nSource: Data collected from Twitter's REST API via rtweet" )
##get trends by location
tehran<-get_trends(lat=35.6, lng=51.3)
