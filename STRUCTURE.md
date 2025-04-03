## Structure du dépôt

```bash
JeuTAKUZU/  
│── R/                     # Fonctions R du package  
│   ├── RcppExports.R      # Fonctions exportées via Rcpp  
│   ├── game.R             # Code principal du jeu  
│  
│── inst/                  # Contient les fichiers de l'application Shiny  
│   ├── app/               # Application Shiny  
│       ├── www/           # Contient les fichiers CSS et autres ressources  
│       │   ├── style.css  # Feuille de style CSS  
│       ├── app.R          # Script principal de l'application Shiny  
│  
│── man/                   # Documentation des fonctions R  
│   ├── check_balance.Rd   # Documentation pour la fonction check_balance  
│   ├── check_consecutive.Rd   # Documentation pour check_consecutive  
│   ├── check_no_repeated.Rd   # Documentation pour check_no_repeated  
│   ├── run_app.Rd         # Documentation pour run_app  
│  
│── src/                   # Code source en C++ (Rcpp)  
│   ├── JeuTAKUZU.so       # Fichier binaire compilé  
│   ├── RcppExports.cpp    # Exports Rcpp pour l’interfaçage avec R  
│   ├── RcppExports.o      # Fichier objet compilé  
│   ├── game.cpp           # Code C++ principal du jeu  
│   ├── game.o             # Fichier objet compilé  
│   ├── init.c             # Initialisation du package en C  
│   ├── init.o             # Fichier objet compilé  
│  
│── .Rbuildignore          # Liste des fichiers à ignorer lors de la construction du package  
│── .gitignore             # Fichiers à ignorer dans Git  
│── DESCRIPTION            # Métadonnées du package R  
│── JeuTAKUZU.Rproj        # Fichier de projet RStudio  
│── NAMESPACE              # Liste des fonctions exportées du package  
│── README.md              # Documentation principale du dépôt  
│── test.R                 # Script de test  
