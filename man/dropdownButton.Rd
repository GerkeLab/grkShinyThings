% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dropdownButton.R
\name{dropdownButtonUI}
\alias{dropdownButtonUI}
\alias{dropdownButton}
\alias{dropdownButtonDemo}
\title{Bootstrap Dropdown Button Module}
\usage{
dropdownButtonUI(id, options, label = "Options", type = "dropdown",
  buttonId = paste0(id, "-dropdown"), class = "btn-default")

dropdownButton(id, options)

dropdownButtonDemo(display.mode = c("showcase", "normal", "auto"))
}
\arguments{
\item{id}{The shared \code{id} of the \code{dropdownButtonUI()} and the
\code{dropdownButton()} module}

\item{options}{A named vector of options and labels. The name is the label
that will appear on the button and the value is the id of the input that is
returned from the Shiny modules.}

\item{label}{The button text of the "master" button containing the dropdown
buttons.}

\item{type}{Type of dropdown: one of \code{"dropdown"} or \code{"dropup"}}

\item{buttonId}{The HTML id of the dropdown button.}

\item{class}{CSS classes to be added to the dropdown button.}

\item{display.mode}{The mode in which to display the application. If set to
the value \code{"showcase"}, shows application code and metadata from a
\code{DESCRIPTION} file in the application directory alongside the
application. If set to \code{"normal"}, displays the application normally.
Defaults to \code{"auto"}, which displays the application in the mode given
in its \code{DESCRIPTION} file, if any.}
}
\description{
Creates a bootstrap dropdown button UI, with a server module that returns
the id of the most recently clicked button.
}
\section{Functions}{
\itemize{
\item \code{dropdownButtonUI}: Creates the dropdown button UI.

\item \code{dropdownButtonDemo}: Example app demonstrating usage of the
dropdownButton module.
}}

\section{Usage}{

\itemize{
\item ui: \code{\link[=dropdownButtonUI]{dropdownButtonUI()}}
\item server: \code{\link[=dropdownButton]{dropdownButton()}}
}
}

\examples{
if (interactive()) {
  library(shiny)

  button_options <- c(
    "Option A" = "opt_a",
    "Option B" = "opt_b"
  )

  ui <- fluidPage(
    dropdownButtonUI(
      id = "dropdown",
      options = button_options,
      label = "Options"
    ),
    verbatimTextOutput("chosen")
  )

  server <- function(input, output) {
    last_clicked <- dropdownButton("dropdown", button_options)
    output$chosen <- renderPrint({ last_clicked() })
  }

  shinyApp(ui = ui, server = server)
}
}
\concept{dropdownButton}
