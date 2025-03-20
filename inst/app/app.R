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
  ObserEvent(input$start, {
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


}

# Lancer l'application
shinyApp(ui, server)
