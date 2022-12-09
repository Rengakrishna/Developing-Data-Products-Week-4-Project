library(shiny)
library(shiny)
library(shinythemes)
library(data.table)
library(RCurl)
library(randomForest)
#data
data(iris)
# model
model<- randomForest(Species ~., data=iris, method="rf",ntree=500,ntry=4)
ui <- sidebarPanel(
  
  
  
  # Page header
  
  headerPanel('Iris Predictor'),
  
  
  
  # Input values
  
  sidebarPanel(
    
    HTML("<h3>Input parameters</h4>"),
    
    sliderInput("Sepal.Length", label = "Sepal Length", value = 5.0,
                
                min = min(iris$Sepal.Length),
                
                max = max(iris$Sepal.Length)
                
    ),
    
    sliderInput("Sepal.Width", label = "Sepal Width", value = 3.6,
                
                min = min(iris$Sepal.Width),
                
                max = max(iris$Sepal.Width)),
    
    sliderInput("Petal.Length", label = "Petal Length", value = 1.4,
                
                min = min(iris$Petal.Length),
                
                max = max(iris$Petal.Length)),
    
    sliderInput("Petal.Width", label = "Petal Width", value = 0.2,
                
                min = min(iris$Petal.Width),
                
                max = max(iris$Petal.Width)),
    
    
    
    actionButton("submitbutton", "Submit", class = "btn btn-primary")
    
  ),
  
  
  
  mainPanel(
    
    tags$label(h3('Status/Output')), # Status/Output Text Box
    
    verbatimTextOutput('contents'),
    
    tableOutput('tabledata') # Prediction results table
    
    
    
  )
  
)
