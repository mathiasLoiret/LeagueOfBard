
<img src="./icon.png"/>



                                                     LEAGUE OF BARD !


" League Of Bard " est une application de visualisation des champions de league of legend.

Le but de l'application est d'utiliser l'API du jeu League Of Legend disponible ici : 

https://developer.riotgames.com/api/methods

Les informations sont alors triés et affichées dans une CollectionView.

Tous les champions sont présentés et détaillés avec leur nom et leur titre.

L'application est reponsive et s'adapte parfaitement à tous les IPhones du 5 au 7.
League Of Bard est disponible en mode portrait ainsi qu'en mode paysage.

Fonctionnent :

Lors de l'ouverture de l'application on lance un appel à l'API grâce à une méthode de la classe NetworkManager.swift
Le résultat de l'appel est ensuite trié par ordre alphabétique puis affiché dans la CollectionView prinicipale.
On utilise le nom, le titre et le nom du PNG de chaque personnages. Pour permettre l'affichage du l'image un lien est créé via le nom du PNG précédement récupèré.

L'application ainsi créée est mise à jour et le restera dans le temps vu que la pertinence des données est lié aux informations renvoyées par l'API. 
