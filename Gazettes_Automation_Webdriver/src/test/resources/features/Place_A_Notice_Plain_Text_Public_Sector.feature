@ignored
Feature: Select place notice as Organisational user – Central Gov’t
  In order to place Gazette notices, I want to be able to select Text submission
 
   Scenario: Login and check if I can place a notice 
    Given I am logged in as cgorg_css@mailhog.com, with a password of _password_
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I click text_submission_placeNotice
    And I fill in the form 
      | fieldName| fieldValue | fieldType |
      | plain_text_input | Scottish Government Lifelong Learning Directorate \n6th Floor, 5 Atlantic Quay, 150 Broomielaw, Glasgow G2 8LU \n\nThe QUEEN has been pleased by warrant under Her Majesty’s Royal Sign Manual bearing the date of 26 May 2014, to appoint Greg Walker to be Regius Professor of Rhetoric and English Literature in the University of Edinburgh which became vacant on 10 March 2014. | text |
    And I wait for 2 minutes  
    And I click plain_text_Continue_button
    And I fill in the form 
      | fieldName        | fieldValue | fieldType |
      |plain_text_pubDate| 23/06/2016 | text      |
    