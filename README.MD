Afin d'utiliser il faut :
- donner les droits d'execution sur le script (chmod +x)
- ajouter le chemin vers le script dans $PATH (echo PATH=$PATH:CHEMIN_VERS_LE_SCRIPT)

Ce projet a pour but d'automatiser les taches suivantes :
1. initialiser un repo git local
2. creer un repo distant sur l'espace Github avec le nom du dossier local
3. connecter le repo local au distant et pousser

Pour utiliser :
se placer dans le projet à git-ifier, puis :
	'$ gitify.sh'
