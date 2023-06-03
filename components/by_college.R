college_page <- tabItem(
  tabName = "college",
  fluidRow(
    column(
      6,
      selectizeInput("uni", "University",
        choices = unique(data3$School.Name),
        multiple = TRUE
      ),
    ),
    box(DTOutput("c1"), width = 12),
    h1("What is the best School for you?")
  )
)
