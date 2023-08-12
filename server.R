source("utilities/major_figures.R")
source("utilities/region_figures.R")
source("utilities/college_figures.R")

function(input, output) {
    # Figure 1 for major_general_page
    output$m1 <- renderPlot(
        {
            major_figure1(data1)
        },
        height = exprToFunction(800)
    )

    # Figure 2 for major_general_page
    output$m2 <- renderPlot(
        {
            major_figure2(data1, input$y_axis, input$dot_size)
        },
        height = exprToFunction(800)
    )

    # Figure 1 for major_specific_page
    output$m3 <- renderPlotly({
        major_figure3(data1, input$major)
    })

    # Figure 2 for major_specific_page
    output$m4 <- DT::renderDataTable({
        major_figure4(data1)
    })

    output$f1 <- renderPlot({
        region_figure1(data2)
    })
    
    output$f2 <- DT::renderDataTable({
        region_figure2(data2)
    })

    output$c1 <- renderDT({
        college_figure1(data3, input$uni)
    })
}
