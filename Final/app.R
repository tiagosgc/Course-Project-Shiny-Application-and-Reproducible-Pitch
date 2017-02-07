#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Guess the Number - the game. YAY"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("guess",
                     "Place your Guess",
                     min = 1,
                     max = 100,
                     value = NULL),
         
         radioButtons("radio", "Select Action", c("Play","Restart"), selected = "Play", inline = FALSE,
                      width = NULL),
         submitButton("Guess! ", icon=icon("share"))
         #actionButton("reset","Reset the App")
         #"guessBtn", 
        ), 
      
      mainPanel(
         h1("Instructions on how to play:"),
         tags$ol(
             tags$li("Choose the reset radio button and submit to start playing"), 
             tags$li("Just slide the slider to your guess."), 
             tags$li("Learn if you are higher or lower than the random number generated"),
             tags$li("Try to get there in 7 or less tries. Should be doable. Good luck.")
         ),
         #h1(textOutput("distText")),
         #h1(textOutput("tries"))
         h2(textOutput("title")),
         #p(textOutput("debug")),
         p(textOutput("text7")),
         p(textOutput("text6")),
         p(textOutput("text5")),
         p(textOutput("text4")),
         p(textOutput("text3")),
         p(textOutput("text2")),
         p(textOutput("text1"))
         
         
         
      )
   )
)

debug <- function(guessArg,radioArg) {
    c(guessArg,"remaining:",remainingTriesStatic, " target:",target, "radio:", radioArg)
}
displayLog<- function(guessArg,level,radioArg)
{
    radioArg
    guessArg
    logg[level]
}

updateGuess <- function(guessArg, radioArg) {
    #values$remainingTries <-values$remainingTries+ 1 
    #if (remainingTriesStatic==8) {
    #    remainingTriesStatic <<- remainingTriesStatic -1
    #    return
    #}
    guessArg
    if (first==1) {
        first<<-0
        c(remainingTriesStatic," tries remaining")
    } else {
    if (radioArg == "Restart") {
        init(7,0)
        #c(remainingTriesStatic," tries remaining")
        c(remainingTriesStatic," tries remaining")
    }
    else {
        if (guessed == 1)
        {
            "You already guessed, please stop poking the slider"
        } else {
            if (remainingTriesStatic==0) {
                "Game Over - Please stop poking the slider"
            }
            else 
            {
                if (guessArg < target) {
                    newString<- paste(c(remainingTriesStatic,": ",guessArg, " is too LOW"),collapse='')
                }
                if (guessArg > target) {
                    newString<- paste(c(remainingTriesStatic,": ",guessArg, " is too HIGH"),collapse='')
                }
                if (guessArg == target) {
                    newString<- paste(c("Congratulations, you just guessed the right number: ",target),collapse = '')
                    guessed <<- 1 
                }
                logg[remainingTriesStatic] <<- newString
                remainingTriesStatic <<- remainingTriesStatic -1
                #values$remainingTries <- values$remainingTries#values$remainingTries#- 1 
                c(remainingTriesStatic," tries remaining")
            }
        }
    }}
    
}

server <- function(input, output) {
    #observeEvent(input$reset, {
    #    output$title <- renderText({updateGuess(input$guess)})
    #    remainingTriesStatic<-7 
    #})
    #output$restart <- eventReactive(input$reset,
    #              {
    #                remainingTriesStatic<-7
    #                '.'
    #              })
    output$title <- renderText({updateGuess(input$guess, input$radio)})
    #output$debug <- renderText({debug(input$guess, input$radio)})
    output$text7 <-  renderText({displayLog(input$guess,7, input$radio)})
    output$text6 <-  renderText({displayLog(input$guess,6, input$radio)})
    output$text5 <-  renderText({displayLog(input$guess,5, input$radio)})
    output$text4 <-  renderText({displayLog(input$guess,4, input$radio)})
    output$text3 <-  renderText({displayLog(input$guess,3, input$radio)})
    output$text2 <-  renderText({displayLog(input$guess,2, input$radio)})
    output$text1 <-  renderText({displayLog(input$guess,1, input$radio)})
    
    
    
}
init <- function(remaining, first) {
    guessed<<-0
    remainingTriesStatic <<- remaining
    target<<-as.integer(runif(1,1,100))
    logg<<-c(rep("",7))
    first<<-first
}
init(7,1)
#labels[2] <- "label 2"
#labels[3] <- "label 3"
#labels[4] <- "label 4"
#labels[5] <- "label 5"
#labels[6] <- "label 6"
#labels[7] <- "label 7"
shinyApp(ui = ui, server = server)


