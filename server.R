# Server
server <- function(input, output, session) {
  # Render data table
  output$data_table <- renderDataTable({
    rv$data
  }, options = list(lengthMenu = c(25, 50, 75, 100), pageLength = 25))
  
  # Logic to add new data
  observeEvent(input$add_data_btn, {
    new_data <- data.frame(
      Day = as.numeric(input$day_input),
      Left_Sidebar = as.numeric(input$left_sidebar_input),
      Center_Page = as.numeric(input$center_page_input),
      Right_Sidebar = as.numeric(input$right_sidebar_input)
    )
    
    # Add new data to reactiveValues
    rv$data <- rbind(rv$data, new_data)
    
    # Reset input forms after adding data
    updateTextInput(session, "day_input", value = "")
    updateNumericInput(session, "left_sidebar_input", value = 0)
    updateNumericInput(session, "center_page_input", value = 0)
    updateNumericInput(session, "right_sidebar_input", value = 0)
  })
  
  # Plot for Position Comparison
  output$position_plot <- renderPlot({
    options(repr.plot.width = 10, repr.plot.height = 8)
    p <- ggplot(rv$data, aes(x = Day)) +
      geom_line(aes(y = Left_Sidebar, color = "Left Sidebar"), size = 1.5) +
      geom_line(aes(y = Center_Page, color = "Center Page"), size = 1.5) +
      geom_line(aes(y = Right_Sidebar, color = "Right Sidebar"), size = 1.5) +
      labs(title = "Position Comparison Over Days",
           x = "Day", y = "Position Value", color = "Position") +
      theme_minimal()
    
    # Set legend position and size
    p + theme(
      legend.position = "bottom",  # Adjust legend position
      legend.text = element_text(size = 15)  # Adjust legend text size
    )
  })
  
  # ANOVA summary
  output$anova_summary <- renderPrint({
    summary(aov(click ~ view, data = ctr))
  })
  
  # Tukey's test result
  output$tukey_result <- renderPrint({
    TukeyHSD(aov(click ~ view, data = ctr))
  })
}
