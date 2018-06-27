# [PyDev] Projet 6 - Spécifications techniques

## _Note_

_La dernière version à jour de ce document est disponible sur [github](https://github.com/freezed/ocp6/blob/master/specification.md)._

_Ce document détaille les spécifications techniques du projet, pour une présentation plus rapide, voir la [synthèse de présentation](https://github.com/freezed/ocp6/blob/master/presentation.md)._

---
## Contexte

_OC Pizza_ est un jeune groupe de pizzeria en plein essor et spécialisé dans les **pizzas livrées ou à emporter**. Il compte déjà **5 points de vente** et prévoit d’en ouvrir au moins **3 de plus d’ici** la fin de l’année. Un des responsables du groupe a pris contact avec vous afin de mettre en place un **système informatique**, déployé dans **toutes ses pizzerias** et qui lui permettrait notamment :

- d’être plus efficace dans la **gestion des commandes**, de leur **réception** à leur **livraison** en passant par leur **préparation**
- de **suivre** en temps réel les **commandes passées** et en **préparation**
- de **suivre** en temps réel le **stock d’ingrédients** restants pour savoir quelles **pizzas sont encore réalisables**
- de proposer un **site Internet** pour que les **clients** puissent :
    * **passer** leurs **commandes**, **en plus** de la prise de commande par **téléphone** ou **sur place**
    * **payer en ligne** leur commande **s’ils le souhaitent** – sinon, ils paieront directement **à la livraison**
    * **modifier** ou **annuler** leur **commande** tant que celle-ci n’a **pas été préparée**
- de proposer un **aide mémoire** aux pizzaiolos indiquant la **recette de chaque pizza**
- **informer** ou notifier **les clients** sur l’**état de leur commande**


## Modèle fonctionnel

### Simple

![](https://raw.githubusercontent.com/freezed/ocp6/master/functional_model_light.png)

[[`sources PlantUML`]](https://github.com/freezed/ocp6/blob/master/functional_model_light.puml)


### Complet

![](https://raw.githubusercontent.com/freezed/ocp6/master/functional_model.png)

[[`sources PlantUML`]](https://github.com/freezed/ocp6/blob/master/functional_model.puml)


## Composant

![](https://raw.githubusercontent.com/freezed/ocp6/master/component.png)

[[`sources PlantUML`]](https://github.com/freezed/ocp6/blob/master/component.puml)


## Déploiement

![](https://raw.githubusercontent.com/freezed/ocp6/master/deployment.png)

[[`sources PlantUML`]](https://github.com/freezed/ocp6/blob/master/deployment.puml)
