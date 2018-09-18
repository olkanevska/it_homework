Feature: Add user in project

  As a User
  I want to add another user to my project

  @positive,@whit_registration
  Scenario: Positive Add user in project
    Given I am on Login page
    And I submit valid credentials
    And I create project
    When I add to my project another user
    Then I see expected message