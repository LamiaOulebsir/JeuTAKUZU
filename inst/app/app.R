library(shiny)
library(JeuTAKUZU)
library(shinythemes)
library(shinyjs)





ui <- fluidPage(
  #theme = shinytheme("flatly"),
  #useShinyjs(),
  #tags$head(tags$style(HTML(custom_css))),

  # Lien vers le fichier CSS externe
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),

  titlePanel("Bienvenue au Jeu Takuzu !"),



  sidebarLayout(
    sidebarPanel(
      numericInput("n", "Taille de la grille", 6, min = 3, max = 10),
      actionButton("start", "Démarrer le jeu",icon = icon("play"), class = "btn-success"),
      actionButton("Check" ,"Check",class = "btn-primary")  # Vérifier si le joueur a gangné ou pas
    ),

    mainPanel(
      uiOutput("button_grid"),
      textOutput("result")
    )
  )
)


server <- function(input, output, session) {
  btn_values <- reactiveValues() # stocker la matrice de boutons

  # Initialisation de la matrice lorsqu'on appuie sur "Démarrer le jeu"
  observeEvent(input$start, {
    n <- input$n
    btn_values$matrix <- matrix(sample(c(1,0,""),n*n,replace =TRUE))

  })

  # Créer et afficher la grille de boutons
  output$button_grid <- renderUI({
    n <- input$n
    div(
      class = "grid-container",
      style = paste0("display: grid; grid-template-columns: repeat(", n, ", 50px); grid-gap: 0px;"),
      lapply(1:(n * n), function(i) {
        actionButton(inputId = paste0("btn_", i), label = btn_values$matrix[i], style = "width: 50px; height: 50px; margin: 0;")
      })
    )
  })


  # Observer chaque bouton
  observe({
    lapply(1:(input$n * input$n), function(i) {
      observeEvent(input[[paste0("btn_", i)]], {
        #print(paste("Bouton cliqué : ", i))  # Message dans la console

        # Alterner la valeur du bouton (0 -> 1 ou 1 -> 0)
        current_value <- btn_values$matrix[i]

        new_value <- if (current_value == "") {
          sample(c(0,1),1)
        }else if (current_value == 0){
          new_value <- 1
        }else{
          new_value <- 0
        }


        # Créer une matrice temporaire avec la nouvelle valeur
        temp_matrix <- btn_values$matrix
        temp_matrix[i] <- new_value

        btn_values$matrix <- temp_matrix  # Mettre à jour la matrice
        #updateActionButton(session, paste0("btn_", i), label = as.character(new_value))  # Mettre à jour l'affichage du bouton
      })

    })
  })

  # Vérification des règles lorsqu'on appuie sur "Vérifier les règles"
  observeEvent(input$Check, {
    n <- input$n

    # Vérifier si toutes les cases sont remplies (pas de "")
    if (any(btn_values$matrix == "")) {
      output$result <- renderText("Veuillez remplir toutes les cases avant de vérifier.")
    } else {
      # Convertir la matrice en numérique pour éviter les erreurs de type
      btn_values$matrix <- matrix(as.numeric(btn_values$matrix), nrow = n, ncol = n)



      if (check_consecutive(btn_values$matrix, n) && check_balance(btn_values$matrix, n) && check_no_repeated(btn_values$matrix, n)) {
        #output$result <- renderText("🎉 Bravo !Vous avez gagné 😂 " ,type ="message")
        showNotification("🎉 Bravo !Vous avez gagné 😂 " ,type ="message")
      } else {
        #output$result <- renderText("Désolé, vous avez perdu. Les règles ne sont pas respectées.")
        showNotification("😢 Dommage, les règles ne sont pas respectées.", type = "error")
      }
    }
  })


}

# Lancer l'application
shinyApp(ui, server)
