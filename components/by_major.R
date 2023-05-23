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

# TODO: Fix title "Top 10 Best College Majors"
# TODO: Add descriptions for the plots
# TODO: Add more styles for the page
major_specific_page <- tabItem(
    tabName = "major_specific",
    fluidRow(
        tags$h2("Salaries by Percentiles", class = "major_general_page-title"),
        column(4, selectInput("major", "Select major:",
            choices = unique(data1$Undergraduate.Major)
        )),
        box(plotlyOutput("m3"), width = 12, height = 500),
        tags$h2("Top 10 Best College Majors", class = "major_general_page-title"),
        DT::dataTableOutput("m4")
    )
)
