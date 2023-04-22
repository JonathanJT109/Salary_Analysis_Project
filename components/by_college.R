college_page <- tabItem(
    tabName = "college",
    fluidRow(
        column(4, selectInput("y_var", "Y value", choices = names(iris))),
        column(8, sliderInput("num_rows", "Number of rows", min = 1, max = 100, value = 10)),
        box(plotOutput("test"), width = 12)
    )
)
