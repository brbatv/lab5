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
                       initialize=function(address=NULL,latlong=NULL)
                       { 
                         if(is.character(address)&&is.null(latlong)) # geocode, from address
                         { 
                           json<-get_json_response_from_url(create_url_from_address(address))
                           Coordinates<<-get_coordinates_from_json(json)
                           Formatted_Address<<-get_formatted_address_from_json(json)
                           Components<<-get_address_components_from_json(json)
                         }
                         else if(is.null(address)&&is.numeric(latlong)&&length(latlong)==2) # reverse geocode, from coordinates
                         {
                           json<-get_json_response_from_url(create_url_from_coordinates(latlong))
                           Coordinates<<-get_coordinates_from_json(json)
                           Formatted_Address<<-get_formatted_address_from_json(json)
                           Components<<-get_address_components_from_json(json)
                         }
                         else {stop("You need to give one and only one input. address must be a character. latlong must be a numeric of length 2")}
                       }
                     ))