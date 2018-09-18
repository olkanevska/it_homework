Feature: Create bug issue.

  As a User
  I want do random actions bug issue.
  @positive,@whit_registration
  Scenario: Positive Create bug issue and add watcher
    Given I am on Login page
    And I submit valid credentials
    And I create project
    When I do random actions create or not bug issue
    And I open bug issue or see error message if I did not create it before. I create new issue.
    Then I created new bug issue