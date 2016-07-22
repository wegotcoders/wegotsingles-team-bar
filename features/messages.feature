Feature: Messages

  Background:
    Given A customer has previously registered
      And There are registered customers
      And The customer has a profile
      And A customer is signed in
      And They have been sent at least one message
      And They visit their profile page
      And They click the "Inbox" link
    
  Scenario: A Customer sees a list of messages in their inbox
    Then They can view all of their messages

  Scenario: A Customer replies to a message in their inbox
    When They enter text to the reply text field
      And They hit the reply button
    Then They should see an indication that the message has been sent
