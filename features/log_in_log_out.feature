Feature: Log In/Log Out

  Background: 
    Given a customer has previously registered
    
  Scenario: A customer signs in
    Given they are on the log in page
    When they fill out the log in form
    Then they are logged in
    
  Scenario: A customer signs out
    Given they have signed in previously
      And they are on the home page
    When they sign out
    Then they should see a farewell message



