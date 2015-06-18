library(shiny)
library(jsonlite)

shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("The length of odontoblasts (teeth)"),
        sidebarPanel(
            h5('The response is the length of odontoblasts (teeth) in each of 10 guinea pigs at each of three dose levels of
Vitamin C (0.5, 1, and 2 mg) with each of two delivery methods (orange juice or ascorbic acid).'),
            #numericInput('id', 'Add Straight Line to plot (1: Yes, 0: No)', 0, min = 0, max = 1, step = 1),
            radioButtons("dose", 'Levels of Vitamin C', 
                         c("0.5 mg" = "0.5",
                         "1.0 mg" = "1",
                         "2.0 mg" = "2")),
            radioButtons("supp", 'Method', 
                         c("Orange Juice"                  = "OJ",
                           "Ascorbic Acid"                 = "VC",
                           "Orange Juice vs Ascorbic Acid" = "OJ_VC"))
            #submitButton('Submit')
            ),
        mainPanel(
            plotOutput('newHist')
            )
        )
    )
