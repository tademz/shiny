#library(markdown)
library(shiny)
shinyUI(navbarPage("Navigation Bar",
                   
                   tabPanel("Documentation",
                            h2("Species Classification -"),
                            h6("In this app, we use the data from the 'IRIS' dataset to develop predictors of plant species given four 
                               predictor variables namely petal length and width and sepal length and width. The Random Forest and the Naive Bayes
                               prediction algorithms are considered.  The libraries 'randomForest' and 'e1071' 
                               are used in training the models.  The app is set up with a navigation bar which has two tabs. The first which is 
                               labeled 'Documentation' essentially describes what this app does. The second tab is for the main calculation.
                               The user is provided drop down menu for the 4 predictor variables and a choice of the classification algorithm.
                               There are fixed min and max values for the predictors with increments of 0.1. Upon pressing the submit button,
                               the prediction is displayed in the last row of the second panel.")
                   ),                  
                   
                   tabPanel("Main",
                            sidebarLayout(
                                    sidebarPanel(
                                            #numericInput('glucose', 'Glucose mg/dl', 90, min = 50, max = 200, step = 5),
                                            numericInput('sepal.length','Sepal.Length',5,min=2,max=10,step=0.1),
                                            numericInput('sepal.width','Sepal.Width',5,min=1,max=6,step=0.1),
                                            numericInput('petal.length','Petal.Length',5,min=0,max=8,step=0.1),
                                            numericInput('petal.width','Petal.Width',5,min=0,max=3,step=0.1),
                                            selectInput('method','Classification Algorithm',c("Random Forest","Naive Bayes")),
                                            submitButton('Submit')
                                    ),                                    
                                    mainPanel(
                                            h3('Results of prediction'),
                                            h4('You entered Sepal Length'),
                                            verbatimTextOutput("inputValue1"),
                                            h4('and Sepal Width'),
                                            verbatimTextOutput("inputValue2"),
                                            h4('and Petal Length'),
                                            verbatimTextOutput("inputValue3"),
                                            h4('and Petal Width'),
                                            verbatimTextOutput("inputValue4"),
                                            h4('and the Classification Algorithm'),
                                            verbatimTextOutput('inputValue5'),
                                            h4('Which resulted in a Species prediction of '),
                                            verbatimTextOutput("prediction")
                                    )                                    
                            )
                   )
))