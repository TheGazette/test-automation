Feature: Changing director details - Admin verifies and approves new director details,then new director is able to customize company profile
  in the same payment window

  Scenario:Changing director details in company profile and verifying the documents uploaded
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
    And I wait for 5 seconds
    And I switch to next window
    And I wait for 5 seconds
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
    Then I navigate to /company/'my note'
    And I click edit_company_profile_link
    And I click company_profile_add_to_basket
    And I verify company_profile_annual_total is £210.00
    And I click company_profile_pay_by_card
    And I wait for 1 minutes
    And I fill in the form
      | fieldName   | fieldValue       | fieldType |
      | card_number | 4444444444444448 | text      |
    And I wait for 20 seconds
    And I fill in the form
      | fieldName          | fieldValue | fieldType |
      | card_security_code | 000        | text      |
      | card_expiry_month  | 12         | text      |
      | card_expiry_year   | 2018       | text      |
    And I click continue_payment
    And I wait for 1 minutes
    And I verify company_profile_order_confirm_company_id is 'my note'
    And I click company_profile_confirm_order
    Then I am taken to confirmation page
    Then I navigate to /my-gazette/companyprofile/customisation/'my note'
    Then I navigate to /sign-out
    And I navigate to /sign-in
    And I fill in #user-email as email
    And I fill in #user-password as P@ssword01
    And I click signin_button
    And I wait for 5 seconds
    And I select my_account from my_gazette_menu
    And I click edit_profile_link
    And I fill in the form
      | fieldName   | fieldValue | fieldType |
      | #familyName | NewDLName  | text      |
      | #firstName  | NewDFName  | text      |
    And I click company_profile_account_settings_save_changes
    And I wait for 5 seconds
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
    And I click verify_claim_button
    Then I verify director_changes_awaiting_details_heading contains text Awaiting additional details submission
    Then I go to temp mail website and change temp mail
#    And I wait up to 2 minutes for temp_mail_subject to appear
    And I find temp mail having subject Your new company profile details need further verification
    And I confirm registration
    And I wait for 5 seconds
    And I switch to next window
    And I wait for 5 seconds
    And I upload the file \\company_profiles\\sample_id.docx to #uploadPersonalId
    And I upload the file \\company_profiles\\sample_address.docx to #uploadCompanyId
    And I fill in captcha field #captcha
    And I click upload_additional_docs_agree_terms_checkbox
    And I click upload_additional_docs_button
    Then I verify registration_page_header contains text Additional details upload successful
    And I go to temp mail website and change temp mail
#    And I wait up to 2 minutes for temp_mail_subject to appear
    And I find temp mail having subject The Gazette company profile registration
    And I confirm registration
    And I wait for 5 seconds
    And I switch to next window
    And I wait for 5 seconds
    And I fill in change_password_input_field as Password1!
    And I fill in confirm_password_input as Password1!
    And I click i_agree_checkbox
    And I click complete_registration_button
    Then I verify password_changed_heading contains text Password setup successful
    And I navigate to /sign-in
    And I fill in #user-email as gazad@mailhog.com
    And I fill in #user-password as _password_
    And I click signin_button
    And I wait for 5 seconds
    And I select changes_of_director_link from my_gazette_menu
    And I fill in #free-text as 'my note'
    And I click update_results_button
    And I click first_search_result
    And I click new_director_personaId_not_required_radio
    And I click new_director_address_proof_not_required_radio
    And I click approve_claim_button
    Then I am taken to director-detail-updates?status=pending-verification page
    And I navigate to /sign-in
    And I fill in #user-email as email
    And I fill in #user-password as Password1!
    And I click signin_button
    And I wait for 5 seconds
    And I select my_company_xpath from my_gazette_menu
    And I click company_profile_my_company_link
    And I wait for 10 seconds
    Then edit_company_profile_link is present
    And I click edit_company_profile_link
    And I fill in #websiteUrl as www.google.com
    And I click customise_company_submit
    Then I am taken to my-gazette/my-companies page
    And I click company_profile_my_company_link
    And I wait for 5 seconds
    Then I verify company_page_company_website contains text www.google.com