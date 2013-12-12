setwd("~/dataviz-fall-2013/final-project/")

# Always do this w/ your data

# setwd("dataviz-fall-2013//final-project//working")
# > data <- read.csv("gis-arizona.csv", stringsAsFactors=F)

# dim(data)

# head(data)

# names(data)






# Where are people dying the most? 
where <- prop.table(sort(table(data$Surface_Management)))

#mostly in kdjskjdskjd



# Compare temperature data with deaths.

# How many people are unknown? Where are the most unknowns?

# Men vs. women? 

 prop.table(sort(table(data$Sex)))

Change per year?

#making the map here

library(maptools)

#load shape file
shapes <- readShapePoly("tl_2010_04_county10.shp")

data_2 <- data

#setting the vector 

coordinates(data_2) <- c("Longitude", "Latitude")

#making it a Coordinate Reference System

proj4string(data_2) <- CRS("+proj=longlat")

#dots for the map

points(coordinates(data_2))

#map

plot(shapes)


death_type <- "Gunshot Wound"


plot_by_type <- function(death_type ){
	this_death_type <- subset(data_2, Cause_of_Death == death_type)
	plot(shapes)
	points(coordinates(data_2), col="grey", cex=.4, pch=16)
	points(coordinates(this_death_type), col="red", cex=.4, pch=16)
	title(death_type)
}


types <- unique(data$Cause_of_Death)

pdf(file="deaths-by-type.pdf")
for (i in types) {
	plot_by_type(i)
}
dev.off()

format(data$date, format="%Y")
data$year <- as.numeric(format(data$date, format="%Y"))
table(data$year)
aggregate(data$year, list(data$year), length)
deaths_by_year <- aggregate(data$year, list(data$year), length)
plot(deaths_by_year)
plot(deaths_by_year$Group.1, deaths_by_year$x)
plot(deaths_by_year$Group.1, deaths_by_year$x, type="l", ylim=c(0,300))



as.numeric(format(data$date, format="%Y"))

