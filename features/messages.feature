Feature: Messages

  @wip
  Scenario: A Customer sees a list of messages in their inbox
    Given A customer has previously registered
      And There are registered customers
      And The customer has a profile
      And A customer is signed in
      And They have been sent at least one message
      And They visit their profile page
    When They click the "Inbox" link
    Then They can view all of their messages
