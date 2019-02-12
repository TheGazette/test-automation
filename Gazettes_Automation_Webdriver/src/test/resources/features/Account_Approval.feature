@ignored
Feature: Account Management as Admin user 
  In order to approve/decline new account, I want to be able to select that option
 
   Scenario: Login and check if I can approve a new account 
    Given I am logged in as gazad@mailhog.com, with a password of _password_
    And I select my_acccount_link from my_gazette_menu
    And I click accountLink
    And awaiting_VerificationUser is present
    And I click awaiting_VerificationUser
    And I click verify_comp_address
    And I click verify_email
    And I click approve_user_button
    Then account_approved_text should say Organisation details updated successfully.
    
   Scenario: Login and check if I can decline a new account 
    Given I am logged in as gazad@mailhog.com, with a password of _password_
    And I select my_acccount_link from my_gazette_menu
    And I click accountLink
    And awaiting_VerificationUser is present
    And I click awaiting_VerificationUser
    And I click decline_user_button
    And I fill in the form 
      | fieldName     |  fieldValue         | fieldType |
      | decline_input | Testing Decline     | text      |
    And I click decline_user_button
   Then maintain_org_title should say Maintain organisation account (Declined)