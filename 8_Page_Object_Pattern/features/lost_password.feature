Feature: Lost password

  As a User
  I want the lost password to be restored

  @positive
  Scenario: Positive Lost password
    Given I am on Registration page
    And I submit registration form with valid data
    And I'm log out
    And I am on Login page
    When I restore the password
    Then I see expected message
