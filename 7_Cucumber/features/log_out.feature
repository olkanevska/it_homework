Feature: Logout

  As a User
  I want to be able to logout

  @positive
  Scenario: Positive Logout
    Given I am on Registration page
    And I submit registration form with valid data
    When I'm log out
    Then I'm logged out