## final functions wich will be exported in the package

#'A RC class to create address objects
#'
#'@field address A character address to look for
#'@field latlong A 2-lentghed numeric vector with longitude and latitude
#'
#'
#'@exportClass address
#'@export address

address<-setRefClass("address",fields=list(Coordinates="numeric",Formatted_Address="character",Components="data.frame"),
                     methods=list(
                       initialize=function(address_or_coordinates)
                       { 
                         if(is.character(address_or_coordinates)) # geocode, from address
                         { 
                           json<-get_json_response_from_url(create_url_from_address(address_or_coordinates))
                           Coordinates<<-get_coordinates_from_json(json)
                           Formatted_Address<<-get_formatted_address_from_json(json)
                           Components<<-get_address_components_from_json(json)
                         }
                         else if(is.numeric(address_or_coordinates)&&length(address_or_coordinates)==2) # reverse geocode, from coordinates
                         {
                           json<-get_json_response_from_url(create_url_from_coordinates(address_or_coordinates))
                           Coordinates<<-get_coordinates_from_json(json)
                           Formatted_Address<<-get_formatted_address_from_json(json)
                           Components<<-get_address_components_from_json(json)
                         }
                         else {stop("You need to give either a character address or a numeric vector of length 2 with latitude and longitude")}
                       }
                       
                     ))