library(shiny)
library(bslib)
library(data.table)

source('functions.R')

data_versions <- data_versions_lists()


ui <- (navbarPage(
  "DE",
  theme = bslib::bs_theme(bootswatch = "cosmo",
                          bg = "#FFFFFF",
                          fg = "#00718f",
                          primary = "#00718f",
                          secondary = "#00718f"),
  tabPanel(
    "Tools",
    sidebarLayout(
      sidebarPanel(
        selectInput("file", "Choose TY", data_versions),
      ),
      mainPanel(
        tabsetPanel(
          tabPanel(
            "Graphs"
          ),
          tabPanel(
            "Tables"
          )
        )
      )
    )

  ),
  tabPanel("Guide"
  ),
  tabPanel("Documentation"
  ))
)
server <- function(input, output, session) {

}

shinyApp(ui, server)