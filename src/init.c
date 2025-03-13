#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>

// Déclare les fonctions C++ que R doit utiliser
void R_init_JeuTAKUZU(DllInfo *info) {
  R_registerRoutines(info, NULL, NULL, NULL, NULL);
  R_useDynamicSymbols(info, TRUE);
}

// Ça permet d'enregistrer les fonctions pour qu'elles soient appelées correctement par R.
