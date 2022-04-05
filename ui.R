## ui.R
library(shiny)
library(shinydashboard)
library(recommenderlab)
library(data.table)
library(ShinyRatingInput)
library(shinyjs)

source('functions/helpers.R')

shinyUI(
    dashboardPage(
          skin = "black",
          dashboardHeader(),
          # dashboardHeader(title = span(
          #   tags$img(src="EXUSlogo.jpg", width = '70%'))),
          
          dashboardSidebar(disable = TRUE),

          dashboardBody(includeCSS("css/books.css"),
              fluidRow(
                  box(width = 12, title = "Step 1: Rate as many books as possible",  solidHeader = TRUE, collapsible = TRUE,
                      div(class = "rateitems",
                          uiOutput('ratings')
                      )
                  )
                ),
              fluidRow(
                  useShinyjs(),
                  box(
                    width = 12, solidHeader = TRUE,
                    title = "Step 2: Discover books you might like",
                    br(),
                    withBusyIndicatorUI(
                      actionButton("btn", "Click here to get your recommendations")
                    ),
                    br(),
                    tableOutput("results")
                  )
               )
          )
    )
) 