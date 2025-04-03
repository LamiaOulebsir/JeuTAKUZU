## Structure du dépôt

```bash
JeuTAKUZU/  
│── R/                    
│   ├── RcppExports.R       
│   ├── game.R              
│  
│── inst/                  
│   ├── app/               
│       ├── www/           
│       │   ├── style.css  
│       ├── app.R            
│  
│── man/                   
│   ├── check_balance.Rd   
│   ├── check_consecutive.Rd    
│   ├── check_no_repeated.Rd     
│   ├── run_app.Rd          
│  
│── src/                    
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
│── DESCRIPTION            
│── JeuTAKUZU.Rproj         
│── NAMESPACE               
│── README.md                
│── test.R                 
