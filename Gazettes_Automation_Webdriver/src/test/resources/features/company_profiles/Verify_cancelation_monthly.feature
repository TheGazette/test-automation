Feature: (GCP-REG-T030) Test monthly payment cancellation

  Scenario:  Test monthly payment cancellation
    Given I am logged in as test_monthly_payment@zhorachu.com, with a password of Hello123$
    And I navigate to /my-gazette/my-companies
    And I click company_profile_recurring_update
    And I wait for 10 seconds
    Then update_card_button should be present
    And cancel_payment_button should be present
    And company_profile_back_button should be present