library(shiny)
library(JeuTAKUZU)

ui <- fluidPage(
  titlePanel("Jeu Takuzu"),

  sidebarLayout(
    sidebarPanel(
      numericInput("n", "Taille de la grille", 5, min = 3, max = 10),
      actionButton("start", "Démarrer le jeu"),
      actionButton("Check" ,"Check")  # Vérifier si le joueur a gangné ou pas
    ),

    mainPanel(
      uiOutput("button_grid")
    )
  )
)


server <- function(input, output, session) {
  btn_values <- reactiveValues() # stocker la matrice de boutons

  # Initialisation de la matrice lorsqu'on appuie sur "Démarrer le jeu"
  observeEvent(input$start, {
    n <- input$n
    btn_values$matrix <- matric(sample(1,0,""),n*n ,replace =TRUE)

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



}

# Lancer l'application
shinyApp(ui, server)
