Feature: Lost password

  As a User
  I want the lost password to be restored

  @positive,@whit_registration
  Scenario: Positive Lost password
    Given I am on Login page
    When I restore the password
    Then I see expected message
