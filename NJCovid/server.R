function(input,output){
  
  output$corcoef <- renderText({
    paste(cor(as.numeric(merged_df[,input$demographic]), as.numeric(merged_df[,input$covidstat])))
  })
  
  output$demoPlot <- renderPlotly({
    
    text = paste('county:', merged_df[['county']],
                 '<br>x: ', merged_df[[input$demographic]],
                 '<br>y: ', merged_df[[input$covidstat]])

      ggplotly(
        ggplot(merged_df, aes_string(x=as.name(input$demographic), y=as.name(input$covidstat))) +
          geom_point(aes(colour = county, text = text
          )) +
          labs(title = 'Covid-19 Statistics vs Demographics',
              x=names(demoMenu[which(demoMenu == input$demographic)]),
              y=names(statMenu[which(statMenu == input$covidstat)])),
        tooltip = 'text'
      )
  })
  
  output$rawtable <- renderDataTable(merged_df,
                                     options = list(scrollX = 500, scroller = TRUE))
  
}