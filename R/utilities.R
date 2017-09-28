#functions needed for development but won't be exported

add_api_key_to_url<-function(url) #simply adds my api key to a google api request at the end
{
  return(paste0(url,"AIzaSyApGO2vCAE8dw7MhpKN2esy7cIDxtk8PiY"))
}

get_json_response_from_url<-function(url){ #takes raw response from server. we may need to clean it
  require(httr)
  #clean data ? remove first elements of the list maybe
  
  return(GET(url))
}

url<-add_api_key_to_url("https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=")





display_json<-function(){ # prints the entire json a nice way 
  
}
