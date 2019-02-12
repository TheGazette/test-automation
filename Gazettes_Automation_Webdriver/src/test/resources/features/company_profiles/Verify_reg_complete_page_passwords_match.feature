Feature: (GCP-REG-T003)(GCP-REG-T006) Registration complete and wrong retype password by registered director

  Scenario: Password setting functionality with wrong retype password by registered director
    Given I go to a random company profile page
    And I randomly click a company_link
    And I click register_company_profile_button
    And I fill in the form
      | fieldName                | fieldValue  | fieldType |
      | #company-TelephoneNumber | 07964806666 | text      |
      | #address-finder-postcode | se15ss      | text      |
    And I click register_company_address_lookup
    And I click register_company_address_select
    And I click register_company_address_select_button
    And I fill in the form
      | fieldName                         | fieldValue  | fieldType |
      | #register-directorFamilyName      | DFamname    | text      |
      | #register-directorFirstName       | DFname      | text      |
      | #register-directorTelephoneNumber | 07964806666 | text      |
      | #register-directorEmail           | CP          | email     |
    And I fill in captcha field #captcha
    And I click individual_accept_terms
    And I click individual_submit
    Then I verify registration_successful_header is Sign up successful: check your email
    #Go to temp mail and verify click email
    Then I go to temp mail website and change temp mail
#    And I wait up to 2 minutes for temp_mail_subject to appear
    And I find temp mail having subject The Gazette company profile registration
    And I confirm registration
    And I wait for 5 seconds
    And I switch to next window
    And I wait for 5 seconds
    And I fill in the form
      | fieldName          | fieldValue  | fieldType |
      | #register-password | P@ssword01  | text      |
      | #password-confirm  | P@ssword123 | text      |
    And I click register_cp_accept_terms
    And I click register_activate_cp
    Then I verify cp_password_match is Enter the same password as above.
