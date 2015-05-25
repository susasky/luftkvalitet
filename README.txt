Shiny App to plot Air Quality Data from http://www2.dmu.dk/atmosphericenvironment/byer/sortall_files/stat6153.htm

To run the app: download global.R, ui.R and server.R to your laptop and run the app using RStudio or from the command line (you will need to install the R shiny package).

luft_complete.R produces interactive rCharts from the data.
To see the plots:
> source("luft_complete.R")
> m1 #shows the NO_2 NO_x and CO table graph
> p1 #shows the PM10 and PM25 table


---
need to find out how to display the rChart in the main panel (shiny App)
because it pops-up in a new tab... can't figure out why! :)
