# TODO: Add link to repo

home_page <- tabItem(
      tabName = "home",
      fluidPage(
            tags$div(
                  class = "intro",
                  h1("Welcome to the Salary Explorer"),
                  p("Are you wondering if going to college is worth it in the
            long-run? Look no further than the Salary Explorer!"),
                  p("Our program uses data from three datasets obtained from
            Kaggle to visualize salary trends by region, industry, and
            college attended."),
            ),
            tags$div(
                  class = "info",
                  h4("Problem Statement:"),
                  p("Many students may wonder if the decision to go to college
            can help them in the long-run."),
                  br(),
                  h4("Data Description:"),
                  p("This study will use three data sets, which were obtained in
            Kaggle at the following link:"),
                  p(a("Where it Pays to Attend College",
                        href = "https://www.kaggle.com/datasets/wsj/college-salaries",
                        target = "_blank"
                  )),
                  p("The first data set (degrees-that-pay-back) looks at the
            salary of students according to the degree they obtained. The
            second data set (salaries-by-college-type) looks at the salary
            of students according to the type of college they attended."),
                  br(),
                  h4("Introduction:"),
                  p("Our goal is to allow users to view different aspects of the
            data, including salary trends by region, industry, and college
            attended. We also aim to provide simple-to-understand documentation
            on the process of building these graphs."),
                  br(),
                  p("Here is the link tot the GitHub repository if
                   you would like to learn more about the project:"),
                  p(a("Salary Explorer GitHub Repository",
                        href = "https://github.com/JonathanJT109/Salary_Analysis_Project",
                        target = "_blank"
                  )),
            )
      )
)
