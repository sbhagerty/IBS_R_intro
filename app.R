
library(shiny)
library(tidyverse)
ui <- fluidPage(

    # Application title
    titlePanel("Forbes Data Viewer"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("name", "Company Name: ",
                        unique(forbes$name))
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("Plot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$Plot <- renderPlot({
        forbes%>% gather(key="metric", value="value", sales, profits, assets, marketvalue)%>% filter(name == input$name) %>% ggplot()+geom_bar(aes(x=metric, y=value), stat='identity', fill='navy')+theme_economist()    })
}

# Run the application 
shinyApp(ui = ui, server = server)
