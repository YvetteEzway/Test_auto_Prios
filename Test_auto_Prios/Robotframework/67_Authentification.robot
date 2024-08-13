# Automation priority: 1
# Test case importance: Very high
*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_67_SETUP}	Get Variable Value	${TEST 67 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_67_SETUP is not None	${__TEST_67_SETUP}

Test Teardown
	${__TEST_67_TEARDOWN}	Get Variable Value	${TEST 67 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_67_TEARDOWN is not None	${__TEST_67_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Authentification
	[Setup]	Test Setup

	Given L'utilisateur est sur la page de connexion
	When L'utilisateur saisit "prios.qa1@prios.fr" dans le champ de texte pour l'email
	And L'utilisateur clique sur le bouton valider
	And L'utilisateur saisit "Ezw@171M" dans le champ de texte pour le mot de passe
	And L'utilisateur clique sur le bouton de connexion
	Then L'utilisateur est redirigé vers la page d'accueil
	Given testtt

	[Teardown]	Test Teardown