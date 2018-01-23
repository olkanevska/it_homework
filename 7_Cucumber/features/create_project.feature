Feature: Create project

  As a User
  I want to create project on the website as a registered user

  @positive
  Scenario: Positive Create project
    Given I am on Registration page
    And I submit registration form with valid data
    When I create project
    Then I see expected message