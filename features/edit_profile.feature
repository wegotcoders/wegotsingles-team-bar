Feature: Edit profile
  
  Background:
    Given A customer has previously registered 
      And A customer is signed in
      And They have created a profile
      And They are on their profile page

  Scenario: A customer indicates whether they drink on their profile
    Given They click the "Edit Profile" link
      And They are on the edit profile page
    When They enter their drinking status
      And They click "Save"
    Then They see the message "Your profile has been updated!"  
