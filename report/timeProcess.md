630

start openCytoBatch_15 at: Thu Feb 22 10:23:31 CST 2018
end openCytoBatch_15 at:  Fri Feb 23 03:19:18 CST 2018

library(chron)
2/22/2018 10:23:31

dtimes = c("2018-02-22 10:23:31","2018-02-23 03:19:18")
 dtparts = t(as.data.frame(strsplit(dtimes,' ')))
 row.names(dtparts) = NULL
 thetimes = chron(dates=dtparts[,1],times=dtparts[,2],format=c('y-m-d','h:m:s'))
 
 difftime(thetimes[2],thetimes[1] ,units = "mins")
 
 Time difference of 1015.783 mins
 
1015.783/630