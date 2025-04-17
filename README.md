## Jeux-du-Takuzu-application-Shiny

Le jeu de Takuzu également connu sous le nom de Binairo ou Binaire,est un jeu de logique avec des règles simples et des solutions complexes se jouant sur un plateau carré de  n x n cases.Chaque case ne peut contenir un 0 ou 1,les régles sont les suivantes:
- Chaque ligne et chaque colonne doivent contenir autant de 0 que de 1.
- Il est interdit d’avoir trois 0 ou trois 1 consécutifs dans une ligne ou une colonne.
- Deux lignes ou deux colonnes identiques sont interdites dans la même grille.

Exemple, passant d'une grille partiellement pré-remplie à une grille remplie :
<div align="center">
  <img src="takuzu.png" width="400">
</div>


## Installation et exécution

### Cloner le dépôt
Pour récupérer le projet sur votre machine locale, ouvrez R-studio et utilisez cette commande suivante dans le terminal :

```sh
git clone https://github.com/LamiaOulebsir/JeuTAKUZU.git
```
### Installer les packages necessaires

```r
install.packages(c("shiny", "shinyjs"))
```

### Charger la librairie
Dans la console R, se positionner dans le répertoire du dépôt cloné. Ensuite charger la librairie.

```r
library(JeuTAKUZU)
```

### Lancer l'application

```r
run_app()
```
Si la fonction run_app() n'est pas reconnue, utiliser la commande :

```r
devtools::load_all()
```

Ou, aller dans le dossier inst/app , puis le fichier app.R et cliquer sur le bouton Run App !


## Auteurs
- [Lamia Oulebsir](https://github.com/LamiaOulebsir)
- [Naima Radouan](https://github.com/NaimaRadouan)

Ce package est sous licence MIT.  
Consultez le fichier [LICENSE](LICENSE) pour plus d'informations.

