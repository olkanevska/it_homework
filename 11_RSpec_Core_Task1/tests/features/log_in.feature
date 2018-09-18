Feature: Login

  As a User
  I want to be able to login

  @positive,@whit_registration
  Scenario: Positive Login
    Given I am on Login page
    And I submit valid credentials
    Then I am logged in