df <- read.csv("listings5.csv",na.strings=c('NA',''))
df1 <- read.csv("listings4.csv",na.strings=c('NA',''))
df2 <- read.csv("listings3.csv",na.strings=c('NA',''))
df3 <- read.csv("listings2.csv",na.strings=c('NA',''))
df4 <- read.csv("listings1.csv",na.strings=c('NA',''))
df5 <- read.csv("listings0.csv",na.strings=c('NA',''))

sum1 <- merge(df,df1, all=TRUE)
sum2 <- merge(sum1,df2, all=TRUE)
sum3 <- merge(sum2,df3, all=TRUE)
sum4 <- merge(sum3,df4, all=TRUE)
sum <- merge(sum4,df5, all=TRUE)

sum

summary(sum)
str(sum)

df <- read.csv("reviews5.csv",na.strings=c('NA',''))
df1 <- read.csv("reviews4.csv",na.strings=c('NA',''))
df2 <- read.csv("reviews3.csv",na.strings=c('NA',''))
df3 <- read.csv("reviews2.csv",na.strings=c('NA',''))
df4 <- read.csv("reviews1.csv",na.strings=c('NA',''))
df5 <- read.csv("reviews0.csv",na.strings=c('NA',''))

sum1 <- merge(df,df1, all=TRUE)
sum2 <- merge(sum1,df2, all=TRUE)
sum3 <- merge(sum2,df3, all=TRUE)
sum4 <- merge(sum3,df4, all=TRUE)
sum <- merge(sum4,df5, all=TRUE)

sum

summary(sum)
str(sum)

write.csv(sum,"~/DSBA 6211 project\\reviewsdata2020.csv", row.names = FALSE)

df1 <- read.csv("listingdata.csv",na.strings=c('NA',''))

df1 = subset(df1,select = -c(6,18:20,36:41))

## date
df1$last_scraped <- as.Date(df1$last_scrape,format="%Y-%m-%d")
df1$host_since <- as.Date(df1$host_since,format="%Y-%m-%d")
df1$first_review <- as.Date(df1$first_review,format="%Y-%m-%d")
df1$last_review <- as.Date(df1$last_review,format="%Y-%m-%d")

## Categorical
df1$id <- factor(df1$id)
df1$name <- factor(df1$name)
df1$host_id <- factor(df1$host_id)
df1$host_response_time <- factor(df1$host_response_time)
df1$host_verifications <- factor(df1$host_verifications)
df1$neighbourhood <- factor(df1$neighbourhood)
df1$city <- factor(df1$city)
df1$property_type <- factor(df1$property_type)
df1$room_type <- factor(df1$room_type)
df1$bed_type <- factor(df1$bed_type)
df1$amennities <- factor(df1$amenities)

## Integer
df1$security_deposit <- as.numeric(df1$security_deposit)
df1$guests_included <- as.numeric(df1$guests_included)

str(df1)

## Sent for ipynb for further data cleansing
## further drop unimportant
df2 <- read.csv("listing456.csv",na.strings=c('NA',''))

df2 = subset(df1,select = -c(15,16))

write.csv(df2,"~/DSBA 6211 project\\listing789.csv", row.names = FALSE)

df3 <- read.csv("listing789.csv",na.strings=c('NA',''))

df3 = subset(df3,select = -c(49,50))

write.csv(df3,"~/DSBA 6211 project\\listingfinal.csv", row.names = FALSE)

df4 <- read.csv("listingfinal.csv",na.strings=c('NA',''))

str(df4)

# df3$amennities <- factor(df3$amennities)
# df3$amennities <- as.character(df3$amennities)
# 
# df3$amenities
# 
# df3 <- df3[which(df3$host_is_superhost=="t"|
#                          df3$host_is_superhost=="f"),]
# 
# library(quanteda)
# myCorpus <- corpus(df3$amenities)
# 
# str(df3)
# 
# summary(myCorpus)
# myDfm <- dfm(myCorpus)
# 
# tstat_freq <- textstat_frequency(myDfm)
# head(tstat_freq, 20)
# 
# library(ggplot2)
# myDfm %>% 
#   textstat_frequency(n = 20) %>% 
#   ggplot(aes(x = reorder(feature, frequency), y = frequency)) +
#   geom_point() +
#   labs(x = NULL, y = "Frequency") +
#   theme_minimal()
# 
# library(stopwords)
# myDfm <- dfm(myCorpus,
#              remove_punc = T,
#              remove = c(stopwords("english")),
#              stem = T)
# dim(myDfm)
# topfeatures(myDfm,30)
# 
# textplot_wordcloud(myDfm,max_words=200)
# 
# 
# myDfm<- dfm_trim(myDfm,min_termfreq=5, min_docfreq=2)
# dim(myDfm)
# 
# doc_dist <- textstat_dist(myDfm)
# clust <- hclust(as.dist(doc_dist))
# plot(clust,xlab="Distance",ylab=NULL)
# 
# amenities_sim <- textstat_simil(myDfm, 
#                                 selection="wifi",
#                                 margin="feature",
#                                 method="correlation")
# as.list(amenities_sim,n=20)
