require(XML)
library(XML)
xml.url <- "http://export.yandex.ru/last/last20x-static.xml"
xmlfile <- xmlTreeParse(xml.url)
root <- xmlRoot(xmlfile)
requests <- xmlSApply(root[[1]], xmlValue)
names(requests) <- NULL
words <- tolower(unlist(sapply(requests, strsplit, " "), recursive=FALSE, use.names=FALSE))
t <- table(words)
freq <- as.data.frame(t, row.names=names(t))
freq <- freq[, "Freq", drop=FALSE]
freq <- freq[order(-freq[,1]), ,drop=FALSE]
freq <- freq[grep("^[a-zа-я]{4,}$", row.names(freq)), ,drop=FALSE]
h = head(freq, n = 10)
barplot(h$Freq, names.arg=row.names(h))
