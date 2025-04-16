## Structure du dépôt

```bash
JeuTAKUZU/  
│── R/        #Fonctions R définissant la logique du jeu et utilisées par l'application Shiny. 
│   ├── RcppExports.R       
│   ├── game.R              
│  
│── inst/                  
│   ├── app/    # Contient l'application Shiny.           
│       ├── www/           
│       │   ├── style.css  
│       ├── app.R            
│  
│── man/            #Contient la documentation des fonctions.      
│   ├── check_balance.Rd   
│   ├── check_consecutive.Rd    
│   ├── check_no_repeated.Rd     
│   ├── run_app.Rd          
│  
│── src/         # Contient le code source en C++ (Rcpp).
│   ├── JeuTAKUZU.so       
│   ├── RcppExports.cpp      
│   ├── RcppExports.o        
│   ├── game.cpp           
│   ├── game.o             
│   ├── init.c               
│   ├── init.o             
│  
│──.Rbuildignore          
│── .gitignore             
│── DESCRIPTION     # Fichier décrivant le package.       
│── JeuTAKUZU.Rproj    # Fichier de projet RStudio.    
│── NAMESPACE      # Fichier listant les fonctions exportées.         
│── README.md      #Fichier d'introduction au projet.          
│── test.R        #Fichier de test pour l'application.         
