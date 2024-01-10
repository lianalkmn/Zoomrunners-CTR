library(shiny)
library(shinydashboard)
library(ggplot2)
library(DescTools)

# Inisialisasi data awal
data <- data.frame(
  Day = 1:10,
  Left_Sidebar = c(2.5, 2.7, 2.8, 2.6, 3, 2.4, 2.9, 2.5, 2.6, 2.7),
  Center_Page = c(3.8, 3.5, 4, 3.7, 3.9, 3.6, 4.1, 3.4, 3.8, 3.9),
  Right_Sidebar = c(3.1, 2.9, 3, 3.2, 3.3, 2.8, 3.4, 3.1, 3.2, 3.5)
)

# ReactiveValues untuk menyimpan data
rv <- reactiveValues(data = data)

# Data untuk ANOVA dan Tukey
ctr <- data.frame(
  click = c(data$Left_Sidebar, data$Center_Page, data$Right_Sidebar),
  view = rep(c("Left Sidebar", "Center Page", "Right Sidebar"), each = 10)
)


# Panggil Shiny app
shinyApp(ui, server)