# Automation priority: null
# Test case importance: Low
*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_72_SETUP}	Get Variable Value	${TEST 72 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_72_SETUP is not None	${__TEST_72_SETUP}

Test Teardown
	${__TEST_72_TEARDOWN}	Get Variable Value	${TEST 72 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_72_TEARDOWN is not None	${__TEST_72_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Ajout de Produits à l'Ordre de Livraison
	[Setup]	Test Setup

	Given L'utilisateur est sur la page des détails de l'ordre de livraison
	When L'utilisateur clique sur le bouton "+" pour ajouter un produit
	Then Un formulaire d'ajout de produit s'affiche dans une fenêtre pop-up
	And L'utilisateur renseigne les informations du produit
	Then Le produit est ajouté aux détails de l'ordre de livraison

	[Teardown]	Test Teardown