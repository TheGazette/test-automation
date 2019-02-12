Feature: (GA-056,057) Manage images
  In order to have a logo appear in an Excel upload, I want to be able to manage my image repository
 
   Scenario: Upload image
    Given I am logged in as laworg_css@mailhog.com, with a password of _password_
    And I select my_image_link from my_gazette_menu
    And I click upload_image_link
    And I upload the file \\tso.png to choose_image
    And I click upload_button
    Then image_upload_text should say Image Upload
    And I click return_to_images
    
   Scenario: Download image
    Given I am logged in as laworg_css@mailhog.com, with a password of _password_
    And I select my_image_link from my_gazette_menu
    And I click action_link
    And I click download_image_link
    And I wait for 2 minutes
    Then a file called 1.png should be downloaded to my downloads directory
    
    Scenario: Delete image
    Given I am logged in as laworg_css@mailhog.com, with a password of _password_
    And I select my_image_link from my_gazette_menu
    And I click action_link
    And I click delete_image_link
    And I click delete_image_button