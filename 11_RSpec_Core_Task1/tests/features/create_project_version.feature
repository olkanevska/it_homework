Feature: Create in my project new version

  As a User
  I want to create in my project new version

  @positive,@whit_registration
  Scenario: Positive Create project version
    Given I am on Login page
    And I submit valid credentials
    And I create project
    When I create project version
    Then I see expected message