Feature: Create and publish PDFs for all editions 
	In order to view PDFs of the Gazette, the issues need to be published
 
Scenario Outline: Create and publish an issue 
	Given I make a request xml for a PDF issue with edition: <edition>, publication date: 0, start date time: -1, end date time: 0
	Then there are no missing notices
	And the number of notices in the issue is greater than zero
    
	Examples: 
		| edition              |
		| Insolvency           |	
		| Wills and Probate    |
		| All Notices          |
