Feature: A Customer Registers

  Scenario: A visitor provides a username when they register
    Given they are on the registration page
    When they fill in the form with valid details
    Then a Customer should be created
      
