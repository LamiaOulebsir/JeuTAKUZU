library(shiny)
library(JeuTAKUZU)

# Interface utilisateur (UI)
ui <- fluidPage(
  titlePanel("Jeu Takuzu"),

  sidebarLayout(
    sidebarPanel(
      numericInput("n", "Taille de la grille", 5, min = 3, max = 10),
      actionButton("start", "Démarrer le jeu")
    ),

    mainPanel(
      uiOutput("button_grid")
    )
  )
)

# Serveur (logique)
server <- function(input, output, session) {





}

# Lancer l'application
shinyApp(ui, server)
