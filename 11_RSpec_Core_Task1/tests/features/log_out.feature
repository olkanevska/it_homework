Feature: Logout

  As a User
  I want to be able to logout

  @positive,@whit_registration
  Scenario: Positive Logout
    Given I am on Login page
    And I submit valid credentials
    When I'm log out
    Then I'm logged out