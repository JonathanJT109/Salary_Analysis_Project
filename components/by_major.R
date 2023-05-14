major_general_page <- tabItem(
    tabName = "major_general",
    fluidRow(
        tags$h2("Comparison", class = "major_general_page-title"),
        box(plotOutput("m1"), width = 12, height = 850),
        tags$h2("Scatterplot", class = "major_general_page-title"),
        column(
            4, selectInput("y_axis", "Select variable:",
                choices = names(data1)[c(-1, -4)]
            )
        ),
        column(2, sliderInput("dot_size", "Dot size",
            min = 1, max = 6, value = 2
        )),
        box(plotOutput("m2"), width = 12, height = 850)
    )
)

major_specific_page <- tabItem(
    tabName = "major_specific",
    fluidRow(
        column(4, selectInput("major", "Select major:",
            choices = unique(data1$Undergraduate.Major)
        )),
        box(plotOutput("m3"), width = 12, height = 850),
        DT::dataTableOutput("m4")
    )
)
