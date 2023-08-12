region_page <- tabItem(
    tabName = "region",
    fluidRow(
        box(plotOutput("f1"), width = 12),
        DT::dataTableOutput("f2")
    )
)
