#functions needed for development but won't be exported

# URL PART 
add_api_key_to_url<-function(url) #simply adds my api key to a google api request at the end
{
  return(paste0(url,"&key=AIzaSyApGO2vCAE8dw7MhpKN2esy7cIDxtk8PiY"))
}

get_json_response_from_url<-function(url){ #takes json response frome server
  require(httr)
  require(jsonlite)
  
  #return(content(GET(url)))
  json<-fromJSON(content(GET(url),as="text"))
  if(json$status!="OK"){stop("Didn't find anything or request rejected from server")}
  return(json)

}

url<-add_api_key_to_url("https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA")

#takes a string, splits it where it find old char and replace it with new
convert.delimiter <- function (string, old=" ", new = "+")
{
  return(paste (unlist (strsplit (string, old)), collapse=new))
}

#geocoding
create_url_from_address<-function(address,...)
{
   address_n<-convert.delimiter(address)
  url <-paste0("https://maps.googleapis.com/maps/api/geocode/json?address=", address_n)
  
  if(missing(...)) {
    
    return(add_api_key_to_url(url))
    
  } else {
    
    options<-lapply(list(...),convert.delimiter)
    options_wname<-paste(names(options),options,sep="=",collapse=",")
    options_past<-paste(unlist (strsplit (options_wname, ",")), collapse="&")
    options_past<- convert.delimiter(options_wname,old=",",new="&") 
    details <-paste(address_n, options_past ,sep="&",collapse=",")
    url_n <-paste0("https://maps.googleapis.com/maps/api/geocode/json?address=",details)
    
    return(add_api_key_to_url(url_n))
    
  }
}


#reverse geocoding
create_url_from_coordinates<-function(latlong,...)
{
 
  
  latlng<-paste(latlong,collapse=",")
  
  url <-paste0("https://maps.googleapis.com/maps/api/geocode/json?latlng=", latlng)
  
  if(missing(...)) {
    
    return(add_api_key_to_url(url))
    
  } else {
    
    options<-lapply(list(...),convert.delimiter)
    options_wname<-paste(names(options),options,sep="=",collapse=",")
    options_past<- paste(unlist (strsplit (options_wname, ",")), collapse="&")
    
    details <-paste(latlng, options_past ,sep="&",collapse=",")
    url_n <-paste0("https://maps.googleapis.com/maps/api/geocode/json?latlng=",details)
    
    return(add_api_key_to_url(url_n))
    
  }
}

# DISPLAY PART
get_formatted_address_from_json<-function(json) # gives back formatted address string
{
  return(json$results$formatted_address)
}

get_address_components_from_json<-function(json) # gives back adress components dataframe
{ a<-json$results$address_components[[1]]
  a[3]<-sapply(a[[3]],function(x) x[1]) # removes "political" in types field (useless) 
  return(a) 
} 
get_coordinates_from_json<-function(json) #gives back numeric vector with longitude and latitude 
{
  output<-as.numeric(json$results$geometry$location[1,])
  names(output)=c("Latitude","Longitude")
  return(output)
}

a<-get_json_response_from_url(create_url_from_address("2 sq de tocqueville 78150 chesnay"))
b<-get_json_response_from_url(create_url_from_coordinates(c(12,12)))
