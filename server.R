library(shiny)
library(data.table)

shinyServer(function(input, output, session) {
    
    # read data
    f1 <- reactive({
        d <- data.table(read.csv("Data/formula1.csv",stringsAsFactors=FALSE))
        d <- d[,list(Race,RaceNo,Pts,Pos,CumPts=cumsum(Pts)),by=list(Driver,Team,Season)][order(Season,RaceNo)]
        d$Pos <- factor(d$Pos,levels=c(1:24,"Ret","DNS","DNQ","NC","DSQ"))
        d
    })
    
    # observer to update input$race based on season selection
    observe({
        r <- f1()[Season==input$season,unique(Race)]
        updateSelectInput(session,"race",choices=r,selected=r[1])
    })
    
    # output standings table
    output$standingsTbl <- renderTable({
        d <- f1()[Season==input$season & Race==input$race][order(-CumPts)]
        d[1:nrow(d),list(Driver,Team,"Points to Date"=CumPts)]
    })
    
    # output race table
    output$raceTbl <- renderTable({
        d <- f1()[Season==input$season & Race==input$race][order(Pos)]
        d[1:nrow(d),list(Driver,Team,"Race Position"=Pos,Points=Pts)]
    })
    
})
