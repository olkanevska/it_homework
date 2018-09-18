Feature: Create project

  As a User
  I want to create project on the website as a registered user

  @positive,@whit_registration
  Scenario: Positive Create project
    Given I am on Login page
    And I submit valid credentials
    When I create project
    Then I see expected message