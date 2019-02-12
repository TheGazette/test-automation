Feature: (GCP-REG-T017) verify company customisation

  Scenario: verify customised profile is in pending state
    Given I am on the site homepage
    When I click signin_link
    And I enter credentials as HCCLEGAL@mailhog.com, with a password of _password_
    And I click signin_button
    And I select my_company_xpath from my_gazette_menu
    And I click company_status
    And I click edit_company_profile_link
    And I fill in the form
      | fieldName        | fieldValue     | fieldType |
      | #websiteUrl      | www.google.com | text      |
      | #telephoneNumber | 07964806666    | text      |
    And I page down from #telephoneNumber
    And I click customise_company_submit
    And I verify company_profile_status is Published and pending customisation approval
    And I click company_status
    And I verify company_page_company_website is www.google.com
    And I verify company_page_company_telephone is 07964806666
    And I navigate to /sign-out
    And I navigate to /sign-in
    And I fill in #user-email as gazad@mailhog.com
    And I fill in #user-password as _password_
    And I click signin_button
    And I select company_customisations_xpath from my_gazette_menu
    And I fill in #free-text as HCC LEGAL
    And I click update_search_results_button
    And I click first_search_result
    #the previous condition was better but will need code change to add the href attribute
    Then I verify company_customisation_approval_website is www.google.com
    And I verify company_customisation_approval_telephone is 07964806666
    Then I click company_customisation_approve
    Then I click company_customisation_submit
    Then I click company_customisation_approved_list
    And I fill in #free-text as HCC LEGAL
    And I click update_search_results_button
    Then first_search_result should be present

