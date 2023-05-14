major_figure1 <- function(major_data) {
    major_data_long <- major_data %>%
        pivot_longer(-Undergraduate.Major, names_to = "variable", values_to = "value")

    ggplot(major_data_long, aes(x = Undergraduate.Major, y = value, color = variable, group = variable)) +
        geom_line(linewidth = 1.3) +
        geom_point(size = 3) +
        labs(
            x = "Undergraduate Major",
            y = "Salary (in $)",
            size = 19
        ) +
        theme(
            axis.title.x = element_text(size = 15),
            axis.title.y = element_text(size = 15, margin = margin(r = 20)),
            axis.text.x = element_text(angle = 90, hjust = 1, size = 12),
            axis.text.y = element_text(size = 12),
            legend.position = "top",
            legend.direction = "horizontal",
            legend.text = element_text(size = 12),
            legend.title = element_text(size = 13)
        )
}

major_figure2 <- function(major_data, y_axis, dot_size) {
    ggplot(major_data, aes(
        x = Undergraduate.Major,
        y = !!sym(y_axis)
    )) +
        geom_point(size = dot_size) +
        labs(
            title = paste("Undergraduate Major",
                sep = " vs. ",
                gsub("\\.", " ", y_axis)
            ),
            x = "Undergraduate Major",
            y = paste(gsub("\\.", " ", y_axis), " (in $)")
        ) +
        theme(
            axis.title.x = element_text(size = 15),
            axis.title.y = element_text(size = 15, margin = margin(r = 20)),
            axis.text.x = element_text(angle = 90, hjust = 1, size = 12),
            axis.text.y = element_text(size = 12),
            legend.position = "top",
            legend.direction = "horizontal",
            legend.text = element_text(size = 12),
            legend.title = element_text(size = 13)
        )
}

# TODO: Fix the regression line
# TODO: Add a prediction model
major_figure3 <- function(major_data, major) {
    major_data <- rename(
        major_data,
        "10th Percentile" = "Mid.Career.10th.Percentile.Salary",
        "25th Percentile" = "Mid.Career.25th.Percentile.Salary",
        "75th Percentile" = "Mid.Career.75th.Percentile.Salary",
        "90th Percentile" = "Mid.Career.90th.Percentile.Salary"
    )

    major_data_filtered <- major_data %>%
        filter(Undergraduate.Major == major) %>%
        pivot_longer(-c(
            Undergraduate.Major, Starting.Median.Salary,
            Mid.Career.Median.Salary
        ), names_to = "variable", values_to = "value")

    ggplot(major_data_filtered, aes(x = variable, y = value)) +
        geom_smooth(aes(group = 1),
            linewidth = 1, method = "lm",
            se = FALSE, color = "red", formula = y ~ x
        ) +
        geom_point(size = 3) +
        geom_text(aes(label = paste("Salary:", dollar(value))), vjust = -0.9, size = 5) +
        labs(
            x = "Undergraduate Major",
            y = "Salary (in $)",
            size = 19
        ) +
        theme(
            axis.title.x = element_text(size = 15, margin = margin(t = 20)),
            axis.title.y = element_text(size = 15, margin = margin(r = 20)),
            axis.text.x = element_text(angle = 90, hjust = 1, size = 12),
            axis.text.y = element_text(size = 12),
            legend.position = "top",
            legend.direction = "horizontal",
            legend.text = element_text(size = 12),
            legend.title = element_text(size = 13)
        )
}

major_figure4 <- function(major_data) {
    top_10 <- major_data %>%
        arrange(desc("Percent change from Starting to Mid-Career Salary")) %>%
        slice(1:10)

    data <- data.frame(
        Major = top_10$Undergraduate.Major,
        Starting_Salary = dollar(top_10$Starting.Median.Salary),
        Mid_Career_Salary = dollar(top_10$Mid.Career.Median.Salary),
        Difference = dollar(top_10$Mid.Career.Median.Salary -
            top_10$Starting.Median.Salary)
    )

    datatable(
        data,
        options = list(
            dom = "t",
            paging = FALSE,
            ordering = FALSE,
            info = FALSE,
            searching = FALSE,
            columnDefs = list(
                list(width = "150px", targets = "_all")
            ),
            language = list(
                emptyTable = "No data available",
                zeroRecords = "No matching records found"
            )
        )
    )
}