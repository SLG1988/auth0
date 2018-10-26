library(shiny)
library(auth0)
library(shinyjs)

# configuration file generated by auth0::use_auth0()
# set as global variable
config_file <<- "_auth0.yml"

# simple UI with action button
# note that you must include shinyjs::useShinyjs() for this to work
ui <- fluidPage(shinyjs::useShinyjs(), actionButton("logout_auth0", "Logout"))

# server with one observer that logouts
server <- function(input, output, session) {
  observeEvent(input$logout_auth0, {
    # javascript code redirecting to correct url
    js <- auth0_logout_url(config_file)
    shinyjs::runjs(js)
  })
}

shinyAuth0App(ui, server, config_file)