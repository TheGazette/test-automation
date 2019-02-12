Feature: (GCP-REG-T026) Test payment failure

  Scenario: Test payment failure
    Given I am logged in as premier_agencies@mailhog.com, with a password of Password1!
    And I empty the basket if not empty before I add more items
    And I navigate to /my-gazette/companyprofile/customisation/11186565
    And I click company_profile_select_monthly
    And I click company_profile_add_to_basket
    And I verify company_profile_annual_total is £23.99
    And I click company_profile_pay_by_card
    And I wait for 1 minutes
    And I fill in the form
      | fieldName   | fieldValue       | fieldType |
      | card_number | 4444444444444448 | text      |
    And I wait for 20 seconds
    And I fill in the form
      | fieldName          | fieldValue | fieldType |
      | card_security_code | 888        | text      |
      | card_expiry_month  | 12         | text      |
      | card_expiry_year   | 2018       | text      |
    And I click continue_payment
    And I wait for 1 minutes
    And I click #btn_merch_Cancel
    And I verify payment_failure_header is Card Payment Failed
