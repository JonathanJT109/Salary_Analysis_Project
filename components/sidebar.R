# Sidebar
sidebar <- dashboardSidebar(sidebarMenu(
    menuItem("Home",
        tabName = "home", icon = icon("home")
    ),
    menuItem("Salaries by major",
        tabName = "major", icon = icon("certificate"),
        menuSubItem("General", tabName = "major_general"),
        menuSubItem("Specific", tabName = "major_specific")
    ),
    menuItem("Salaries by region",
        tabName = "region", icon = icon("map")
    ),
    menuItem("Salaries by college",
        tabName = "college", icon = icon("graduation-cap")
    )
))
