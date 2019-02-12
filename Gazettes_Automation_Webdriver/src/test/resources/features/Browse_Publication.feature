Feature: In order to browse publication,  I want to be able to select that option
  
  Scenario Outline:  Wills and Probate Gazette
   Given I am on the site homepage
   When I highlight all_notices
   And I click publication_link
   And I fill in bro_WAP_edition as <DailyEdition>
   And I click bro_WAP_edition_button
   And I wait for 30 seconds
   Then a file called data.pdf should be downloaded to my downloads directory

   Examples:
    |DailyEdition               |
    |Issue - 01 April 2014      |

  #Insolvency Gazette not there anymore
   @ignored
   Scenario Outline:  London Gazette
   Given I am on the site homepage
   When I highlight all_notices
   And I click publication_link
   And I select browse_pub_london_first_option from browse_pub_london
   And I click bro_london_gazette_button
   Then pdf_label should say <pdf_label>


   Examples:
     | pdf_label        |
     |The London Gazette|
