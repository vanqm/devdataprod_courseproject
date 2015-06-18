library(shiny)
library(jsonlite)
library(ggplot2)

data(ToothGrowth)

shinyServer(
    function(input, output){
        output$newHist <- renderPlot({
            # 
            dose <- input$dose
            data <- ToothGrowth[ToothGrowth$dose == dose, ]
            
            supp <- input$supp
            numPlot <- 1
            if (supp == 'OJ'){
                data <- data[data$supp == 'OJ', ]
            } else if(supp == 'VC') {
                data <- data[data$supp == 'VC', ]
            } else {
                numPlot <- 2
                dataOJ <- data[data$supp == 'OJ', ]
                dataVC <- data[data$supp == 'VC', ]
            }
            
            par(mfrow = c(2, numPlot))
            #barplot(data$len)    
            if(numPlot == 1) {
                barplot(data$len, ylab = 'Length of teeth', ylim = c(0, 30), 
                        col = c(1:10), main = "Length of teeth vs Supp")
            } else {
                barplot(dataOJ$len, ylab = 'Length of teeth', ylim = c(0, 30), 
                        col = c(1:10), main = "Length of teeth vs Orange Juice")
                barplot(dataVC$len, ylab = 'Length of teeth', ylim = c(0, 30), 
                        col = c(1:10), main = "Length of teeth vs Ascorbic Acid")
            }
            
        })
    }
    )