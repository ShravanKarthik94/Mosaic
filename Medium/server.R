library(shiny)
library(ggplot2)
library(productplots)

shinyServer(function(input, output) {
  
  happynew = happy[complete.cases(happy),]
  output$prodplot = reactivePlot(function(){
    if(length(input$disp_vars) > 0)
    {
      expression = "prodplot(happynew,~"
      expression = paste(expression,input$disp_vars[1])
      if(length(input$disp_vars) > 1 ){
      for(x in 2 : length(input$disp_vars))
      {
        expression = paste(expression,"+",input$disp_vars[x])
      }
      }
    }
    else
      return()
    if(length(input$cond_vars) > 0)
    {
      expression =  paste(expression,"|",input$cond_vars[1])
      if(length(input$cond_vars) > 1 ){
      for(x in 2 : length(input$cond_vars))
      {
        expression = paste(expression,"+",input$cond_vars[x])
      }
      }
    }
    if(length(input$disp_vars) > 0)
    {
      expression = paste(expression,",c('hspine'")
      if(length(input$disp_vars) > 1 ){
      for(x in 2 : length(input$disp_vars))
      {
        if(x %% 2 == 1)
          expression = paste(expression,",'hspine'")
        else
          expression = paste(expression,",","'vspine'")
      }
      }
      if(length(input$cond_vars) > 0)
      {
      expression = paste(expression,",'hspine'")
      if(length(input$cond_vars) > 1 ){
      for(x in 2 : length(input$cond_vars))
      {
        {
          if(x %% 2 == 1)
        expression = paste(expression,",'hspine'")
        else
          expression = paste(expression,",","'vspine'")
        }
      }
      }
      }
      expression = paste(expression,"))")
    }
    print(expression)
    eval(parse(text = expression))
  })
})