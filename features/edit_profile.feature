Feature: Edit profile
  
  Background:
    Given A customer has previously registered 
      And A customer is signed in
      And They have created a profile
      And They are on their profile page
      And They click the "Edit Profile" link
  Scenario: A customer indicates whether they drink on their profile
    Given They are on the edit profile page
    When They enter their drinking status
      And They click "Save"
    Then They see the message "Your profile has been successfuly updated!"  

  Scenario: A customer edits their profile biography
    Given They are on the edit profile page
      And The edit biography field is prepopulated by their biography
    When They enter the changes to their user biography
      And They click "Save"
    Then They see the message "Your profile has been successfuly updated!"
