library(shiny)


server<-function(input, output) {
  require(lab5ab)
  
  
  output$user_input<-renderUI({
    if(input$method=="Address"){
    return(textInput("address",label="Address",value="Linkoping"))}
    if(input$method=="Latitude/Longitude")
    {return(numericInput("latitude","Latitude",0))}
  })
  output$user_input2<-renderUI({
    if(input$method=="Address"){
      return()}
    if(input$method=="Latitude/Longitude")
    {return(numericInput("longitude","Longitude",0))}
  })
  
   a<-reactive({
   if(input$method=="Address"&&!is.null(input$address)&&!input$address=="")
   {return(address$new(input$address))}
   else if(input$method=="Latitude/Longitude"&&(input$latitude!=0)&&(input$longitude!=0)&&!is.null(input$latitude)&&!is.null(input$longitude)&&!is.na(input$latitude)&&!is.na(input$longitude)) #conditions used so the api request isn't done when fields are empty or with 0 values
   {return(address$new(c(input$latitude,input$longitude) ))}
     return()
   })
   
   output$data_table<-renderTable(a()$Components)
   output$sentence<-renderText("Latitude Longitude:")
   output$coordinates<-renderText(a()$Coordinates)
   output$sentence2<-renderText("Formatted Address:")
   output$formatted<-renderText(a()$Formatted_Address[1])
   
  
}

