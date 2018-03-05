#Libraries
library(dplyr)
library(tidyverse)
library(ggplot2)

#Removing zeros that contains on both reviews and overall_satisfacation
AirbnbData_Clean<- filter(AirbnbData, reviews!=0 & overall_satisfaction!=0.0)

#Deleting Columns that aren't necessary
AirbnbData_Clean$survey_id <- NULL
AirbnbData_Clean$country<- NULL
AirbnbData_Clean$last_modified<- NULL
AirbnbData_Clean$latitude<- NULL
AirbnbData_Clean$longitude<- NULL
AirbnbData_Clean$location<- NULL
AirbnbData_Clean$borough<- NULL
AirbnbData_Clean$host_id<- NULL
AirbnbData_Clean$room_id<- NULL

#Assuming in each house rather private room or full house has only one bathroom
AirbnbData_Clean$bathrooms[is.na(AirbnbData_Clean$bathrooms)]<-1

#Assuming people average stay using Airbnb 4 nights
AirbnbData_Clean$minstay[is.na(AirbnbData_Clean$minstay)]<-4

#Assuming bedrooms as an average is 2
is.na(AirbnbData_Clean) <- !AirbnbData_Clean
AirbnbData_Clean$bedrooms[is.na(AirbnbData_Clean$bedrooms)]<-2

#Multipling the days with the price to have the total
AirbnbData_Clean$Total<-AirbnbData_Clean$price*AirbnbData_Clean$minstay

#Average price for 4 days 
mean(AirbnbData_Clean$Total)

#Max with the good raiting and higest price
max(AirbnbData_Clean$Total, AirbnbData_Clean$reviews)

plot(AirbnbData_Clean$reviews, AirbnbData_Clean$overall_satisfaction)

pie(table(AirbnbData_Clean$overall_satisfaction))

barplot(table(AirbnbData_Clean$overall_satisfaction))
