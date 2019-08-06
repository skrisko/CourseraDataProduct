## First we load the library

library(ggplot2)

function(input, output) {
  
  ## We select the number of element by the sample size given in the ui part
  dataset <- reactive({
    mtcars[sample(nrow(mtcars), input$sampleSize),]
  })
  
  ## Render plot to make the plot in shiny
  output$plot <- renderPlot({
    
    ## This plot is made with ggplot we construct the basic plot and add thing if they are selected on the ui
    p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
    
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)
    
    if (input$smooth)
      p <- p + geom_smooth()
    
    print(p)
    
  })
  
}

