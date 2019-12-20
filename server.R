options(shiny.maxRequestSize=30*1024^2)
library(shiny)
library(leaflet)
library(dplyr)

# Define server that plots locations of 20 top data science programs in U.S.
shinyServer(function(input, output) {
  
  
  output$text <- renderText({
    
    "This project reads CSV data on locations of top graudate-level programs for data science in the United States, adapted from an article in Towards Data Science online. It is a useful tool for students intending to pursue a master's degree in the field. This project is also designed to demonstrate the author's proficiency in developing a basic R Shiny app."
    
  })
  
  # Output variable for Title of Master's Degree
  
  #output$degreeName <- tableOutput("Title of Masters")
  
  
  
  # Create a map output variable
  output$map <- renderLeaflet({
    
    # Connect to the sidebar of file input
    inFile <- input$file
    
    if(is.null(inFile))
      return(NULL)
    
    # Read input file
    mydata <- read.csv(inFile$datapath)
    attach(mydata)
    
    
    # Create the leaflet function for data
    leaflet(mydata) %>%
      
      # Set the default view
      setView(lng = -97.922211, lat = 39.381266, zoom = 3) %>%
       
      # Provide tiles
      addProviderTiles("CartoDB.Positron", options = providerTileOptions(noWrap = TRUE)) %>%
      
      # Add circles
      addCircleMarkers(
        radius = 10,
        lng= mydata$Longitude,
        lat= mydata$Latitude,
        stroke= FALSE,
        fillOpacity=0.3)
        
       
  })
  
  output$mytable <- renderDataTable({
    
    # Connect to the sidebar of file input
    inFile <- input$file
    
    if(is.null(inFile))
      return(NULL)
    
    # Read input file
    mydata <- read.csv(inFile$datapath)
    attach(mydata)
    
    mynewdata <- mydata %>%
      select("SchoolName","TitleofMasters", "LengthofDegreeinYears", "Location")
    mynewdata
    
    
  })
})