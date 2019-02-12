Feature: (GCP-REG-T009) Company number validation with incorrect company number on Registration page

  Scenario: There should be an error if company number is incorrect
    Given I navigate to /my-gazette/account?register=true&type=company_profile
    And I fill in the form
      | fieldName                | fieldValue      | fieldType |
      | #organisation-regno      | 14514           | text      |
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
    Then I verify company_profile_reg_error is The information for company name and/or number does not match that listed with Companies House.
