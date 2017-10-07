## ----include=FALSE-------------------------------------------------------
library(devtools)
install_github("brbatv/lab5",force=TRUE)
library(lab5ab)
address_or_coordinates<-"Paris"

## ----results="hide"------------------------------------------------------

my_address<-address$new(address_or_coordinates)

## ----eval=FALSE----------------------------------------------------------
#  
#  my_address<-address$new("Toledo",region="ES")
#  my_address<-address$new("Santa Cruz",components="country:ES")

## ------------------------------------------------------------------------
#Search by address
my_address<-address$new("33 av des champs elysees Paris")
my_address$Formatted_Address
my_address$Components
my_address$Coordinates


## ------------------------------------------------------------------------
#Search by coordinates
my_address<-address$new(c(58.39784,15.57601))
my_address$Formatted_Address
my_address$Components
my_address$Coordinates


