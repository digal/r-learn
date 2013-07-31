require(XML)
library(XML)
xmlfile <- xmlTreeParse("http://export.yandex.ru/last/last20x-static.xml")
requests <- xmlSApply(xmlRoot(xmlfile)[[1]], xmlValue)

#split and get plain words list (with duplicates)
words <- tolower(unlist(sapply(requests, strsplit, " "), recursive=FALSE, use.names=FALSE))

#sorted frequency table
freq <- sort(table(words), decreasing=TRUE)

#filter out short words and non-words
freq <- freq[grep("^[a-zа-я]{4,}$", names(freq))]

barplot(head(freq, n = 10))
