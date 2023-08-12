
college_figure1 <- function(data, university) {
    filtered_data <- data %>%
        filter(School.Name %in% university) %>%
        rename_with(~ gsub("\\.", " ", .x), everything())

    datatable(filtered_data,
        options = list(
            pageLength = 5, # Set the number of rows to display per page
            lengthChange = FALSE, # Disable the "Show [x] entries" dropdown
            searching = FALSE, # Disable search box
            info = FALSE # Hide "Showing [x] of [y] entries" info
        ),
        rownames = FALSE # Remove row names from the table
    )
}
