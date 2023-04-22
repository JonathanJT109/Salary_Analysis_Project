# Load the required libraries
library(shiny)
library(shinydashboard)

source("components/home.R")
source("components/by_major.R")
source("components/by_region.R")
source("components/by_college.R")
source("components/sidebar.R")

# Header
header <- dashboardHeader(title = "Salaries")

# Body
body <- dashboardBody(
    tags$head(
        tags$link(
            rel = "stylesheet", type = "text/css",
            href = "css/styles.css"
        )
    ),
    tabItems(
        home_page,
        major_general_page,
        major_specific_page,
        region_page,
        college_page
    )
)

dashboardPage(
    skin = "red",
    header = header,
    sidebar = sidebar,
    body = body
)
