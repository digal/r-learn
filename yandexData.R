require(XML)
library(XML)
xml.url <- "http://export.yandex.ru/last/last20x-static.xml"
xmlfile <- xmlTreeParse(xml.url)
root <- xmlRoot(xmlfile)
requests <- xmlSApply(root[[1]], xmlValue)
names(requests) <- NULL
words <- tolower(unlist(sapply(requests, strsplit, " "), recursive=FALSE, use.names=FALSE))
freq <- as.data.frame(table(words))
freq <- freq[with(freq, order(-Freq)), ]
freq <- freq[grep("^[a-zа-я]{4,}$", freq$words), ]
h = head(freq, n = 10)
barplot(h$Freq, names.arg=h$words)
