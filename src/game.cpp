#include <Rcpp.h>

using namespace Rcpp;

// Fonction pour vérifier si il y a trois 0 ou 1 consécutifs dans la matrice
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
