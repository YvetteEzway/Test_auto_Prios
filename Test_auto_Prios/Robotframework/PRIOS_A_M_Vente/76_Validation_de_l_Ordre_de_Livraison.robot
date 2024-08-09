# Automation priority: null
# Test case importance: Low
*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_76_SETUP}	Get Variable Value	${TEST 76 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_76_SETUP is not None	${__TEST_76_SETUP}

Test Teardown
	${__TEST_76_TEARDOWN}	Get Variable Value	${TEST 76 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_76_TEARDOWN is not None	${__TEST_76_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Validation de l'Ordre de Livraison
	[Setup]	Test Setup

	Given Les produits sont ajoutés à l'ordre de livraison
	When L'utilisateur clique sur le bouton 'Valider'
	Then Une fenêtre de confirmation s'affiche avec les détails de la livraison
	And L'utilisateur clique sur 'Enregistrer'
	Then Un document PDF est généré avec les informations de l'ordre de livraison

	[Teardown]	Test Teardown