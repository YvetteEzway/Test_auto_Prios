# Automation priority: null
# Test case importance: Low
*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_75_SETUP}	Get Variable Value	${TEST 75 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_75_SETUP is not None	${__TEST_75_SETUP}

Test Teardown
	${__TEST_75_TEARDOWN}	Get Variable Value	${TEST 75 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_75_TEARDOWN is not None	${__TEST_75_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Création d'un Nouvel Ordre de Livraison
	[Setup]	Test Setup

	Given L'utilisateur est sur la page des sous-fonctions d'ordres de livraison
	When L'utilisateur clique sur le bouton "+"
	Then L'utilisateur est redirigé vers un formulaire pour ajouter un nouvel ordre de livraison
	And L'utilisateur saisit le Preneur d'ordre et sélectionne un type d'ordre de livraison
	Then Le formulaire est rempli avec les informations saisies

	[Teardown]	Test Teardown