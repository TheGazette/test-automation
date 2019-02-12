Feature: (GA-052) Upload XML, card payment, Admin Users
  In order to place Gazette notices, I want to be able to upload and publish XML, so that website users may see the published notice

  Scenario Outline: Login and check if I can place a notice
    Given I am logged in as <username>, with a password of <password>
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I update the xml file <file> to have the correct publication date
    And I update MEETING_DATE in the xml file <file> to be 10 days from current date
    And I update DATE_OF_HEARING in the xml file <file> to be 20 days from current date
    And I upload the file <file> to xml_upload
    And I click upload_xml_file_button
    And I wait up to 18 minutes for validation_errors to appear
    Then validation_errors should say There are no validation errors in this bundle
    And I click continue_button
    And I click publish_notices
    Then main_title should say Your bundle has been sent for publication

    Examples:
      | username             | password  | file                                 |
      | gazad@mailhog.com | _password_ | \\place_a_notice\\PPL_Bundle_LON.xml |
      | gazad@mailhog.com | _password_ | \\place_a_notice\\PPL_Bundle_ED.xml  |
      | gazad@mailhog.com | _password_ | \\place_a_notice\\PPL_Bundle_BEL.xml |
	