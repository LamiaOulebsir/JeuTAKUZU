#include <Rcpp.h>

using namespace Rcpp;
// Fonction pour vérifier si il y a trois 0 ou 1 consécutifs dans la matrice

// [[Rcpp::export]]
bool check_consecutive(NumericMatrix mat, int n) {
  // Vérifie les lignes
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n-2; ++j) {
      if (mat(i, j) == mat(i, j+1) && mat(i, j) == mat(i, j+2)) {
        return false;  // Trois consécutifs trouvés, ce n'est pas valide
      }
    }
  }

  // Vérifie les colonnes
  for (int j = 0; j < n; ++j) {
    for (int i = 0; i < n-2; ++i) {
      if (mat(i, j) == mat(i+1, j) && mat(i, j) == mat(i+2, j)) {
        return false;  // Trois consécutifs trouvés, ce n'est pas valide
      }
    }
  }

  return true;  // Pas de trois consécutifs
}








// Fonction pour vérifier si il y a le meme nombre de 0 et de 1 dans chaque ligne et dans chaque colonne.

// [[Rcpp::export]]
bool check_balance(NumericMatrix mat, int n) {
  // Vérifie l'équilibre des lignes
  for (int i = 0; i < n; ++i) {
    int count_zeros = 0;
    int count_ones = 0;
    for (int j = 0; j < n; ++j) {
      if (mat(i, j) == 0) count_zeros++;
      if (mat(i, j) == 1) count_ones++;
    }
    if (count_zeros != count_ones) return false;  // Si le nombre de 0 et 1 n'est pas égal, retourne false
  }

  // Vérifie l'équilibre des colonnes
  for (int j = 0; j < n; ++j) {
    int count_zeros = 0;
    int count_ones = 0;
    for (int i = 0; i < n; ++i) {
      if (mat(i, j) == 0) count_zeros++;
      if (mat(i, j) == 1) count_ones++;
    }
    if (count_zeros != count_ones) return false;  // Si le nombre de 0 et 1 n'est pas égal, retourne false
  }

  return true;  // Si tout est équilibré
}

// les colonnes et les lignes ne sont pas identiques

// [[Rcpp::export]]
bool check_no_repeated(NumericMatrix mat, int n) {
  // Vérifie les lignes
  for (int i = 0; i < n; ++i) {
    for (int j = i + 1; j < n; ++j) {
      bool is_identical = true;
      for (int k = 0; k < n; ++k) {
        if (mat(i, k) != mat(j, k)) {
          is_identical = false;
          break;
        }
      }
      if (is_identical) {
        return false;  // Les lignes sont identiques, ce n'est pas valide
      }
    }
  }

  // Vérifie les colonnes
  for (int j = 0; j < n; ++j) {
    for (int k = j + 1; k < n; ++k) {
      bool is_identical = true;
      for (int i = 0; i < n; ++i) {
        if (mat(i, j) != mat(i, k)) {
          is_identical = false;
          break;
        }
      }
      if (is_identical) {
        return false;  // Les colonnes sont identiques, ce n'est pas valide
      }
    }
  }

  return true;  // Pas de lignes ni de colonnes identiques
}
