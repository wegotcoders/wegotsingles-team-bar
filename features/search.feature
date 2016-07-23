Feature: Searching

  Background:
    Given there are some registered profiles
      And A customer has previously registered
      And They have created a profile
      And A customer is signed in

  Scenario: Searching by gender
    Given they are on the search page
      And they fill in the search form with a gender preference
      And they click on 'Search'
    Then they should see a list of relevant results
  
  Scenario: Searching by industry
    Given they are on the search page
      And they fill in the search form with an industry preference
      And they click on 'Search'
    Then they should only see results relevant to industry filter

  Scenario: Filtering by Ethnicity
    Given they are on the search page
      And they fill in the search form with a gender preference
      And they click on 'Search'
    When they filter by Ethnicity
    Then they should only see results relevant to ethnicity filter

  Scenario: Filtering by age range
    Given they are on the search page
      And they fill in the search form with a gender preference
      And they click on 'Search'
    When they filter by age range
    Then they should only see results relevant to age range filter

  Scenario: Filtering by distance from a given location
    Given they are on the search page
      And they fill in the search form with a gender preference
      And they click on 'Search'
    When they filter by distance from a given location
    Then they should only see results relevant to the location filter

  @wip
  Scenario: Filtering by proximity to current user
    Given they are on the search page
    When they fill in the search form with a proximity preference
      And they click on 'Search'
    Then they should only see results relevant to the proximity filter
