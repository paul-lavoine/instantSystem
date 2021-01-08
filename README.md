# InstantSystem

Creadition date:
06/01/2021

Architecture: Design pattern MVVM. Celà permet un découplage des fichiers qui facilitent d’éventuels tests.
Le pattern coordinator a été aussi implémenté, afin de gérer la navigation. 

Amélioration: Pour vraiment pousser ce pattern jusqu’au bout il aurait fallu utiliser un système de dépendance à l’aide des protocoles qui permettent de donner l’accès à certaines partis de l’app. Au vu de la simplicité de l’application je n’ai pas jugé utile de l’ajouter.


Network: Utilisation du pod Moya, une surcouche d’Alamofire. 
Je ne suis pas partisan de refaire la roue quand ce n’est pas nécessaire et pour avoir souvent travaillé avec ce pod, il est simple d’utilisation et répond facilement à tous les standards que peut nécessiter une petite application mobile.


Data: Une fois les données récupérées, elles sont parsées à l'aide du pod XMLParsing. le site des numériques retourne un fichier XML et donc je n’ai pas pu utiliser Codable. Cependant, XMLParsing est basé sur Codable. La déclaration du modèle est la même ainsi que la façon de parser les données.

Amélioration: Le format du fichier XML fait que je n’ai pas eu besoin de gérer les optionnels dans le modèle (car il y en avait pas). Je me suis donc calqué sur les données que je recevais. Mais on n'est pas à l'abri que certaines données soient optionnelles.


Model: L’extension créé “Post+Utils.swift” n’est pas superflu. Dans une approche d’automatisation, il est possible de générer les fichiers du modèle. Ainsi il me suffit de faire un drag & drop pour remplacer les fichiers sans avoir à recopier toutes les possibles méthodes associées.


=========================
=========================


## Tools version
- OSx Catalina (10.15.7)
- Xcode 12.3
- Cocoapods 1.8.4
- After effect 2020

## Languages
- iPhone only
- iOS 13+

## Target devices
- Smartphone only
- iOS 13.0 or higher

## Tested devices
- iPhone 8

## Team
[Paul Lavoine](mailto:paul.lavoine91@gmail.com)
