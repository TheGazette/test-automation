Feature: (GA-076, GA-077, GA-078) Test notice permanently withdrawn for all 3 editions upon publication, TSO admin user
  The notice should stay withdrawn if publish date within the injunction dates

  Scenario Outline: Setup court injection after a notice has been submitted, then remove injunction

      # Upload a notice

    Given I am logged in as gazad@mailhog.com, with a password of _password_
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I update the xml file <file> to have the correct publication date
    When I upload the file <file> to xml_upload
    And I click upload_xml_file_button
    And I wait up to 10 minutes for main_title to appear
    And I keep a note of the_notice_id
    And I click publish_this_notice
    Then main_title should say Your bundle has been sent for publication

      # Setup an injunction blocker for the company

    And I click username_toplink
    And I click court_injunctions
    And I click add_new_injunction
    And  I fill in the form
      | fieldName            | fieldValue       | fieldType |
      | court_company_name   | <Company_Name>   | text      |
      | court_company_number | <Company_Number> | text      |
      | injunction_from      | -1               | date      |
      | injunction_to        | 0                | date      |
    And I click petitions_windUp_companies
    And I upload the file \\court-injunctions\\1.pdf to upload_CI
    And I click add_new_injuctions
    And add_to_injuction_text should say <Injunction_text>

   # wait for 10 minutes and check the status of the notice uploaded

    And I select notice_placed_link from my_gazette_menu
    And I wait for 20 minutes
    And I click withdrawn
    And I fill in text_search_input as 'my note'
    And I click update_results_button
    Then the text <Company_Name> should be visible

   # remove the blocker for future tests

    And I click username_toplink
    And I click court_injunctions
    And I fill in text_search_input as <Company_Name>
    And I click update_results_button
    And I select delete_this_injunction from actions
    And I click delete

    Examples:
      | Company_Name               | Company_Number | Injunction_text        | file                                                             |
      | JET WORLDWIDE (UK) LIMITED | 07023469       | Add to injunction list | \\place_a_notice\\Lon_Court_Blocker_Inj_Notice_withdrawn.xml |
      | Studio 2080 Limited        | SC449979       | Add to injunction list | \\place_a_notice\\Ed_Court_Blocker_Inj_Notice_withdrawn.xml  |
      | GAFFNEY SHOES LIMITED      | NI608069       | Add to injunction list | \\place_a_notice\\Bel_Court_Blocker_Inj_Notice_withdrawn.xml |