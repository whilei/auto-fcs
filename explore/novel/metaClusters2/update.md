Alright, next version is at https://jlanej.shinyapps.io/metaclusters2/ . Things definitely take longer to plot etc with the 70k+ data points, but webGL at least makes it so the tsne plots do not crash your browser :) . Running locally has better performance than my free-tier server as well. 

Few updates are:

The dynamic count summary at the top `Currently 78318 datapoints, 36 meta clusters, and 5195 samples` at the start.

Toggle to adjust "Minimum number of events in phenograph cluster", which allows you to remove individual phenograph clusters with < 100 events etc. Some of the outliers we saw previously were in the low count category.

Point size/opacity adjustments, just for fun.