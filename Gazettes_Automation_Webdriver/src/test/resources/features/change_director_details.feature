Feature:Change director details - Old director should not be able to login anymore

  Scenario:changing director details in company profile and setting up new login credentials
    Given I go to a random company profile page
    And I randomly click a company_link
    And I click register_company_profile_button
    And I keep a note of #organisation-regno
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
    Then I go to temp mail website and change temp mail
#    And I wait up to 2 minutes for temp_mail_subject to appear
    And I find temp mail having subject The Gazette company profile registration
    And I confirm registration
    And I switch to next window
    And I fill in the form
      | fieldName          | fieldValue | fieldType |
      | #register-password | P@ssword01 | text      |
      | #password-confirm  | P@ssword01 | text      |
    And I click register_cp_accept_terms
    And I click register_activate_cp
    And I navigate to /sign-out
    And I navigate to /sign-in
    And I fill in #user-email as gazad@mailhog.com
    And I fill in #user-password as _password_
    And I click signin_button
    And I wait for 5 seconds
    And I select company_claims_xpath from my_gazette_menu
    And I verify default_company_claim_sort is Ascending
    And I fill in #free-text as 'my note'
    And I click update_search_results_button
    And I click first_search_result
    And I click verify_company_profile_registered_address
    And I click verify_company_profile_company_number
    And I click verify_company_profile_company_active
    And I click verify_company_profile_company_director
    And I click verify_company_profile_company_director_email
    And I click verify_company_profile_company_id_doc
    And I click verify_company_profile_company_address_doc
    Then I click #approveClaim
    Then I navigate to /sign-out
    And I navigate to /sign-in
    And I fill in #user-email as email
    And I fill in #user-password as P@ssword01
    And I click signin_button
    And I wait for 5 seconds
    And I select my_acccount_link from my_gazette_menu
    And I click edit_profile_link
    And I fill in the form
      | fieldName   | fieldValue | fieldType |
      | #familyName | NewDLName  | text      |
      | #firstName  | NewDFName  | text      |
    And I click company_profile_account_settings_save_changes
    And I select signout_link from my_gazette_menu
    Then I am taken to all-notices page
    And I navigate to /sign-in
    And I fill in #user-email as gazad@mailhog.com
    And I fill in #user-password as _password_
    And I click signin_button
    And I wait for 5 seconds
    And I select changes_of_director_link from my_gazette_menu
    And I fill in #free-text as 'my note'
    And I click update_results_button
    And I click first_search_result
    And I click approve_claim_button
    Then I am taken to director-detail-updates?status=pending-verification page
    Then I go to temp mail website and change temp mail
#    And I wait up to 2 minutes for temp_mail_subject to appear
    And I find temp mail having subject The Gazette company profile registration
    And I confirm registration
    And I switch to next window
    And I fill in change_password_input_field as Password1!
    And I fill in confirm_password_input as Password1!
    And I click i_agree_checkbox
    And I click complete_registration_button
    Then I verify password_changed_heading contains text Password setup successful
    Then I navigate to /sign-in
    And I fill in #user-email as email
    And I fill in #user-password as P@ssword01
    And I click signin_button
    And I wait for 5 seconds
    Then I verify incorrect_credentials_label contains text Your email and password have not been recognised, please try again

