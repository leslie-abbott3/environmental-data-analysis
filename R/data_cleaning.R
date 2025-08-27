library(tidyverse)

clean_environmental_data <- function(input_dir, output_dir) {
  files <- list.files(input_dir, pattern="*.csv", full.names=TRUE)
  dir.create(output_dir, showWarnings = FALSE)

  for (f in files) {
    df <- read_csv(f)
    # Basic cleaning: remove NAs, outliers
    df <- df %>%
      drop_na() %>%
      filter(reading >= 0, reading <= quantile(reading, 0.99))

    outpath <- file.path(output_dir, basename(f))
    write_csv(df, outpath)
    message("[INFO] Cleaned file saved: ", outpath)
  }
}
