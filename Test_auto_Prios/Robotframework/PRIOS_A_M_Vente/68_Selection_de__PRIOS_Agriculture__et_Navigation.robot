# Automation priority: null
# Test case importance: Low
*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_68_SETUP}	Get Variable Value	${TEST 68 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_68_SETUP is not None	${__TEST_68_SETUP}

Test Teardown
	${__TEST_68_TEARDOWN}	Get Variable Value	${TEST 68 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_68_TEARDOWN is not None	${__TEST_68_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Sélection de "PRIOS Agriculture" et Navigation
	[Setup]	Test Setup

	Given L'utilisateur se trouve sur la page "Plateformes métier"
	When L'utilisateur sélectionne l'option "PRIOS Agriculture"
	Then Il est redirigé vers une nouvelle page avec les menus de navigation

	[Teardown]	Test Teardown