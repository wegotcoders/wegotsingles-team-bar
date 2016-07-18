
Feature: View Profile

  Scenario: A customer views someone's profile
    Given A customer has previously registered
      And A customer is signed in
      And They click on another customers profile
    Then They see the customers profile details

