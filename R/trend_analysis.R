library(tidyverse)
library(lubridate)

analyze_trends <- function(input_file, output_file) {
  df <- read_csv(input_file)
  df <- df %>% mutate(month = floor_date(as.Date(timestamp), "month"))

  seasonal_summary <- df %>%
    group_by(month) %>%
    summarise(mean_value = mean(reading), .groups="drop")

  write_csv(seasonal_summary, output_file)
  message("[INFO] Seasonal trends saved: ", output_file)
}
