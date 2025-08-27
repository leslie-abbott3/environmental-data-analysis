library(ggplot2)
library(tidyverse)

plot_trends <- function(input_file, output_file) {
  df <- read_csv(input_file)

  p <- ggplot(df, aes(x=month, y=mean_value)) +
    geom_line(color="forestgreen", size=1.2) +
    labs(title="Seasonal Trends in Environmental Data",
         x="Month", y="Average Reading") +
    theme_minimal()

  ggsave(output_file, plot=p, width=8, height=5)
  message("[INFO] Plot saved: ", output_file)
}
