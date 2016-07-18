Feature: Searching

  Background: 
    Given there are some registered profiles
      And they are on the search page

  Scenario: Searching by gender
    When they fill in the search form with a gender preference
      And they click on 'Search'
    Then they should see a list of relevant results
    
