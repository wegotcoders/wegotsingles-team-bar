Feature: Messages

  Background:
    Given A customer has previously registered
      And There are registered customers
      And The customer has a profile
      And A customer is signed in
      And They have been sent at least one message
    
  Scenario: A Customer sees a list of messages in their inbox
    Given They visit their profile page
      And They click the "Inbox" link
    Then They can view all of their messages

  Scenario: A Customer replies to a message in their inbox
    Given They visit their profile page
      And They click the "Inbox" link
    When They enter text to the reply text field
      And They hit the reply button
    Then They should see an indication that the message has been sent

  Scenario: A customer sees the previous conversation history when they see a message
    Given They have several messages in a conversation
      And They visit their profile page
      And They click the "Inbox" link
    When They select a message
    Then They see the previous messages with that user
