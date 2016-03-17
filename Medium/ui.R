library(shiny)
library(ggplot2)
library(productplots)
shinyUI(fluidPage(
  title = 'Mosaic plots on the Happy Dataset',
  sidebarLayout(
    sidebarPanel(
        checkboxGroupInput('disp_vars', 'Columns to show',
                           names(happy[2:length(happy)]), selected = names(happy)[c(2,5,6)]),
        checkboxGroupInput('cond_vars', 'Conditional Joint',
                           names(happy[2:length(happy)]))
    ),
    mainPanel(plotOutput("prodplot"))
  )
))