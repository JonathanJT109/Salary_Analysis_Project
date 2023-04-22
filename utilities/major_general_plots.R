library(shiny)
library(ggplot2)
library(dplyr)
library(readr)
library(tidyr)

major_general_plot1 <- function(major_data_long) {
    ggplot(major_data_long, aes(x = Undergraduate.Major, y = value, color = variable, group = variable)) +
        geom_line(size = 1) +
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

major_general_plot2 <- function(major_data, y_axis, dot_size) {
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
