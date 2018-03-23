Feature: Add user in project

  As a User
  I want to add another user to my project

  @positive
  Scenario: Positive Add user in project
    Given I am on Registration page
    And I submit registration form with valid data
    And I create project
    When I add to my project another user
    Then I see expected message