library(shiny)
library(shinythemes)


# UI Shiny
ui <- fluidPage(
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),
  titlePanel("🧠 Jeu Takuzu"),
  sidebarLayout(
    sidebarPanel(
      numericInput("n", "Taille de la grille",  4, min = 4, max = 6),
      actionButton("start", "Démarrer le jeu 🚀", icon = icon("play"), class = "btn-success"),
      actionButton("Check", "Vérifier ✅", class = "btn-primary"),
      actionButton("rules", "Règles du jeu 📖", class = "btn-info")
    ),
    mainPanel(
      uiOutput("button_grid"),
      textOutput("result")
    )
  )
)

# Serveur
server <- function(input, output, session) {
  btn_values <- reactiveValues()
  game_started <- reactiveVal(FALSE)

  observeEvent(input$start, {
    n <- input$n
    btn_values$matrix <- matrix(sample(c(1, 0, ""), n * n, replace = TRUE), nrow = n, ncol = n)
    game_started(TRUE)
  })

  output$button_grid <- renderUI({
    n <- input$n
    div(
      class = "grid-container",
      style = paste0("display: grid; grid-template-columns: repeat(", n, ", 50px); grid-gap: 0px;"),
      lapply(1:(n * n), function(i) {
        actionButton(
          inputId = paste0("btn_", i),
          label = btn_values$matrix[i],
          style = "width: 50px; height: 50px; margin: 0;",
          disabled = !game_started()
        )
      })
    )
  })

  observe({
    lapply(1:(input$n * input$n), function(i) {
      observeEvent(input[[paste0("btn_", i)]], {
        if (game_started()) {
          current_value <- btn_values$matrix[i]
          new_value <- if (current_value == "") {
            sample(c(0, 1), 1)
          } else if (current_value == 0) {
            1
          } else {
            0
          }
          temp_matrix <- btn_values$matrix
          temp_matrix[i] <- new_value
          btn_values$matrix <- temp_matrix
        }
      })
    })
  })

  observeEvent(input$Check, {
    n <- input$n

    if (any(btn_values$matrix == "")) {
      output$result <- renderText("Veuillez remplir toutes les cases avant de vérifier.")
      showNotification("⚠️ Veuillez remplir toutes les cases avant de vérifier !", type = "warning")
    } else {
      mat <- matrix(as.numeric(btn_values$matrix), nrow = n, ncol = n)

      check_result <- list(
        consecutive = check_consecutive(mat, n),
        balance = check_balance(mat, n),
        no_repeated = check_no_repeated(mat,n)
      )

      if (all(unlist(check_result))) {
        showNotification("🎉 Bravo ! Vous avez gagné ! 🏆", type = "message")
        output$result <- renderText("Toutes les règles sont respectées. Bien joué ! 🎯")
      } else {
        msg <- "❌ Règles non respectées :"
        if (!check_result$consecutive) msg <- paste0(msg, "\n⚠️ Pas plus de deux 0 ou 1 consécutifs.")
        if (!check_result$balance) msg <- paste0(msg, "\n⚖️ Nombre égal de 0 et 1 non respecté.")
        if (!check_result$no_repeated) msg <- paste0(msg, "\n🔁 Lignes ou colonnes identiques détectées.")

        showNotification(msg, type = "error", duration = 10)
        output$result <- renderText(msg)
      }
    }
  })

  observeEvent(input$rules, {
    showModal(modalDialog(
      title = tags$h3("📜 Règles du jeu Takuzu", style = "text-align: center; color: #ff6b6b; font-weight: bold;"),
      HTML(
        "<div style='font-size: 18px; line-height: 1.6; color: #4a4a4a; text-align: center;'>
        <ul>
          <li>⚖️ <strong style='color: #ff6b6b;'>Équilibre</strong> : chaque ligne et chaque colonne doit contenir autant de <strong style='color: #4dabf7;'>0</strong> que de <strong style='color: #4dabf7;'>1</strong>.</li>
          <li>🚫 <strong style='color: #ff6b6b;'>Consécutifs</strong> : pas plus de deux <strong style='color: #4dabf7;'>0</strong> ou <strong style='color: #4dabf7;'>1</strong> consécutifs.</li>
          <li>🔢 <strong style='color: #ff6b6b;'>Remplissage</strong> : utilisez uniquement des <strong style='color: #4dabf7;'>0</strong> et des <strong style='color: #4dabf7;'>1</strong>.</li>
          <li>🆚 <strong style='color: #ff6b6b;'>Unicité</strong> : aucune ligne ou colonne ne doit être identique.</li>
        </ul>
      </div>"
      ),
      easyClose = TRUE,
      footer = NULL
    ))
  })
}

# Lancer l'application
shinyApp(ui = ui, server = server)
