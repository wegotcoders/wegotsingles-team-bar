Feature: Searching

  Scenario: Searching by gender
    Given they are on the search page
    When they fill in the search form with a gender preference
      And they click on 'Search'
    Then they should see a list of relevant results