library(shiny)

ui <- fluidPage(
  titlePanel("Matrice de boutons avec Shiny"),
  uiOutput("matrice_boutons") ## afficher la grille de boutons
)

server <- function(input, output, session) {
  output$matrice_boutons <-renderUI({
    nRows <- 6
    nCols <- 6
    
    # Créer la matrice
    boutons <- lapply(1:(nRows * nCols), function(i) { 
      actionButton(inputId =paste("bouton",i,sep = "_"),label =paste("Bouton", i))
      
    })
    
  # Organiser les boutons en grille
  tagList(div(class = "btn-grid",
              lapply(split(boutons, ceiling(seq_along(boutons) / nCols)), div, class = "button-row")))
})
  
}
 
  


shinyApp(ui, server)
