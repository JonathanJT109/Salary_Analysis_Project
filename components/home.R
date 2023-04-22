home_page <- tabItem(
    tabName = "home",
    fluidPage(
        tags$style(HTML("
      h1 {
        font-size: 50px;
        color: #00539C;
        text-align: center;
      }

      p {
        font-size: 20px;
        line-height: 1.5;
        color: #333333;
        margin: 20px 0;
      }

      a {
        color: #00539C;
      }

      .intro {
        background-color: #F2F2F2;
        padding: 50px 0;
        text-align: center;
      }

      .info {
        background-color: #ffffff;
        padding: 50px;
      }

      h4 {
        font-size: 24px;
        color: #00539C;
        margin-top: 0;
      }
    ")),
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
            br()
        )
    )
)