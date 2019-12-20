library(shiny)
library(leaflet)
library(shinythemes)
library(dplyr)

# Define UI for application
shinyUI(fluidPage(
  
  # Change theme to flatly
  theme = shinytheme("flatly"),
  
  # Application title
  titlePanel("20 Schools in the U.S. to Pursue a Data Science Masters Degree, from Towards Data Science"),
  
  # Three sidebars for uploading files, selecting time slots and districts
  
    sidebarPanel(
      
      # Create a file input
      fileInput("file","Please choose the designated CSV File for this project",
                multiple = TRUE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
              ".csv"))
      
      
    ),
      
      
      hr(),
      helpText("This project reads CSV data on locations of top graudate-level programs for data science in the United States, adapted from an article in Towards Data Science online. It is a useful tool for students intending to pursue a master's degree in the field. This project is also designed to demonstrate the author's proficiency in developing a basic R Shiny app."),
      hr(),
      helpText("Please select the corresponding CSV file for this Shiny App. You can refer to the URL shown below to see the list of schools and their programs:"),
    
      helpText("https://towardsdatascience.com/20-universities-for-pursuing-master-of-science-in-data-science-on-campus-in-the-usa-2018-9970d5d25bd5"),
      
      hr(),
      hr(),
      
    
     
    # Make the sidebar to right of webpage
    position = "right",
    fluid = TRUE,
    
  
    # Show tab features
  
    
  
    
    # Show the map in the tab panel
    mainPanel(
      hr(),
      tabsetPanel(type="tabs",
                  tabPanel("Map", leafletOutput("map", height=630)),
                  
          # Other informational tabs         
          #tabPanel("Title of Masters", verbatimTextOutput("degreeName")),
          tabPanel("Detailed Degree Info", dataTableOutput("mytable"))
    
    
                  
                  
                  
      )
    )
  )
)