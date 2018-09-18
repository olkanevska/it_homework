Feature: Registration

  As a User
  I want to be registered on the website

  @positive,@registration
  Scenario: Positive Registration
    Given I am on Registration page
    When I submit registration form with valid data
    Then I see expected message
    And I am logged in after registration