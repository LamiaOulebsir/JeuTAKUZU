library(JeuTAKUZU)
# Créer une matrice 3x3 avec des 0 et des 1
mat_test <- matrix(c(0, 1, 0,
                     1, 0, 1,
                     1, 0, 0),
                   nrow = 3, byrow = TRUE)

check_consecutive(mat_test, 3)

# Créer une matrice 4x4 avec des 0 et des 1
mat_test <- matrix(c(0, 1, 1,0,
                     1, 0, 0,1,
                     1, 0, 0,1,
                     0, 1, 1,0),
                   nrow = 4, byrow = TRUE)

check_balance(mat_test, 4)
