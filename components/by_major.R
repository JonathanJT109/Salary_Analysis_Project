major_general_page <- tabItem(
    tabName = "major_general",
    fluidRow(
        h2("Comparison"),
        box(plotOutput("major_general_plot1"), width = 12, height = 850),
        column(
            4, selectInput("y_axis", "Select variable:",
                choices = names(data1)[c(-1, -4)]
            )
        ),
        h2("Scatterplot"),
        column(2, sliderInput("dot_size", "Dot size",
            min = 1, max = 8, value = 2
        )),
        box(plotOutput("major_general_plot2"), width = 12, height = 850)
    )
)

major_specific_page <- tabItem(
    tabName = "major_specific",
    fluidRow()
)
