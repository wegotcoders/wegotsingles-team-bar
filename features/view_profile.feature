Feature: View Profile
@wip
  Scenario: A customer views someone's profile
    Given A customer has previously registered
      And They have created a profile
      And A customer is signed in
    When They click on another customers profile
    Then They see the customers profile details

