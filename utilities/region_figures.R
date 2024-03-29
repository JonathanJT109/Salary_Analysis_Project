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
    labs(title = "Average Starting Salary by Region", fill = "Average Starting\nSalary") +
    coord_map("polyconic") +
    theme_map()
}

region_figure2 <- function(data) {
  df <- data %>%
    group_by(Region) %>%
    summarise(
      "Average Starting Salary" = round(mean(Starting.Median.Salary), 2),
      "Average Mid-Career Salary" = round(mean(Mid.Career.Median.Salary), 2)
    ) %>%
    mutate(
      "Average Starting Salary" = dollar_format(
        prefix = "$", 
        suffix = "", 
        big.mark = ",", 
        decimal.mark = ".", 
        digits = 2
      )(`Average Starting Salary`),
      "Average Mid-Career Salary" = dollar_format(
        prefix = "$", 
        suffix = "", 
        big.mark = ",", 
        decimal.mark = ".", 
        digits = 2
      )(`Average Mid-Career Salary`)
      )
  
  datatable(
    df,
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
