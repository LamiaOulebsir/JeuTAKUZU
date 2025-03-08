library(Rcpp)

cppFunction('
bool verifier_grille(NumericMatrix matrice) {
    int n = matrice.nrow();
    
    // Vérification que chaque ligne et chaque colonne contiennent le même nombre de 0 et de 1
    for (int i = 0; i < n; i++) {
        int nb0 = 0, nb1 = 0;
        for (int j = 0; j < n; j++) {
            if (matrice(i, j) == 0) nb0++;
            if (matrice(i, j) == 1) nb1++;
        }
        if (nb0 != nb1) return false;
    }
    
    for (int k = 0; k < n; k++) {
        int nb0 = 0, nb1 = 0;
        for (int h = 0; h < n; h++) {
            if (matrice(h, k) == 0) nb0++;
            if (matrice(h, k) == 1) nb1++;
        }
        if (nb0 != nb1) return false;
    }
    
    // Vérification 
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n - 2; j++) {
            if ((matrice(i, j) == 0 && matrice(i, j + 1) == 0 && matrice(i, j + 2) == 0) ||
                (matrice(i, j) == 1 && matrice(i, j + 1) == 1 && matrice(i, j + 2) == 1)) {
                return false;
            }
        }
    }
    
    // Vérification 
    for (int i = 0; i < n; i++) {
        for (int j = i + 1; j < n; j++) {
            bool identical = true;
            for (int k = 0; k < n; k++) {
                if (matrice(i, k) != matrice(j, k)) {
                    identical = false;
                    break;
                }
            }
            if (identical) return false;
        }
    }
    
    return true;
}
')


