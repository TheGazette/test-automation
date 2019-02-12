Feature: Select place notice as Organisational user – Central Gov’t
  In order to place Gazette notices, I want to be able to select that option
 
   Scenario: Login and check if I can place a notice 
    Given I am logged in as cgorg_css@mailhog.com, with a password of _password_
    And I empty the basket if not empty before I add more items
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I update the xml file \\place_a_notice\\CourtsSep03_test.xml to have the correct publication date
    And I update DATE_OF_HEARING in the xml file \\place_a_notice\\CourtsSep03_test.xml to be 20 days from current date
    And I upload the file \\place_a_notice\\CourtsSep03_test.xml to xml_upload
    And I click upload_xml_file_button
    And I click continue_button
    And I click add_all_to_basket
    And I click go_to_checkout
    And I click payment_not_required
    And I click confirm_order