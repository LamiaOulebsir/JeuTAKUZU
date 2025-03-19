## Liaison avec le code c++

#R/game.R sert à créer une fonction R qui appelle la fonction C++.

#' @useDynLib JeuTAKUZU, .registration = TRUE
#' @importFrom Rcpp sourceCpp
NULL

#' Vérifier la règle des trois consécutifs
#' @param mat Une matrice de Takuzu
#' @param n La taille de la grille (n x n)
#' @return TRUE si la règle est respectée, FALSE sinon
#' @export
check_consecutive <- function(mat, n) {
  .Call("_JeuTAKUZU_check_consecutive", mat, n, PACKAGE = "JeuTAKUZU")
}

#' Vérifier l'équilibre des 0 et 1
#' @param mat Une matrice de Takuzu
#' @param n La taille de la grille (n x n)
#' @return TRUE si la règle est respectée, FALSE sinon
#' @export

check_balance <- function(mat, n) {
  .Call("_JeuTAKUZU_check_balance", mat, n, PACKAGE = "JeuTAKUZU")
}




