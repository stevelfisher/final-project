setwd("~/dataviz-fall-2013/final-project")
deaths <- read.csv("working/gis-arizona.csv")
aggregate(deaths$Sex, list(deaths$Sex, deaths$Cause_of_Death), length)
aggregate(deaths$Corridor, list(deaths$Corridor), length)