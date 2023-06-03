# TODO: Add legend to the ggplot map
# TODO: Add a title to the ggplot map
# TODO: Add a table below the map with the average salary for each region

region_figure1 <- function() {
    # Get the map data for the US
    usa_map <- map_data("state")

    # Create the 'group' variable based on regions
    usa_map <- usa_map %>%
        mutate(
            section = case_when(
                region == "california" ~ "California",
                region %in% c("oregon", "washington", "nevada", "idaho", "montana", "wyoming", "utah", "colorado", "arizona", "new mexico", "alaska", "hawaii") ~ "West",
                region %in% c("maine", "new hampshire", "vermont", "massachusetts", "rhode island", "connecticut", "new york", "new jersey", "pennsylvania", "delaware", "maryland", "virginia", "west virginia", "north carolina", "south carolina", "georgia", "florida", "kentucky", "tennessee") ~ "Northeast",
                region %in% c("texas", "oklahoma", "arkansas", "louisiana", "mississippi", "alabama", "missouri") ~ "South",
                TRUE ~ "Midwest"
            )
        )


    colors <- colorRampPalette(c("darkred", "red"))(n = 5)

    # Assign colors based on section and shades of red by average salary
    usa_map <- usa_map %>%
        mutate(
            color = case_when(
                section == "California" ~ colors[1],
                section == "Northeast" ~ colors[2],
                section == "Midwest" ~ colors[3],
                section == "West" ~ colors[4],
                section == "South" ~ colors[5],
                TRUE ~ "#000000" # Default color for other cases
            )
        )

    ggplot(data = usa_map, aes(long, lat)) +
        geom_map(
            data = usa_map, map = usa_map,
            aes(map_id = region), color = "#2b2b2b", fill = usa_map$color
        ) +
        scale_color_identity() +
        coord_map("polyconic") +
        ggthemes::theme_map()
}
