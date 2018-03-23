Feature: Edit my role in my project

  As a User
  I want to edit my role in my project. I have to choose one of three types role: Manager, Developer or Reporter.

  @positive
  Scenario: Positive Edit my role in my project
    Given I am on Registration page
    And I submit registration form with valid data
    And I create project
    When I edit my role from: manager to: developer
    Then I edited my role in my project for a: Developer