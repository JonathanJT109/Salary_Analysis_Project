source("utilities/major_figures.R")

# Clean the data set
major_data <- data1 %>%
    select(-Percent.change.from.Starting.to.Mid.Career.Salary) %>%
    mutate_at(vars(-Undergraduate.Major), ~ parse_number(.))

function(input, output) {
    # Figure 1 for major_general_page
    output$m1 <- renderPlot(
        {
            major_figure1(major_data)
        },
        height = exprToFunction(800)
    )

    # Figure 2 for major_general_page
    output$m2 <- renderPlot(
        {
            major_figure2(major_data, input$y_axis, input$dot_size)
        },
        height = exprToFunction(800)
    )

    # Figure 1 for major_specific_page
    output$m3 <- renderPlotly({
        major_figure3(major_data, input$major)
    })

    # Figure 2 for major_specific_page
    output$m4 <- DT::renderDataTable({
        major_figure4(major_data)
    })
}
