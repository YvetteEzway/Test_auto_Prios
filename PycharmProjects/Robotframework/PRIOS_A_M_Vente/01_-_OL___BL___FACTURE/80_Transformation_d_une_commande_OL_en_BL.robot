# Automation priority: null
# Test case importance: Low
*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_80_SETUP}	Get Variable Value	${TEST 80 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_80_SETUP is not None	${__TEST_80_SETUP}

Test Teardown
	${__TEST_80_TEARDOWN}	Get Variable Value	${TEST 80 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_80_TEARDOWN is not None	${__TEST_80_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Transformation d'une commande OL en BL
	[Setup]	Test Setup

	Given L'utilisateur est connecté
	And La commande OL a été créée
	And L'utilisateur se trouve sur le menu de l'application PRIOS
	When L'utilisateur clique sur "PRIOS A-M Ventes"
	Then L'affichage de la page présente les fonctions suivantes dans la première partie de la deuxième colonne : Tarifs ventes, Valorisation transports, Engagements, Incorporations, Aliments/Achats Céréales, Ordres de livraison, Ordonnances, Tournées
	Then L'affichage de la page présente les fonctions suivantes dans la seconde partie de la deuxième colonne : Bon de livraison, Facturation, Prévisions, Commissions / Ventes, Ristournes
	When L'utilisateur choisit "Ordres de livraison" dans la deuxième colonne
	Then Les fonctions suivantes apparaissent dans la première partie de la troisième colonne : Ordres de livraison, OL par Produit, OL par Tiers, Contrôle des OL, Export Excel, Besoins par produit, Planifications OL, Cadencier
	Then Les fonctions suivantes apparaissent dans la seconde partie de la troisième colonne : Livraison sur OL, Visual Planning, Envoi des OL vers Syst. Ext, Rapports
	When L'utilisateur sélectionne "Ordres de livraison" dans la troisième colonne
	Then L'utilisateur est redirigé vers un formulaire contenant une liste des 'Ordres de livraison'
	When L'utilisateur clique sur le bouton 'Loupe'
	Then La liste des OL se met à jour avec les données pour chaque ordre livraison
	When L'utilisateur sélectionne un OL créé dans l'étape précédente avec le statut "Validée"
	Then Le formulaire d'ordre de livraison est affiché avec les champs initialisés: Preneur d'ordre,Type d'ordre de livraison, Site,Date de livraison souhait,Date de départ,Date de l'ordre de livraison, Moment
	When L'utilisateur clique sur "Détails" puis continue
	Then L'utilisateur est redirigé vers la fenêtre de détails de l'ordre de livraison
	When L'utilisateur clique sur "Validation Particulière"
	Then Un pop-up de validation particulière s'affiche avec les cases à cocher:En attente, En attente de validation du responsable, En attente d'ordonnance, En attente pour cause de litige, Validée et BL généré
	When L'utilisateur coche 'Validée et BL généré' puis clique sur "Enregistrer"
	Then Deux documents PDF (OL et BL) sont affichés contenant les informations pour l'ordre de livraison et le Bon de livraison
	When L'utilisateur vérifie le statut dans la liste des OL
	Then Le statut affiché est "Validée et BL généré"
	When L'utilisateur prend note du numéro de bon de livraison
	Then Le numéro de bon de livraison est enregistré

	[Teardown]	Test Teardown