## final functions wich will be exported in the package

#'A RC class to create address objects
#'
#'@field address_or_coordinates A character address to look for OR A 2-lentghed numeric vector with longitude and latitude
#'
#'@details Please look at the vignette. 
#'@examples my_address<-address$new("Linkoping university")
#'@exportClass address
#'@export address

address<-setRefClass("address",fields=list(Coordinates="numeric",Formatted_Address="character",Components="data.frame"),
                     methods=list(
                       initialize=function(address_or_coordinates,...)
                       { 
                         if(is.character(address_or_coordinates)) # geocode, from address
                         { 
                           json<-lab5ab:::get_json_response_from_url(lab5ab:::create_url_from_address(address_or_coordinates,...))
                           Coordinates<<-lab5ab:::get_coordinates_from_json(json)
                           Formatted_Address<<-lab5ab:::get_formatted_address_from_json(json)
                           Components<<-lab5ab:::get_address_components_from_json(json)
                         }
                         else if(is.numeric(address_or_coordinates)&&length(address_or_coordinates)==2) # reverse geocode, from coordinates
                         {
                           json<-lab5ab:::get_json_response_from_url(create_url_from_coordinates(address_or_coordinates,...))
                           Coordinates<<-lab5ab:::get_coordinates_from_json(json)
                           Formatted_Address<<-lab5ab:::get_formatted_address_from_json(json)
                           Components<<-lab5ab:::get_address_components_from_json(json)
                         }
                         else {stop("You need to give either a character address or a numeric vector of length 2 with latitude and longitude")}
                       }
                       
                     ))