parse_data <- function(file_path) {
  df <- read.csv(file_path)
  
  salary_columns <- c(
    "Starting.Median.Salary",
    "Mid.Career.Median.Salary",
    "Mid.Career.10th.Percentile.Salary",
    "Mid.Career.25th.Percentile.Salary",
    "Mid.Career.75th.Percentile.Salary",
    "Mid.Career.90th.Percentile.Salary" 
  )
  
  df <- df %>%
    drop_na()
  
  df <- df %>%
    select_if(~!any(. %in% c('N/A')))
  
  for (col in salary_columns) {
    if (col %in% names(df)) {
      df <- df %>%
        mutate(!!col := parse_number(!!sym(col)))
    }
  }
  
  return(df)
}