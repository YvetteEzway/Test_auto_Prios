# Automation priority: null
# Test case importance: Low
*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_69_SETUP}	Get Variable Value	${TEST 69 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_69_SETUP is not None	${__TEST_69_SETUP}

Test Teardown
	${__TEST_69_TEARDOWN}	Get Variable Value	${TEST 69 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_69_TEARDOWN is not None	${__TEST_69_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Accès à la Fonctionnalité "Ordres de Livraison"
	[Setup]	Test Setup

	Given L'utilisateur est sur la page des menus de navigation
	When L'utilisateur clique sur "PRIOS A-M Ventes"
	Then Les sous-menus de ventes sont affichés
	And L'utilisateur sélectionne "Ordres de livraison"
	Then La troisième colonne affiche des sous-fonctions d'ordres de livraison

	[Teardown]	Test Teardown