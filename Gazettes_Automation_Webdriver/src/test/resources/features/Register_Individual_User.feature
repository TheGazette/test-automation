Feature: (GA-020) Register individual user
  As a research user i am permitted to save notices, create bespoke Gazette PDFs and purchase commemorative editions.

  Scenario: Register individual user (GA-020)
    Given I go to register as individual user
    And I fill in the form
      | fieldName                  | fieldValue  | fieldType |
      | registration_title_xpath   | Mr          | select    |
      | #register-familyName       | Familyname  | text      |
      | #register-firstName        | firstname   | text      |
      | #register-email            | Indv        | email     |
      | #register-telephone        | 07964806666 | text      |
      | #register-telephone        | 07964806666 | text      |
      | #register-password         | Passw0rd@1  | text      |
      | #register-password-confirm | Passw0rd@1  | text      |
      | #address-finder-postcode   | SE15SS      | text      |
    And I click registration_address_lookup
    And I click registration_address_select
    And I click registration_address_select_button
    And I fill in captcha field #captcha
    And I click individual_accept_terms
    And I click individual_submit
    Then I verify registration_confirmation_header is Registration successful: check your email
    Then I go to temp mail website and change temp mail
#    And I wait up to 2 minutes for temp_mail_subject to appear
    And I find temp mail having subject Gazettes registration confirmation
    And I confirm registration
    And I switch to next window
    And I fill in #user-email as email
    And I fill in #user-password as Passw0rd@1
    And I click signin_button
    Then I am taken to all-notices page
    And I navigate to /notice/540966
    And I click research_save_notice
    And I wait for 10 seconds
    And I page_up from element id research_save_notice
    And I wait for 3 seconds
    And I select saved_notices from my_gazette_menu
    Then I am taken to my-gazette/notice page
    And Notices under the Trustee Act 1925 should be present in research_saved_notice
    Then I click bespoke_gazette_link
    And I fill in #name as title
    And I click create_gazette_button
    And I wait for 5 seconds
    Then a file called title.pdf should be downloaded to my downloads directory
    Then I navigate to /my-gazette/place-notice/belfast/2903/online-form
    And Place a Deceased Estates Notice should be present in header_2903_webform