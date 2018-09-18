Feature: Edit my role in my project

  As a User
  I want to edit my role in my project. I have to choose one of three types role: Manager, Developer or Reporter.

  @positive,@whit_registration
  Scenario: Positive Edit my role in my project
    Given I am on Login page
    And I submit valid credentials
    And I create project
    When I edit my role to: developer
    Then I edited my role in my project for a: Developer