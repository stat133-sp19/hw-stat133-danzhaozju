#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Saving Simulations"),
   
   fluidRow(
     column(4,sliderInput("initial_amount",
                          "Initial Amount",
                          min = 0,
                          max = 100000,
                          value = 1000,
                          step = 500),
            sliderInput("annual_contribution",
                        "Annual Contribution",
                        min = 0,
                        max = 50000,
                        value = 2000,
                        step = 500)
            ),
     column(4,sliderInput("return_rate",
                          "Return Rate (in %)",
                          min = 0,
                          max = 20,
                          value = 5,
                          step = 0.1),
            sliderInput("growth_rate",
                        "Growth Rate (in %)",
                        min = 0,
                        max = 20,
                        value = 2,
                        step = 0.1)
            ),
     column(4,sliderInput("years",
                          "Years",
                          min = 0,
                          max = 50,
                          value = 20,
                          step = 1),
            selectInput("facet",
                        "Facet?",
                        choices = list("No"=FALSE,"Yes"=TRUE),
                        selected = FALSE)
            )
   ),
   
   h4("Timelines"),
   plotOutput("timelines"),
   
   h4("Balances"),
   tableOutput("balances")
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  modalities <- reactive({
    initial_amount = input$initial_amount
    annual_contribution = input$annual_contribution
    return_rate = input$return_rate/100
    growth_rate = input$growth_rate/100
    total_years = input$years
    
    #' @title Future Value
    #' @description computes the future value of an investment
    #' @param amount initial invested amount
    #' @param rate annual rate of return
    #' @param years number of years
    #' @return future value
    future_value <- function(amount, rate, years){
      fv = amount*(1+rate)^years
      return(fv)
    }
    
    #' @title future value of annuity
    #' @description computes the future value of annuity
    #' @param contrib contributed amount
    #' @param rate annual rate of return
    #' @param years number of years
    #' @return future value of annuity
    annuity <- function(contrib,rate,years){
      fva = contrib*((1+rate)^years-1)/rate
      return(fva)
    }
    
    #' @title growing annuity
    #' @description computes the future value of growing annuity
    #' @param contrib contributed amount
    #' @param rate annual rate of return
    #' @param growth annual growth rate
    #' @param years number of years
    #' @return future value of annuity
    growing_annuity <- function(contrib, rate, growth, years){
      fvga <- contrib * ((1+rate)^years-(1+growth)^years) / (rate-growth)
      return(fvga)
    }
    
    year = 0:total_years
    no_contrib = rep(0, length(year))
    fixed_contrib = rep(0, length(year))
    growing_contrib = rep(0, length(year))
    for (i in 1:length(year)){
      no_contrib[i] = future_value(amount = initial_amount, rate = 0.05, years = year[i])
      fixed_contrib[i] = no_contrib[i] + annuity(contrib = annual_contribution, rate = return_rate, years = year[i])
      growing_contrib[i] = no_contrib[i] + 
        growing_annuity(contrib = annual_contribution, rate = return_rate, growth = growth_rate, years = year[i])
    }
    
    modalities = data.frame(year, no_contrib, fixed_contrib, growing_contrib)
    return (modalities)
  })
  
   output$timelines <- renderPlot({
     if (input$facet==FALSE){
       ggplot(data = modalities(), aes(x=year))+
         geom_line(aes(y=no_contrib,color='no_contrib'),linetype=1,size=1)+
         geom_point(aes(y=no_contrib,color='no_contrib'))+
         geom_line(aes(y=fixed_contrib,color='fixed_contrib'),linetype=1,size=1)+
         geom_point(aes(y=fixed_contrib,color='fixed_contrib'))+
         geom_line(aes(y=growing_contrib,color='growing_contrib'),linetype=1,size=1)+
         geom_point(aes(y=growing_contrib,color='growing_contrib'))+
         labs(x="year",y="value",title="Three modes of investing")+
         scale_colour_manual("Modality",
                             breaks = c('no_contrib','fixed_contrib','growing_contrib'),
                             values = c('no_contrib'='red','fixed_contrib'='green','growing_contrib'='blue'))
     }else{
       year = modalities()$year
       no_contrib = modalities()$no_contrib
       fixed_contrib = modalities()$fixed_contrib 
       growing_contrib = modalities()$growing_contrib
       new_modalities <- data.frame(modes = factor(rep(c('no_contrib','fixed_contrib','growing_contrib'),each=input$years+1),
                                                   levels = c('no_contrib','fixed_contrib','growing_contrib')),
                                    year = rep(year,3),
                                    value = c(no_contrib, fixed_contrib, growing_contrib))
       ggplot(data = new_modalities, aes(x = year,y = value,colour=modes,fill=modes))+
         facet_grid(.~modes)+
         geom_line()+
         geom_point()+
         labs(title="Three modes of investing")+
         scale_colour_brewer(palette = "Set1", name = "variable")+
         geom_area(alpha=0.3)+
         scale_fill_brewer(palette = "Set1", name = "variable")
     }
   })
   
   output$balances <- renderTable({
     modalities()
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

