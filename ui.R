# UI
ui <- dashboardPage(
  dashboardHeader(title = "ANOVA and Tukey's Test"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Data", tabName = "tab1"),
      menuItem("Position Comparison", tabName = "tab2"),
      menuItem("ANOVA", tabName = "tab3"),
      menuItem("Tukey", tabName = "tab4")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "tab1",
        fluidRow(
          box(
            title = "Data Preview",
            dataTableOutput("data_table"),
            style = "margin: 0 auto;"  # Centering the box
          ),
          box(
            title = "Manual Data Input",
            numericInput("day_input", "Day", value = 0),
            numericInput("left_sidebar_input", "Left Sidebar", value = 0),
            numericInput("center_page_input", "Center Page", value = 0),
            numericInput("right_sidebar_input", "Right Sidebar", value = 0),
            actionButton("add_data_btn", "Add Data"),
            style = "margin: 0 auto;"  # Centering the box
          )
        )
      ),
      tabItem(
        tabName = "tab2",
        fluidRow(
          box(
            title = "Position Comparison",
            plotOutput("position_plot", height = "600px"),  # Set height directly here
            style = "margin: 0 auto;"  # Centering the box
          )
        )
      ),
      tabItem(
        tabName = "tab3",
        fluidRow(
          box(
            title = "ANOVA Summary",
            verbatimTextOutput("anova_summary"),
            h4("If  Pvalue  less or equal alpha (0.05) 
            Reject the null hypothesis. This indicates that there is enough evidence 
            to suggest that there is a significant difference in mean click-through rates
            among different views (ad placements).
            In this specific case, since the p-value (2.37e-11) is much smaller than 0.05, 
            it would reject the null hypothesis. Therefore, there is strong evidence to suggest 
            that there is a significant difference in mean click-through rates among different views (ad placements)."),
            style = "margin: 0 auto;"  # Centering the box
          )
        )
      ),
      tabItem(
        tabName = "tab4",
        fluidRow(
          box(
            title = "Tukey's Test Result",
            h4("The Tukey's test results indicate significant differences between the groups Left Sidebar and Center Page, 
               Right Sidebar and Center Page, as well as Right Sidebar and Left Sidebar. Additionally, the very low p-adj 
               values suggest that these differences are highly statistically significant."),
            verbatimTextOutput("tukey_result"),
            style = "margin: 0 auto;"  # Centering the box
          )
        )
      )
    )
  )
)