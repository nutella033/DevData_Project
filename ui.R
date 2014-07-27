library(shiny)
library(markdown)
source("modal.R")

shinyUI(fluidPage(
    
    titlePanel("Formula 1 Race Results"),
    
    sidebarLayout(
        
        sidebarPanel(width=2,
                     
            # Select input for season
            selectInput("season",
                        "Season:",
                        choices=c("2010","2011","2012")
            ),
            
            # Select input for race
            selectInput("race",
                        "Race:",
                        choices=NULL
            ),
            
            modal("helpModal","Help","Help",includeMarkdown("help.md"))
            
        ),
        
        mainPanel(
            
            fluidRow(
                
                # Output race results table
                column(width=6,
                    h5("Race Results"),
                    tableOutput("raceTbl")
                ),
                
                # Output championship standings table
                column(width=6,
                    h5("Championship Standings To Date"),
                    tableOutput("standingsTbl")   
                )
            )
        )
    )
))
