#functions needed for development but won't be exported

add_api_key_to_url<-function(url) #simply adds my api key to a google api request at the end
{
  return(paste0(url,"AIzaSyApGO2vCAE8dw7MhpKN2esy7cIDxtk8PiY"))
}

get_json_response_from_url<-function(url){ #takes raw response from server. we may need to clean it
  require(httr)
  #clean data ? remove first elements of the list maybe
  

  return(content(GET(url)))

  return(fromJSON(content(GET(url),as="text")))

}

url<-add_api_key_to_url("https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=")


#geocoding
create_url_from_address<-function(address,...)
{
  
  #take an argument and convert it into + format
  convert.delimiter <- function (string, old=" ", new = "+")
  {
    paste (unlist (strsplit (string, old)), collapse=new)
  }
  
  address_n<-convert.delimiter(address)
  url <-paste0("https://maps.googleapis.com/maps/api/geocode/json?address=", address_n)
  
  if(missing(...)) {
    
    return(url)
    
  } else {
    
    options<-lapply(list(...),convert.delimiter)
    options_wname<-paste(names(options),options,sep="=",collapse=",")
    options_past<- paste(unlist (strsplit (options_wname, ",")), collapse="&")
    
    details <-paste(address_n, options_past ,sep="&",collapse=",")
    url_n <-paste0("https://maps.googleapis.com/maps/api/geocode/json?address=",details)
    
    return(url_n)
    
  }
}


#reverse geocoding
create_url_from_coordinates<-function(long,lat,...)
{
  convert.delimiter <- function (string, old=" ", new = "+")
  {
    paste (unlist (strsplit (string, old)), collapse=new)
  }
  
  latlng<-paste(lat,long,sep=",")
  
  url <-paste0("https://maps.googleapis.com/maps/api/geocode/json?latlng=", latlng)
  
  if(missing(...)) {
    
    return(url)
    
  } else {
    
    options<-lapply(list(...),convert.delimiter)
    options_wname<-paste(names(options),options,sep="=",collapse=",")
    options_past<- paste(unlist (strsplit (options_wname, ",")), collapse="&")
    
    details <-paste(latlng, options_past ,sep="&",collapse=",")
    url_n <-paste0("https://maps.googleapis.com/maps/api/geocode/json?latlng=",details)
    
    return(url_n)
    
  }
}

display_json<-function(){ # prints the entire json a nice way 
  
}
