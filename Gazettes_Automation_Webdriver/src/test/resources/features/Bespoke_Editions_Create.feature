Feature: (GA-017) Download a bespoke Gazette
  In order view notices I select myself in PDF format, I want to be able to compile a bespoke Gazette
 
  Scenario: Create a bespoke Gazette (GA-017)
   Given I am logged in as research_css@mailhog.com, with a password of _password_
   When I select saved_notices from my_gazette_menu
   And a_saved_notice is present
   And I click create_bespoke_gazette_link
   And I fill in bespoke_gazette_title as Title
   And I click create_bespoke_gazette_button
   And I wait for 2 minutes
   Then a file called Title.pdf should be downloaded to my downloads directory
   

   