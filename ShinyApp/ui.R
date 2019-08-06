## First we charge the library ad the dataset

library(ggplot2)

dataset <- mtcars

fluidPage(
  
  title = "Mtcars plot",
  
  plotOutput('plot'),
  
  hr(),
  
  fluidRow(
    ## This build a slider that allow to select the number of data you want to include in the graph
    column(3,
           h4("Mtcars Exploratory Data Analysis"),
           sliderInput('sampleSize', 'Sample Size', 
                       min=1, max=nrow(dataset),
                       value=min(1, nrow(dataset)), 
                       step=1, round=0),
    ## This create a check box to ask if you want to see a linear regression on the graph
           br(),
           checkboxInput('smooth', 'Smooth')
    ),
    ## Next column, in this column we can select the data for the x, y and the color of the graph
    column(4, offset = 1,
           selectInput('x', 'X', names(dataset)),
           selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
           selectInput('color', 'Color', c('None', names(dataset)))
    )
  )
)

