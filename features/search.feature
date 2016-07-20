Feature: Searching

  Background: 
    Given there are some registered profiles
      And they are on the search page
      And they fill in the search form with a gender preference
      And they click on 'Search'
  
  Scenario: Searching by gender
    Then they should see a list of relevant results

  Scenario: Filtering by Ethnicity
    When they filter by Ethnicity
    Then they should only see results relevant to ethnicity filter

  Scenario: Filtering by age range
    When they filter by age range
    Then they should only see results relevant to age range filter
    
  @wip
  Scenario: Filtering by distance from a given location
    When they filter by distance from a given location
    Then they should only see results relevant to the location filter