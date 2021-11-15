# scriptOCprojet2

Lister les membres d'une des OU prédéfinie sur le Serveur ACME
***

# Pour Commencer
Ce script a été réalisé dans le cadre d'un projet "script 2" projet 7 pour OpenClassrooms
Le script est accompagné du fichier membregroupe.csv, comme exemple.
***

# Pré-requis
serveur Windows 2019 avec Active Directory

Création d'un fichier membregroupe.CSV encodée UF8 avec ; comme séparateur. La conversion du fichier peut etre réalisé depuis Excel.

Le fichier sera placé dans le répertoire c:\Scripts\AD_USERS

Le script fonctionne aussi bien en silencieux que en mode interactif, le détail d'utilisation est expliqué dans le paragraphe suivant.
***

# Démarrage
comment on lance le script

1.Script Silencieux
Le script se lance soit de manière silencieuse de la manière suivante ./script2.ps1 , ou ./script2.ps1 > membre.txt si l'on veut récupérer le résultat du script.

2.Script Interactif
./script2.ps1 suivi d'une lettre ou d'un mot, tout élément différent du vide. Par exemple ./script2.ps1 groupe.
Il suffit d'indiquer le numéro de l'OU dans une liste qui est affiché.

***

# Installation / Explication 
Description du script

Une seule fonction GetListeMembreGrp.

Détection d'un argument à la fin du lancement du script , si l'argument est vide, on effectue l'importation du fichier membregroupe.csv.
Dans le cadre du projet, il est demandé de donner les membres d'un seul groupe de l'OU, mais le fichier peut etre utilisé pour avoir les membres de plusieurs groupe.
Le fichier membregroupe.csv se compose du Departement comme titre , c'est à dire l'OU , et le nom de groupe à chercher. Le fichier CSV du script1github pourrait etre utliisé.
Si l'argument n'est pas vide, le script demande le nom du groupe que l'on désire, à l'aide d'une commande switch. Ensuite on obtient le résultat demandé.

Ajout d'une condition, qui teste s'il y a une erreur dans le déroulement du script.
Elle renvoi un code ok , si tout c'est dérouler correctement, ou un code 1 en cas d'erreur, avec l'explication de l'erreur $error[0] et éventuellement le code de la commande incorrecte, renvoi les Exit Code de la commande. 


***
# Fabriqué 
PowerShell
Visual Studio Code
***

# Contributeurs et Auteur
REIFFSTECK Laurent Auteur 
BINAND Olivier Mentor OpenClassrooms
***

# Licence
libre de droit
