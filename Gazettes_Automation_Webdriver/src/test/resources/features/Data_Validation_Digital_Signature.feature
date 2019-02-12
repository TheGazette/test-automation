Feature: (GA-031,032,033) Data Validation (Digital signatures)
  In order to validate a notice, I need to get the digital signature of notice and validate using validator tool 
 
  @cleanDownloadsDirectory
  Scenario: View website and download digital signature and signed html notice
    Given I am on the site homepage
    When I click all_notices
    And I click view_full_notices
    And I click signed_document_link
    And I click signature_link
    And I wait for 2 minutes
    Then signed document and signature files should be downloaded to my downloads directory

 Scenario Outline: Validate digital signature and signed html notice for valid documents
    Given I am on the site homepage
    When I click data_link
    And I click validation_main_link
    And I upload signed_document_input and a valid signature_input
	And I click validate_button
    Then validation_result should say <validation_result_text>
    
      Examples:
    | validation_result_text 			| 
    | The digital signature on the notice file you just uploaded confirms that the information has originated from the trusted signer and has not been altered.  |

		 
 Scenario Outline: Validate digital signature and signed html notice for invalid signature document
    Given I am on the site homepage
    When I click data_link
    And I click validation_main_link
    And I upload signed_document_input and an invalid signature_input
    And I click validate_button
    Then validation_result should say <validation_result_invalid_text>
    
      Examples:
    | validation_result_invalid_text 			| 
    | The uploaded digital signature is invalid for the uploaded file. 		|