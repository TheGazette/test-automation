Feature: (GCP-REG-T007) Test the functionality to claim a already claimed company

  Scenario: There should be an error if we try to register an already claimed company
    Given I navigate to /my-gazette/account?register=true&type=company_profile
    And I fill in the form
      | fieldName                | fieldValue      | fieldType |
      | #organisation-regno      | 10940907        | text      |
      | #organisation-name       | TAG DENT MD LTD | text      |
      | #company-TelephoneNumber | 07964806666     | text      |
      | #address-finder-postcode | se15ss          | text      |
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
    Then I verify company_profile_reg_error is A registration claim for this company number has already been submitted. If you have any questions please contact customer services.
