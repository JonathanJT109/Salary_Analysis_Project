region_page <- tabItem(
    tabName = "region",
    fluidRow(
        column(4, selectInput("variable2", "Select variable:", choices = names(iris))),
        column(8, sliderInput("num_rows", "Number of rows", min = 1, max = 100, value = 10)),
        box(plotOutput("plot2"), width = 12)
    )
)
