## global.R
#loading required packages
require(rvest)
require(quantmod)
require(rCharts)
require(stringr)
require(shiny)
require(devtools)

#scraping the html page
luft <- html("http://www2.dmu.dk/atmosphericenvironment/byer/sortall_files/stat6153.htm")

#extracting the data I need
no_co <-luft %>%
html_nodes("table") %>%
.[[2]] %>%
html_table()
names(no_co) <- c("date_2015","time", "NO_2", "NO_x", "CO")

pm <- luft %>%
html_nodes("table") %>%
.[[3]] %>%
html_table()
names(pm) <- c("date_2015","PM_10", "PM_25")

#cleaning up
##removing extra rows
no_co <- no_co[!(no_co$date_2015=="DATO - 2015"),]
rownames(no_co)<-NULL
pm <- pm[!(pm$date_2015=="DATO - 2015"),]
rownames(pm)<-NULL
##forcing date format
no_co[,1] <- as.Date(no_co[,1],"%d/%m")
pm[,1] <- as.Date(pm[,1],"%d/%m")
##adding start and end time interval colums
no_co$start <- gsub('-.*','',no_co[,2])
no_co$end <- str_trim(gsub('.*-','',no_co[,2]))

no_co$stime <- as.POSIXct(paste(no_co$date_2015, no_co$start), format="%Y-%m-%d %H")
no_co$etime <- as.POSIXct(paste(no_co$date_2015, no_co$end), format="%Y-%m-%d %H")

no_co <- no_co[with(no_co, order(stime)),]
no_co <- transform(no_co, stime=as.character(stime))
no_co$etime <- as.character(as.POSIXct(no_co$etime))

#formatting data
values <- no_co[,c(8,9,3,4,5)]
values$stime <- as.numeric(as.POSIXct(values$stime))*1000
values$CO<-as.numeric(values$CO)
values$NO_2<-as.numeric(values$NO_2)
values$NO_x<-as.numeric(values$NO_x)

a <- "NO_2"
b <- "NO_x"
