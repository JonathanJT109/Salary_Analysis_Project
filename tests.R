
region_figure1 <- function(data) {
  
  map_regions <- function(region) {
    case_when(
      region == "california" ~ "California",
      region %in% c("oregon", "washington", "nevada", "idaho", "montana", "wyoming", "utah", "colorado", "arizona", "new mexico", "alaska", "hawaii") ~ "West",
      region %in% c("maine", "new hampshire", "vermont", "massachusetts", "rhode island", "connecticut", "new york", "new jersey", "pennsylvania", "delaware", "maryland", "virginia", "west virginia", "north carolina", "south carolina", "georgia", "florida", "kentucky", "tennessee") ~ "Northeast",
      region %in% c("texas", "oklahoma", "arkansas", "louisiana", "mississippi", "alabama", "missouri") ~ "South",
      TRUE ~ "Midwest"
    )
  }
  
  usa_map <- map_data("state") %>%
    mutate(Region = map_regions(region))
  
  data <- data %>%
    mutate(Region = case_when(
      Region == "Western" ~ "West",
      Region == "Midwestern" ~ "Midwest",
      Region == "Northeastern" ~ "Northeast",
      Region == "Southern" ~ "South",
      TRUE ~ Region
    ))
  
  average_salary_by_region <- data %>%
    group_by(Region) %>%
    summarise(avg_starting_median_salary = mean(Starting.Median.Salary))
  
  df <- usa_map %>%
    left_join(average_salary_by_region, by = "Region") %>%
    arrange(order)
  
  ggplot(df, aes(long, lat)) +
    geom_polygon(aes(group = group, fill = avg_starting_median_salary)) +
    labs(fill = "Average Starting Median Salary") +
    coord_map("polyconic") 
}

region_figure1(data2)
