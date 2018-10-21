#### Visualizing where departures trips are located from this dataset from UBER NY ####

# Libraries
library(ggplot2)
library(tidyverse)
library(ggplot2)
library(RCurl)

# Dataset
data<-read.csv(text=getURL("https://raw.githubusercontent.com/fivethirtyeight/uber-tlc-foil-response/master/uber-trip-data/uber-raw-data-sep14.csv"), sep=",", header=T)

# First approach
mapdata <- ggplot()+
  geom_point(data=data, 
             aes(x=Lon, y=Lat), 
             fill="Deep Pink",pch=21, size=.7, alpha=I(0.7))
mapdata

# At first glance we can see huge concentration in the Manhattan Island and surroundings. 
# If we wanna have a clear picture on the biggest concentration of trips in New York we will have to adjust some parameters. 
# To do so, we will use the outputs from the function distribution provided by the function "summary"

summary(data$Lat)       
summary(data$Lon)

# Now that we know the distributions, we are going to adjust the parameters:
mapdata2 <- ggplot(data=data, aes(x=Lon, y=Lat))+
  geom_point(color="white", size=0.03) +
            scale_x_continuous(limits=c(-74.5, -73.5)) +
            scale_y_continuous(limits=c(40.5, 41.2)) +
            theme_dark()
mapdata2

# And if we adjust the zoom a little bit more, we change the plot parameters, and we get:
mapdata3 <- ggplot(data=data, aes(x=Lon, y=Lat))+
  geom_point(color="white", size=0.02, alpha=I(0.7)) +
            scale_x_continuous(limits=c(-74.05, -73.85)) +
            scale_y_continuous(limits=c(40.6, 40.9)) +
            theme_dark()          
mapdata3

# My final recommendation for Uber would be to concentrate drivers in the island of Manhattan, Brooklyn, and the riverside of New Jersey.




