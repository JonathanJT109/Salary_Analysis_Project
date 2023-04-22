# Load the required libraries
library(shiny)
library(ggplot2)
library(readr)
library(dplyr)
library(tidyr)

# Load the data set
data1 <- read.csv("data/degrees-that-pay-back.csv")
data2 <- read.csv("data/salaries-by-region.csv")
data3 <- read.csv("data/salaries-by-college-type.csv")
source("utilities/major_general_plots.R")

# Clean the data set
major_data <- data1 %>%
    select(-Percent.change.from.Starting.to.Mid.Career.Salary) %>%
    mutate_at(vars(-Undergraduate.Major), ~ parse_number(.))

major_data_long <- major_data %>%
    pivot_longer(-Undergraduate.Major, names_to = "variable", values_to = "value")

# Define the server function
function(input, output) {
    # Plot 1 for major_general_page
    output$major_general_plot1 <- renderPlot(
        {
            major_general_plot1(major_data_long)
        },
        height = exprToFunction(800)
    )

    # Plot 2 for major_general_page
    output$major_general_plot2 <- renderPlot(
        {
            major_general_plot2(major_data, input$y_axis, input$dot_size)
        },
        height = exprToFunction(800)
    )

    output$test <- renderPlot({
        ggplot(major_data[], aes(x = Undergraduate.Major)) +
            geom_point(aes(y = Starting.Median.Salary), color = "red") +
            geom_point(aes(y = Mid.Career.Median.Salary), color = "blue")
    })

    # Plot for data set 2
    output$plot2 <- renderPlot({
        options(repr.plot.width = 14, repr.plot.height = 14)
        ggplot(iris, aes_string(x = input$variable2)) +
            geom_density(color = "red", fill = "orange") +
            labs(x = input$variable2, y = "Density")
    })
}
