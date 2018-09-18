Feature: Create bug issue and add watcher.

  As a User
  I want do random actions( create or not ) bug issue. If I created issue then add watcher. If not created issue, add issue and then add watcher.
  @positive, @whit_registration
  Scenario: Positive Create bug issue and add watcher
    Given I am on Login page
    And I submit valid credentials
    And  I create project
    And I do random actions create or not bug issue
    When I open bug issue or create new if I did not create it before
    And I add watcher to my new bug issue
    Then I created new bug issue
    And I added watcher