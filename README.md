
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shinyThings

## Installation

You can install shinyThings from Github via

``` r
# install.packages("remotes")
remotes::install_github("gadenbuie/shinyThings")
```

## Components

### dropdownButton

Implements [Bootstrap 3 Button
Dropdowns](https://getbootstrap.com/docs/3.3/components/#btn-dropdowns).

![](man/figures/README-dropdownButton-example.png)

``` r
button_options <- c(
  "Eleven" = "eleven",
  "Will Byers" = "will",
  "Mike Wheeler" = "mike",
  "Dustin Henderson" = "dustin",
  "Lucas Sinclair" = "lucas"
)

ui <- fluidPage(
  titlePanel("shinyThings Dropdown Button"),
  sidebarLayout(
    sidebarPanel(
      shinyThings::dropdownButtonUI(
        id = "dropdown",
        options = button_options,
        label = "Characters"
      )
    ),
    mainPanel(
      tags$p("The last button pressed was ..."),
      verbatimTextOutput("chosen")
    )
  )
)

server <- function(input, output) {
  last_clicked <- shinyThings::dropdownButton("dropdown", button_options)
  output$chosen <- renderPrint({ last_clicked() })
}
```

## Pagination

Implements [Bootstrap 3 pagination and
pagers](https://getbootstrap.com/docs/3.3/components/#pagination).

![](man/figures/README-pager-example.png)

``` r
ui <- fluidPage(
  titlePanel("shinyThings Pagination"),
  sidebarLayout(
    sidebarPanel(
      width = 6,
      
      tags$h4("paginationUI()"),
      shinyThings::paginationUI("pager", width = 12, offset = 0, class = "text-center"),
      tags$hr(),
      
      sliderInput("page_break", "Page Size", min = 1, max = 6, step = 1, value = 3),
      helpText(tags$code("page_break")),
      tags$hr(),
      
      tags$h4("pagerUI()"),
      shinyThings::pagerUI("pager", centered = FALSE)
    ),
    mainPanel(
      width = 6,
      
      tags$p("Page indices:"),
      verbatimTextOutput("page_indices"),
      
      tags$p(HTML("Paged output (<code>letters</code>):")),
      uiOutput("paged_output")
    )
  )
)

server <- function(input, output) {
  ## page_break and n_items can be reactive or fixed values
  # page_break <- 4
  # n_items <- length(letters)
  n_items <- reactiveVal(length(letters))
  page_break <- reactive({input$page_break})

  page_indices <- shinyThings::pager("pager", n_items, page_break)

  output$page_indices <- renderPrint({
    page_indices()
  })

  output$paged_output <- renderUI({
    tags$ul(
      lapply(letters[page_indices()], tags$li)
    )
  })
}
```
